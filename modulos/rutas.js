var bcrypt          = 	require('bcrypt-nodejs'),
    passport 	    = 	require('passport'),
    db   		    = 	require('./database'),
	date 			= 	new Date(),
	fechaActual 	= 	(date.getMonth() + 1) + '/' + date.getDate() + '/' +  date.getFullYear();
    db.conectaDatabase();

//Crear un token único relacionado al ID de la tarea...
var guid = function()
{
	function s4()
	{
		return Math.floor((1 + Math.random()) * 0x10000).toString(16).substring(1);
	}
	return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4();
}

var token = function()
{
	function s4()
	{
		return Math.floor((1 + Math.random()) * 0x10000).toString(16).substring(1);
	}
	return s4() + s4();
}

var index = function(req, res)
{
	if(!req.isAuthenticated())
    {
        res.redirect('/login');
    }
    else
    {
        var user = req.user;
		res.render("menu", { // / index / menu
			titulo 	:  	"Menu",
			usuario	:	"Bienvenido " + user[0].nombre
		});
    }
};

var vista_pacientes =  function(req, res)
{
	if(req.isAuthenticated())
	{
		var user = req.user;
		res.render("registrar_pacientes", 
		{
			titulo 	:  	"Registrar Pacientes",
			usuario	:	"Bienvenido " + user[0].nombre
		});
	}
	else
	{
		res.status(401).send("Acceso no autorizado");
	}
};


var vista_Editar_Ejercicios =  function(req, res)
{
	if(req.isAuthenticated())
	{
		var user = req.user;
		res.render("editar_ejercicios", 
		{
			titulo 	:  	"Ver ejercicios",
			usuario	:	"Bienvenido " + user[0].nombre
		});
	}
	else
	{
		res.status(401).send("Acceso no autorizado");
	}
};


var vistaCubos =  function(req, res)
{
	if(req.isAuthenticated())
	{
		res.render("vista_cubos");
	}
	else
	{
		res.status(401).send("Acceso no autorizado");
	}
};

var change_password =  function(req, res)
{
	if(req.isAuthenticated())
	{
		var user = req.user;
		res.render("change_password", 
		{
			titulo 	:  	"Cambiar contraseña"
		});
	}
	else
	{
		res.status(401).send("Acceso no autorizado");
	}
};


var Reportes =  function(req, res)
{
	if(req.isAuthenticated())
	{
		var user = req.user;
		res.render("Reportes", 
		{
			titulo 	:  	"Reportes",
			usuario	:	"Bienvenido " + user[0].nombre
		});
	}
	else
	{
		res.status(401).send("Acceso no autorizado");
	}
	
};

var AsignarEjercicio =  function(req, res)
{
	if(req.isAuthenticated())
	{
		var user = req.user;
		res.render("AsignarEjercicio", 
		{
			titulo 	:  	"Asignar Ejercicio",
			usuario	:	"Bienvenido " + user[0].nombre
		});
	}
	else
	{
		res.status(401).send("Acceso no autorizado");
	}
	
};

var login = function(req, res)
{
	res.render("login", 
	{
		titulo 	:  	"ToyMei"
	});
};


var loginPost = function (req, res, next)
{
	passport.authenticate('local', 
	{

		successRedirect: '/menu', 
		failureRedirect: '/login'
	},
	function(err, user, info)
	{
		if(err)
		{
			return res.render('login', {titulo: 'ToyMei', error: err.message});
		}
		if(!user)
		{
			return res.render('login', {titulo: 'ToyMei', error: info.message, usuario : info.usuario});
		}
		return req.logIn(user, function(err)
		{
			if(err)
			{
				return res.render('login', {titulo: 'ToyMei', error: err.message});
			}
			else
			{
				return res.redirect('/');
			}
		});
	})(req, res, next);
};

var logout = function(req, res)
{
	if(req.isAuthenticated())
	{
		req.logout();
    }
	res.redirect('/login');
}

var registro =  function(req, res)
{
	res.render("registrolol", 
	{
		titulo 	:  	"Registro Medico",
		data 	:	[]
	});

};

