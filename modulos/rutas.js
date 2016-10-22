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
		res.render("menu", { //registrar_pacientes / index / menu
			titulo 	:  	"Menu",
			usuario	:	"Bienvenido " + user[0].nombre
		});
    }
};




var vista_pacientes =  function(req, res)
{
	var user = req.user;
	res.render("registrar_pacientes", 
	{
		titulo 	:  	"Registrar Pacientes",
		usuario	:	"Bienvenido " + user[0].nombre
	});

};

var AsignarEjercicio =  function(req, res)
{
	var user = req.user;
	res.render("AsignarEjercicio", 
	{
		titulo 	:  	"AsignarEjercicio",
		usuario	:	"Bienvenido " + user[0].nombre
	});

};











var login = function(req, res)
{
	res.render("login", {
		titulo 	:  	"ToyMei"
	});
};


var loginPost = function (req, res, next)
{
	passport.authenticate('local', 
	{
		successRedirect: '/menu', //login
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
	res.render("registrolol", {
		titulo 	:  	"Registro Medico",
		data 	:	[]
	});

};


var olvido_pass =  function(req, res)
{
	res.render("olvido_contrasena", {
		titulo 	:  	"¿Olvido su contraseña?",
		data 	:	[]
	});

};







var registroPost = function(req, res, next)
{
    //Buscar si el nombre de usuario o correo ya existen...
	var data = req.body;

	var sql = "select count(*) as numero from users " +
			   "where usuario = '"+(data.username)+"' or " +
			   		  "email = '"+(data.correo)+"'";
	db.queryMysql(sql, function(err, response)
	{
		if(response[0].numero !== 0)
		{
			res.render('registrolol', {
									titulo: 'Registro Medico',
									error: 'Nombre de usuario o correo ya existe',
									data : [data.nombre, data.correo, data.username]
								});
		}

		
		else
		{

            var password = bcrypt.hashSync(data.password);
			sql = "INSERT INTO users (nombre, usuario, clave, email, fecha) " +
					  "VALUES ('" + data.nombre + "', '" + data.username + "', " +
					  		   "'" + password + "', '"+data.correo+"', '" + fechaActual + "')";
			db.queryMysql(sql, function(err, response)
			{
				//if (err || response.affectedRows === 0)
				//{
				//	res.render('registrolol');
				//}
				loginPost(req, res, next);
			});
		}
	});
};


var createRegistro = function (req, res)
{


	
	if(req.isAuthenticated()){
	
	crearUsuario(req.body,req.user[0].idusuario, function(err, data, status){
		var result = {
						usuario:data,
						status: status
					 };
			res.json(result);
			//console.log(result);
		});
	}

	else{
		res.status(401).send("Acceso no autorizado");
	}

};


var updateRegistro = function (req, res)
{

	//console.log(req.isAuthenticated());
	if(req.isAuthenticated()){
	
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
	//Traer todos los To-Do's...
	if(req.isAuthenticated())
	{
		//var data= req.body;
		var usuario = req.user[0].idusuario;
		//var data req.body;




		db.queryMysql("select * from pacientes where idusuario = " + usuario +" and eliminado = 0", function(err, data){
			if (err) throw err;
			//Retorneme data
			res.json(data);
		});
	}
	else
	{
		res.status(401).send("Acceso no autorizado");
	}
};


var deleteTask = function(req, res)
{
	if(req.isAuthenticated())
	{
		var status = true;
		var sql = "DELETE FROM todos WHERE id = '" + (req.param("id")) + "'";
		db.queryMysql(sql, function(err, response)
		{
			if (err || response.affectedRows === 0)
			{
				status = false;
			}
			res.json({status : status});
		});
	}
	else
	{
		res.status(401).send("Acceso no autorizado");
	}
};

var getTask = function(req, res)
{
	if(req.isAuthenticated())
	{
		var sql = "select task from todos WHERE id = '" + (req.param("id")) + "'";
		db.queryMysql(sql, function(err, response)
		{
			if (err) throw err;
			res.json(response);
		});
	}
	else
	{
		res.status(401).send("Acceso no autorizado");
	}
};

var notFound404 = function(req, res)
{
	res.status(404).send("Página no encontrada :( en el momento");
};





var EditarUsuario = function(res,req,data, idusuario, callback)
{
	
    var sql = "select id as id_bd from pacientes where eliminado = 0  and (cedula = '"+(data.cedula)+"' or correo = '"+(data.correo)+"') and idusuario = '"+idusuario+"'";
	
 	//console.log(sql)

 	db.queryMysql(sql, function(err, response)
	{

		var tamano=response.length;
		console.log("Tamaño " + response.length);
		/*
		console.log("ID que viene de la vista: " + data.id);
		if (tamano === 1) 
			{
				console.log(response[0]);
			};

		if (tamano === 2) 
			{
				console.log(response[0]);
				console.log(response[1])
			};
		*/
		

		if (tamano !== 0) 
		{

			//console.log("ID que viene de la consulta: " + response[0].id_bd);
			if(tamano === 1 && data.id === response[0].id_bd)
			{
				
				actualizarUser(res,req,data);
				console.log("Quiere actualizar sus datos propios") 

				
				
			}


			if(tamano === 1 && data.id !== response[0].id_bd)
			{
				console.log("LOOOL")			
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
			
			sql = "UPDATE pacientes SET " + "cedula" 	 + " = " + data.cedula + ", " +
												"nombre" 	 + " = '" + data.nombre + "', " +
												"apellido" 	 + " = '" + data.apellido + "', " +
												"nacimiento" + " = '" + data.nacimiento + "', " +
												"correo" 	 + " = '" + data.correo + "' "+	
												" WHERE id = '"+ data.id + "'";
												
			
			console.log(sql)	
				
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

	data = req.body;
	//console.log("El correo es: " + data.correo);
	var status;
	var sql = "select email as email from users where email = '" + data.correo + "'";
	//console.log(sql)
	db.queryMysql(sql, function(err, response)
	{
		var encontro=response.length;
		//console.log("Encontro " + response.length);
		if (encontro === 1) 
		{
			//console.log("El correo "+ data.correo+" si existe.");
			status=true;
			var contrasena_nueva = guid();


			var sql = "update users SET clave = '" + bcrypt.hashSync(contrasena_nueva) + "' WHERE email = '"+ data.correo + "'";
			//console.log(sql);

			db.queryMysql(sql, function(err, response)
			{
				if (err) throw err;
				res.json({
							status 			 : status,
							contrasena_nueva : contrasena_nueva,
							correo 			 : data.correo
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
		//console.log("Encontro " + response.length);
		if (encontro === 1) 
		{
			//console.log("El correo "+ response[0].correo +" si existe con est ID.");
			status=true;
			var contrasena_para_enviar_email = token(); 
			var correo = response[0].correo;
			var nombre = response[0].nombre + " " + response[0].apellido;

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
			
			sql = "UPDATE pacientes SET " + "cedula" 	 + " = " + data.cedula + ", " +
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
			   		  "cedula = "+(data.cedula)+" or "+
			   		   "correo = '"+(data.correo)+"')";	
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


//Get para traer todas las personas x medico
module.exports.traerPersonas = traerPersonas;

//UPDATE actualizar un registro de paciente

module.exports.updateRegistro = updateRegistro;

//Eliminar registro
module.exports.eliminarUsuario = eliminarUsuario;

//Post para validar el correo
module.exports.validar_correo = validar_correo;

module.exports.vista_pacientes = vista_pacientes;
module.exports.AsignarEjercicio = AsignarEjercicio;

module.exports.traerEmailandPass = traerEmailandPass;

module.exports.deleteTask = deleteTask;
module.exports.getTask = getTask;
module.exports.notFound404 = notFound404;
