String.prototype.format = function () {

				var str = this;
				for ( var i = 0; i < arguments.length; i ++ ) {

					str = str.replace( '{' + i + '}', arguments[ i ] );

				}
				return str;

			}

			var container;
			var camera, scene, renderer;
			var splineHelperObjects = [],
				splineOutline;
				//Cantidad de cubos iniciales ...
			var splinePointsLength = 2;
			var positions = [];
			var options;

			var geometry = new THREE.BoxGeometry( 20, 20, 20 );

			var ARC_SEGMENTS = 200;
			var splineMesh;

			var splines = {

			};

			init();
			animate();

			function init() {

				container = document.createElement( 'div' );
				document.body.appendChild( container );
				scene = new THREE.Scene();

				//Ubicacion de la Camara....
				camera = new THREE.PerspectiveCamera( 75, window.innerWidth / window.innerHeight, 1, 10000 );
				camera.position.z = 500;	
				//::::::::::::::::::::::::::::::			
				scene.add( camera );

				scene.add( new THREE.AmbientLight( 0xf0f0f0 ) );
				var light = new THREE.SpotLight( 0xffffff, 1.5 );
				light.position.set( 0, 1500, 200 );
				light.castShadow = true;
				light.shadow = new THREE.LightShadow( new THREE.PerspectiveCamera( 70, 1, 200, 2000 ) );
				light.shadow.bias = -0.000222;
				light.shadow.mapSize.width = 1024;
				light.shadow.mapSize.height = 1024;
				scene.add( light );
				spotlight = light;

				// scene.add( new THREE.CameraHelper( light.shadow.camera ) );

				var planeGeometry = new THREE.PlaneGeometry(2000,2000);
				planeGeometry.rotateX( - Math.PI / 2 );
				var planeMaterial = new THREE.ShadowMaterial();
				planeMaterial.opacity = 0.6; //Opacidad de la sombra

				var plane = new THREE.Mesh( planeGeometry, planeMaterial );
				plane.position.y = -200;
				plane.receiveShadow = true;
				scene.add( plane );

				
				//GRILLA

				//GridHelper( tamaño, cuadros totales a lo largo y ancho, color de la cruz del plano, color de lineas);
				var helper = new THREE.GridHelper( 1000, 26, 0x0000ff, 0x808080);
				helper.position.y = - 199; //--> Posicion en Y con respecto a los cubos mas lejos o mas cerca
				helper.material.opacity = 0.7; // --> Opacidad de las lineas de la grilla
				helper.material.transparent = true;
				scene.add( helper ); //--> Agregar a la scena la grillas

				var axis = new THREE.AxisHelper();
				axis.position.set( -500, -500, -500 );
				scene.add( axis );

				//console.log(window.innerWidth)

				renderer = new THREE.WebGLRenderer( { antialias: true } );
				renderer.setClearColor( 0xf0f0f0 ); //Fondo de la escena
				renderer.setPixelRatio( window.devicePixelRatio ); //Pixeles que va mostrar la escena 0.5 se ve borroso
				renderer.setSize( window.innerWidth, window.innerHeight ); //Ancho y alto de la escena 
				renderer.shadowMap.enabled = true;
				container.appendChild( renderer.domElement );



				var info = document.createElement( 'div' );
				
				
				info.style.position = 'absolute';
				info.style.top = '10px';
				info.style.width = '100%';
				info.style.textAlign = 'center';
				//info.innerHTML = 'catmull-rom rom spline comparisions';
				options = document.createElement( 'div' );
				options.style.position = 'absolute';
				options.style.top = '30px';
				options.style.width = '100%';
				options.style.textAlign = 'center';


				//Se pintan los Botones para agregar o quitar Cubos....
				options.innerHTML = 'Cubos: <input type="button" onclick="addPoint();" value="+" />\
					<input type="button" onclick="removePoint();" value="-" />\
					<br />\
					<br />\
					<br />\
					<br />';

				container.appendChild( info );
				container.appendChild( options );

				

				// Controls
				controls = new THREE.OrbitControls( camera, renderer.domElement );
				controls.damping = 0.2;
				controls.addEventListener( 'change', render );

				transformControl = new THREE.TransformControls( camera, renderer.domElement );
				transformControl.addEventListener( 'change', render );

				scene.add( transformControl );

				// Hiding transform situation is a little in a mess :()
				transformControl.addEventListener( 'change', function( e ) {

					cancelHideTransorm();

				} );

				transformControl.addEventListener( 'mouseDown', function( e ) {

					cancelHideTransorm();

				} );

				transformControl.addEventListener( 'mouseUp', function( e ) {

					delayHideTransform();

				} );

				transformControl.addEventListener( 'objectChange', function( e ) {


					$('#Array_Cubos').val(JSON.stringify(positions));
					updateSplineOutline();

				} );

				var dragcontrols = new THREE.DragControls( camera, splineHelperObjects, renderer.domElement ); //

				dragcontrols.on( 'hoveron', function( e ) {

					transformControl.attach( e.object );
					cancelHideTransorm(); // *

				} )

				dragcontrols.on( 'hoveroff', function( e ) {

					if ( e ) delayHideTransform();

				} )


				controls.addEventListener( 'start', function() {

					cancelHideTransorm();

				} );

				controls.addEventListener( 'end', function() {

					delayHideTransform();

				} );

				var hiding;

				function delayHideTransform() {

					cancelHideTransorm();
					hideTransform();

				}

				function hideTransform() {

					hiding = setTimeout( function() {

						transformControl.detach( transformControl.object );

					}, 2500 )

				}

				function cancelHideTransorm() {

					if ( hiding ) clearTimeout( hiding );

				}


				/*******
				 * Curves
				
*/
				var i;
				for ( i = 0; i < splinePointsLength; i ++ ) {

					addSplineObject( positions[ i ] );

				}
				positions = [];
				for ( i = 0; i < splinePointsLength; i ++ ) {

					positions.push( splineHelperObjects[ i ].position );

				}

				
				//console.log(positions);

			}

			function addSplineObject( position ) {

				var object = new THREE.Mesh( new THREE.CubeGeometry( 100, 100, 100 ), new THREE.MeshLambertMaterial( { //Tamaño de los cubos
					//color: Math.random() * 0xffffff //Colores de los cubos
					color: Math.random() * 0x00663300	 //Colores de los cubos
					} ) );
				object.material.ambient = object.material.color;
				
				if ( position ) {

					object.position.copy( position );

				} else {
					//Posiciones de los Nuevos Cubos que se van agregando X,Y,Z están cuadrados para que aparezcan solo en la parte que se desea 
					object.position.x = Math.random() * 400 - 200;
					object.position.y = Math.random() * 50;
					object.position.z = Math.random() * 200;

				}
				//Sombra de los cubos en el plano 
				object.castShadow = true;
				object.receiveShadow = true;
				scene.add( object );
				splineHelperObjects.push( object );
				return object;

			}

			function addPoint() {

				splinePointsLength ++;
				positions.push( addSplineObject()
								.position );

				updateSplineOutline();

			}

			function removePoint() {
				//Permite quitar los cubos hasta que hay 2, siempre quedarán 2 cubos en el tablero
				if ( splinePointsLength <= 2 ) {

					return;

				}
				splinePointsLength --;
				positions.pop();
				scene.remove( splineHelperObjects.pop() );

				updateSplineOutline();

			}

			function updateSplineOutline() {

				var p;

				for ( var k in splines ) {

					var spline = splines[ k ];

					splineMesh = spline.mesh;

					for ( var i = 0; i < ARC_SEGMENTS; i ++ ) {

						p = splineMesh.geometry.vertices[ i ];
						p.copy( spline.getPoint( i /  ( ARC_SEGMENTS - 1 ) ) );
					}
					splineMesh.geometry.verticesNeedUpdate = true;
				}
			}



				function load( new_positions ) {

				while ( new_positions.length > positions.length ) {

					

					addPoint();

				}

				while ( new_positions.length < positions.length ) {

					
					removePoint();

				}

				for ( i = 0; i < positions.length; i ++ ) {

					
					positions[ i ].copy( new_positions[ i ] );

				}

				updateSplineOutline();

			}

			function animate() 
			{

				requestAnimationFrame( animate );
				render();
				controls.update();
				transformControl.update();

			}

			function render() 
			{
				renderer.render( scene, camera );
			}

			