var olvido_pass =  function(req, res)
{
	res.render("olvido_contrasena", 
	{
		titulo 	:  	"¿Olvido su contraseña?",
		data 	:	[]
	});

};

var registroPost = function(req, res, next)
{
    //Buscar si el nombre de usuario o correo ya existen...
	var data = req.body;
	var password = bcrypt.hashSync(data.password);
	var sql = "INSERT INTO users (nombre, usuario, clave, email, fecha) " +
					  "VALUES ('" + data.nombre + "', '" + data.username + "', " +
					  		   "'" + password + "', '"+data.correo+"', '" + fechaActual + "')";
		
	db.queryMysql(sql, function(err, response)
	{
		if (err || response.affectedRows === 0)
		{
			res.render('registrolol');
		}
		loginPost(req, res, next);
	});
};

var createRegistro = function (req, res)
{	
	if(req.isAuthenticated())
	{
		crearUsuario(req.body,req.user[0].idusuario, function(err, data, status)
		{
			var result = {
						usuario:data,
						status: status
					 };
			res.json(result);
			//console.log(result);
		});
	}
	else
	{
		res.status(401).send("Acceso no autorizado");
	}
};

var cambiar_password= function (req, res)
{	
	if(req.isAuthenticated())
	{
		var usuario = req.user[0];
		var data = req.body;
		//console.log("Contraseña nueva: " + data.password);
		var sql = "update users SET clave = '" + bcrypt.hashSync(data.password) + "' WHERE idusuario = '"+ usuario.idusuario + "'";
		//console.log(sql);
		db.queryMysql(sql, function(err, response)
		{
			if (err) throw err;
			var delay = 4000;
            setTimeout(function()
            { 
				res.render("menu", 
				{
					titulo 	:  	"Menu",
					usuario	:	"Bienvenido " + usuario.nombre
				});  
            }, delay);
		});
	}
	else
	{
		res.status(401).send("Acceso no autorizado");
	}
};


var updateRegistro = function (req, res)
{
	if(req.isAuthenticated())
	{
		EditarUsuario(res,req,req.body,req.user[0].idusuario, function(error,data, status)
		{
			var result = {
							usuario:data,
							status: status
						 };
				res.json(result);
				//console.log(result);
		});
	}
	else
	{
		res.status(401).send("Acceso no autorizado");
	}
};


var traerPersonas =  function(req, res)
{
	if(req.isAuthenticated())
	{
		var usuario = req.user[0].idusuario;
		db.queryMysql("select * from pacientes where idusuario = " + usuario +" and eliminado = 0", function(err, data)
		{
			if (err) throw err;
			res.json(data); //Retornar data
		});
	}
	else
	{
		res.status(401).send("Acceso no autorizado");
	}
};


var traerEjercicios =  function(req, res)
{
	if(req.isAuthenticated())
	{
		var usuario = req.user[0].idusuario;
		var sql = "select pacientes.cedula, pacientes.correo, ejercicio.id_paciente, pacientes.apellido, pacientes.nombre, ejercicio.fecha_inicio, ejercicio.id_ejercicio, ejercicio.nombre_ejercicio, ejercicio.repeticiones, ejercicio.tiempo, ejercicio.tipo "+ 
					"from ejercicio INNER JOIN pacientes " + 
					"ON ejercicio.id_paciente = pacientes.id " + 
					"where ejercicio.id_medico =  " + usuario + " and ejercicio.eliminado = 0 and ejercicio.termino = 0";
		
		db.queryMysql(sql, function(err, data)
		{
			if (err) throw err;
			res.json(data);
		});
	}
	else
	{
		res.status(401).send("Acceso no autorizado");
	}
};


var registroExiste =  function(req, res)
{
	var data = req.body;
	var sql = "select usuario from users " +
		   "where usuario = '"+(data.username)+"' or " +
		   		  "email = '"+(data.correo)+"'";

	//console.log(sql);
	db.queryMysql(sql, function(err, response)
	{
		if(response.length !== 0)
		{
			//console.log("El registro  EXISTE");
			res.json({status : true});
		}	

		if (response.length === 0)
		{
			//console.log("El registro NO EXISTE");
			res.json({status : false});
		}
	});
};






var traerDatos_Medico =  function(req, res)
{
	if(req.isAuthenticated())
	{
		var usuario = req.user[0].idusuario;
		db.queryMysql("select nombre as nombre, usuario as usuario, email as email from users where idusuario = " + usuario, function(err, response){
			if (err) throw err;
			//Retorneme data
			res.json({ 
						nombre 		: response[0].nombre,
						usuario 	: response[0].usuario,
						email 		: response[0].email
					});
		});
	}
	else
	{
		res.status(401).send("Acceso no autorizado");
	}
};


var traerPersonasxNoInformes =  function(req, res)
{
	if(req.isAuthenticated())
	{
		var usuario = req.user[0].idusuario;
		var sql = "SELECT  pacientes.nombre, pacientes.apellido, COUNT(*) FROM informes "+ 
					"INNER JOIN pacientes " +
					"ON pacientes.id = informes.id_paciente " +
					"WHERE pacientes.eliminado = 0 "+
					"and informes.id_medico = "+ usuario +" "+
					"GROUP BY pacientes.id"
		console.log(sql);
		db.queryMysql(sql,function(err, data)
		{
			console.log(data);
			if (err) throw err;
			res.json({ 
						data 		: data
					});
		});
	}
	else
	{
		res.status(401).send("Acceso no autorizado");
	}
};










var notFound404 = function(req, res)
{

	res.render("404");

	//res.status(404).send("Página no encontrada :( en el momento");
};


var EditarUsuario = function(res,req,data, idusuario, callback)
{
    var sql = "select id as id_bd from pacientes where eliminado = 0  and (cedula = '"+(data.cedula)+"' or correo = '"+(data.correo)+"') and idusuario = '"+idusuario+"'";
 	//console.log(sql)
 	db.queryMysql(sql, function(err, response)
	{
		var tamano=response.length;
		//console.log("Tamaño " + response.length);
		if (tamano !== 0) 
		{
			//console.log("ID que viene de la consulta: " + response[0].id_bd);
			if(tamano === 1 && data.id === response[0].id_bd)
			{
				actualizarUser(res,req,data);
				//console.log("Quiere actualizar sus datos propios") 
			}

			if(tamano === 1 && data.id !== response[0].id_bd)
			{
				//console.log("LOOOL")			
				callback("","",false);
			}

			if(tamano === 2)
			{
				for (var i = 0; i < response.length; i++) 
				{
					if (data.id !== response[i].id_bd) 
						{
							//console.log("Dos registros encontrado")
							callback("","",false);
							break;
						};
				};	
			}
		}	
		else
		{
            var sql = "";
			sql = "UPDATE pacientes SET " + "cedula" 	 + " = '" + data.cedula + "', " +
												"nombre" 	 + " = '" + data.nombre + "', " +
												"apellido" 	 + " = '" + data.apellido + "', " +
												"nacimiento" + " = '" + data.nacimiento + "', " +
												"correo" 	 + " = '" + data.correo + "' "+	
												" WHERE id = '"+ data.id + "'";													
			//console.log(sql)	
			db.queryMysql(sql, function(err, response)
			{
				if (err) throw err;
				callback(err, data,true);
			});
		}
	});
};


var validar_correo = function(req, res)
{

	var data = req.body;
	//console.log("El correo es: " + data.correo);
	var status;
		
	var sql = "select usuario as usuario, nombre as nombre, email as email from users where email = '" + data.correo + "'";
	//console.log(sql)
	db.queryMysql(sql, function(err, response)
	{
		var encontro=response.length;

		//console.log("Encontro " + response.length);
		if (encontro === 1) 
		{
			var nombre = response[0].nombre;
			var usuario = response[0].usuario;
			//console.log("El correo "+ data.correo+" si existe.");
			status=true;
			var contrasena_nueva = guid();
			//console.log("Se va enviar a este correo: " + data.correo);

			var sql = "update users SET clave = '" + bcrypt.hashSync(contrasena_nueva) + "' WHERE email = '"+ data.correo + "'";
			//console.log(sql);
			db.queryMysql(sql, function(err, response)
			{
				if (err) throw err;
				res.json({
							status 			 : status,
							contrasena_nueva : contrasena_nueva,
							correo 			 : data.correo,
							nombre       	 : nombre,
							usuario       	 : usuario
						})
			});
		}
		else
		{
			//console.log("El correo "+ data.correo +" NO existe.");
			status=false;
			res.json({
						status : status,
						correo : data.correo
					})		
		};
	//if (err) throw err;
	//res.json({status : status}) //Enviar respuesta a la vista	
	});	
};

var traerEmailandPass = function(req, res)
{
	data = req.body;
	//console.log(data);
	//console.log("ID del recien registrado" + data.id)
	//console.log("El correo es: " + data.correo);
	var status;
	var sql = "select nombre as nombre, apellido as apellido, correo as correo, password as password, id as id  from pacientes where eliminado = 0  and cedula = '"+(data.cedula)+"'";
	//console.log(sql)
	db.queryMysql(sql, function(err, response)
	{
		var encontro=response.length;
		console.log(response);


		if (encontro === 1) 
		{
			//console.log("El correo "+ response[0].correo +" si existe con est ID.");
			status=true;
			var contrasena_para_enviar_email = token(); 
			var correo = response[0].correo;
			var nombre = response[0].nombre + " " + response[0].apellido;
			console.log("LA CEDULA SI EXISTE");

			//
			


			var sql = "update pacientes SET password = '" + bcrypt.hashSync(contrasena_para_enviar_email) + "' WHERE id = '"+ response[0].id + "'";
			//console.log(sql);

			db.queryMysql(sql, function(err, response)
			{
				if (err) throw err;
				res.json({
							status 			 				: status,
							contrasena         	            : contrasena_para_enviar_email,
							correo 			 				: correo,
							nombre 							: nombre
						})
			});
		}

		else
		{
			//console.log("El correo "+ data.correo +" NO existe.");
			status=false;
			console.log("LA CEDULA NO EXISTE");
			res.json({
						status : status,
						correo : correo
					})
			
		};

	//if (err) throw err;
	//res.json({status : status}) //Enviar respuesta a la vista
	
	});
	
};

function actualizarUser (res,req,data) 
{
	
	if(req.isAuthenticated())
	{


		var status = true;

		 var sql = "";
			
			sql = "UPDATE pacientes SET " + "cedula" 	     + " = '" + data.cedula + "', " +
												"nombre" 	 + " = '" + data.nombre + "', " +
												"apellido" 	 + " = '" + data.apellido + "', " +
												"nacimiento" + " = '" + data.nacimiento + "', " +
												"correo" 	 + " = '" + data.correo + "' "+	
												" WHERE id = '"+ data.id + "'";

		db.queryMysql(sql, function(err, response)
		{
			if (err || response.affectedRows === 0)
			{
				status = false;
			}
			res.json({status : status});
		});
	}
}





var updateEjercicio = function (req,res)
{
	var data = req.body;

	if(req.isAuthenticated())
	{
	

	var guardar = false;

	var sql = "select * from ejercicio where  id_paciente = '" + data.id_paciente + "' and eliminado = 0 and termino = 0";
	//console.log(sql)
	db.queryMysql(sql, function(err, response)
	{
		var encontro=response.length;
		
		//console.log("Encontro " + response.length);
		
		if (encontro !== 0)
			{

				for (var i = 0; i < response.length; i++) 
				{
					//console.log(response[i]);

					if (response[i].nombre_ejercicio === data.nombre_ejercicio) 
					{
						if (response[i].tipo === data.tipo) 
							{
								
								if (response[i].id_ejercicio === data.id_ejercicio) 
								{
										guardar=true;
										break;
								}
								else
								{
									guardar=false;
									break;

								}


							}
						else
							{
								guardar=true;
							}

					}
					else
					{
						
						guardar=true;

					}
				

				};


				if (guardar) 
				{
					status=true;
					var sql = "update ejercicio SET nombre_ejercicio = '" + data.nombre_ejercicio + "', " + 
												"tiempo = " + data.tiempo + ", " +
												"repeticiones = " + data.repeticiones + " WHERE id_ejercicio = '"+ data.id_ejercicio + "'";

			
					//console.log(sql);
			
					db.queryMysql(sql, function(err, response)
					{
						if (err) throw err;
						res.json({ status : status })
					});




				}

				else
				{
					status=false;
					res.json({status : status})		

				}

			};
});	









	}
	else
	{
		res.status(401).send("Acceso no autorizado");
	}

}


var eliminarEjercicio = function (req,res)
{
	var data = req.body;
	if(req.isAuthenticated())
	{
		var status = false;

		 var sql = "UPDATE ejercicio SET eliminado =  1  WHERE id_ejercicio = '"+ data.id_ejercicio + "'";

		db.queryMysql(sql, function(err, response)
		{
			if (err || response.affectedRows === 0)
			{
				status = true;
			}
			res.json({status : status});
		});
	}
	else
	{
		res.status(401).send("Acceso no autorizado");
	}

}









var eliminarUsuario = function (req,res)
{
	var data = req.body;
	if(req.isAuthenticated())
	{
		var status = false;

		 var sql = "";
			
			sql = "UPDATE pacientes SET eliminado =  1 WHERE id = '"+ data.id + "'";

		db.queryMysql(sql, function(err, response)
		{
			if (err || response.affectedRows === 0)
			{
				status = true;
			}
			res.json({status : status});
		});
	}
	else
	{
		res.status(401).send("Acceso no autorizado");
	}

}


var crearUsuario = function(data, idusuario, callback)
{

	
    var sql = "select count(*) as numero from pacientes " +
			   "where eliminado = 0  and (" +
			   		  "cedula = '"+(data.cedula)+"' or "+
			   		   "correo = '"+(data.correo)+"') and idusuario = " + idusuario;

	console.log(sql)

	db.queryMysql(sql, function(err, response)
	{
		if(response[0].numero !== 0)
		{ 
			//El registro existe

			callback("","",false);
		}
		else
		{
            var sql = "";
			var password = "contrasena_nueva" ;
			var eliminado = false;
			//se esta creando un nuevo paciente...			
			data.id = guid();
			data.date = fechaActual;
			sql = "INSERT INTO pacientes (id, cedula, idusuario, nombre, apellido, date, nacimiento, correo, password, eliminado) " +
			  "VALUES ('" + data.id  		 + "', '" + 
			  				data.cedula      + "', '" +
			  		        idusuario      	 + "', '" +
			  		   		data.nombre 	 + "', '" +
			  		   		data.apellido	 + "', '" +
			  		   		data.date		 + "', '" +  
			  		   		data.nacimiento	 + "', '" + 
			  		   		data.correo	 	 + "', '" +
			  		   		password	 	 + "', '" +    
			  		   		eliminado         + "')";				
			db.queryMysql(sql, function(err, response){
				if (err) throw err;
				callback(err, data,true);
			});
		}
	});
};








var insertarEjercicio = function (req,res)
{
	var data = req.body;

	if(req.isAuthenticated())
	{
		var status = true;
		var guardar = false;
		var sql = "select * from ejercicio where  id_paciente = '" + data.id_paciente + "' and eliminado = 0 and termino = 0";
		//console.log(sql)
		db.queryMysql(sql, function(err, response)
		{
			var encontro=response.length;
			//console.log("Encontro " + response.length);
			if (encontro !== 0)
				{
					for (var i = 0; i < response.length; i++) 
					{
						if (response[i].nombre_ejercicio === data.nombre_ejercicio) 
						{
							if (response[i].tipo === data.tipo) 
							{
								guardar=false;
								break;
								
							}
							else
							{
								guardar=true;
							}
						}
						else
						{
							guardar=true;

						}
					};
				}
				else
				{
					//No encontro ejercicio deberia guardarlo
					guardar=true;
					
				}

				if (guardar) 
					{
						
						var sql = "";
						var id_ejercicio = guid();
						var fecha = fechaActual;
						var id_medico = req.user[0].idusuario;
						var termino = false;
							
						sql = "INSERT INTO ejercicio (id_ejercicio, id_paciente, id_medico, nombre_ejercicio, fecha_inicio, tiempo, tipo, repeticiones, termino, coordenadas) " +
							  "VALUES ('" + id_ejercicio	         + "', '" + 
							  				data.id_paciente          		 + "', " +
							  		        id_medico      	 		 + ", '" +
							  		   		data.nombre_ejercicio 	 + "', '" +
							  		   		fecha	 				 + "', " +
							  		   		data.tiempo		 + ", '" +  
							  		   		data.tipo	 + "', " + 
							  		   		data.repeticiones	 	 + ", " +
							  		   		termino	 	 + ", '" +
							  		   		data.coordenadas        + "')";

						//console.log(sql);
						db.queryMysql(sql, function(err, response)
						{
							if (err || response.affectedRows === 0)
							{
								status = false;
							}
							res.json({status : status, nombre_ejercicio : data.nombre_ejercicio, tipo : data.tipo});
						});
					}
					else
					{
						status=false;
						res.json({status : status, nombre_ejercicio : data.nombre_ejercicio, tipo : data.tipo});	
					}
		});	
	}
	else
	{
		res.status(401).send("Acceso no autorizado");
	}
}





//Exportar las rutas...
module.exports.index = index;
module.exports.login = login;
module.exports.loginPost = loginPost;
module.exports.logout = logout;
module.exports.registro = registro;
module.exports.registroPost = registroPost;

//Olvido su contraseña
module.exports.olvido_pass = olvido_pass;

module.exports.createRegistro = createRegistro;

module.exports.EditarUsuario = EditarUsuario;

module.exports.crearUsuario = crearUsuario;

module.exports.vistaCubos = vistaCubos;

//Exportar vista editar ejercicios
module.exports.vista_Editar_Ejercicios = vista_Editar_Ejercicios;


//Exportar modulo para traer todos los ejercicios asignados por x medico
module.exports.traerEjercicios = traerEjercicios;


//Exportar modulo para traer la vista reportes
module.exports.Reportes = Reportes;




//Exportar metodo para rendereizar la vista cambiar contraseña
module.exports.change_password = change_password;

//Exportar metodo para UPDATE de contraseña
module.exports.cambiar_password = cambiar_password;

//Enviar los datos del medico a la vista
module.exports.traerDatos_Medico = traerDatos_Medico;



//Validar que no exista ningun registro de un medico
module.exports.registroExiste = registroExiste;


module.exports.traerPersonasxNoInformes = traerPersonasxNoInformes;



//Modulo para actualziar ejercicio
module.exports.updateEjercicio = updateEjercicio;


//Get para traer todas las personas x medico
module.exports.traerPersonas = traerPersonas;

//UPDATE actualizar un registro de paciente

module.exports.updateRegistro = updateRegistro;

//Eliminar registro
module.exports.eliminarUsuario = eliminarUsuario;

//Post para validar el correo
module.exports.validar_correo = validar_correo;

module.exports.vista_pacientes = vista_pacientes;
//****************EJERCICIO*********************
//Muestra Vista de ejercicios
module.exports.AsignarEjercicio = AsignarEjercicio;

//Insert INTO del ejercicio
module.exports.insertarEjercicio = insertarEjercicio;

//Eliminar ejercicio de manera logica



module.exports.eliminarEjercicio = eliminarEjercicio;










//********************
module.exports.traerEmailandPass = traerEmailandPass;



module.exports.notFound404 = notFound404;

