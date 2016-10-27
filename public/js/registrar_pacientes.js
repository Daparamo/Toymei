$(function()
{
    var resultadoBusca = []; //Gurda los usuarios que cumplen con el criterio de búsqueda...
    listadoPersonas = [];
    var ind;
    traerPersonas();

     $(".se-pre-con").fadeOut("slow");

    //Edades
    //Minimo 15 años
    // Maximo 80 años

var edad_minima = 15;
var edad_maxima = 80

var fecha = new Date();
var ano = Number(fecha.getFullYear());

var min = ano - edad_minima;
var max = ano - edad_maxima;



fecha_minima = min.toString() + "-01-01";
fecha_max = max.toString() + "-01-01";

//Las fechas van de esa forma min con fecha_max y max_fecha_minima
$('#fechanace').attr({
    min : fecha_max,
    max : fecha_minima
});


function enviarContrasena (datos,callback) 
    {

        $(".se-pre-con").fadeIn("slow");

        var data = {};
        data.correo = datos.email;
        data.contrasena = datos.contrasena;
        data.tipo = datos.tipo;
        data.nombre = datos.nombre;
        $.ajax(
        {
            url         : "mail",
            type        : "POST",
            data        : JSON.stringify(data),
            dataType    : "json",
            contentType: "application/json; charset=utf-8"
        }).done(function(data)
        {

            $(".se-pre-con").fadeOut("slow");
            callback(data);
            //console.log(data.status)

        }).error(function(request, status, error)
        {
            

            sweetAlert("Oops...", request.responseText, "error");
            //alert(request.responseText);
            window.location = "/";
        });

    }

function enviarCorreo (callback) 
    {
        var data = {};
        data.correo = $("#correo").val();

        $.ajax(
        {
            url         : "validar_correo",
            type        : "POST",
            data        : JSON.stringify(data),
            dataType    : "json",
            contentType: "application/json; charset=utf-8"
        }).done(function(data)
        {
            callback(data);

        }).error(function(request, status, error)
        {
            

            sweetAlert("Oops...", request.responseText, "error");
            //alert(request.responseText);
            window.location = "/";
        });

    }




function traerPersonas (callback)
 {        
        $.ajax(
        {
            url         : "traerPersonas",
            type        : "GET",
            data        : "",
            dataType    : "json",
            contentType: "application/json; charset=utf-8"
        }).done(function(data)
        { 

            //console.log(data)
            

            listadoPersonas=data;

           console.log(listadoPersonas);
            
           imprimeUsuarios(data);
  
        }).error(function(request, status, error)
        {
            sweetAlert("Oops...", request.responseText, "error");
            //alert(request.responseText);
            window.location = "/";
        });

    }

    //Para guardar el nombre del usuario...
    var $nomUsuario = $("#titulo").html();
    var todos = [];

    function updateRegistro (ind,callback) 
    {
        var data = {};
        data.cedula = $("#identifica").val();
        data.nombre = $("#nombre").val();
        data.apellido = $("#apellido").val();
        data.nacimiento = $("#fechanace").val();
        data.correo = $("#email").val();
        data.id = listadoPersonas[ind].id
    
       // console.log(data);    
        $.ajax(
        {
            url         : "updateUsuario",
            type        : "PUT",
            data        : JSON.stringify(data),
            dataType    : "json",
            contentType: "application/json; charset=utf-8"
        }).done(function(data)
        {
         //   console.log(data);
            callback(data);

        }).error(function(request, status, error)
        {            
            sweetAlert("Oops...", request.responseText, "error");
            //alert(request.responseText);
            window.location = "/";
        });
    }

    function traerEmailandPass (cedula,callback)
    {

        var data = {};
        data.cedula = cedula;
        $.ajax(
        {
            url         : "traerEmailandPass",
            type        : "POST",
            data        : JSON.stringify(data),
            dataType    : "json",
            contentType: "application/json; charset=utf-8"
        }).done(function(data)
        {
         //   console.log(data);
            callback(data);            
        }).error(function(request, status, error)
        {            
            sweetAlert("Oops...", request.responseText, "error");
                var delay = 2000;
                                    setTimeout(function(){ window.location = "/" }, delay);
        });

    }

    var eliminarRegistro = function(ind,callback)
    {
        var data = {};
        data.id= listadoPersonas[ind].id
       
        $.ajax(
        {
            url         : "eliminarUsuario",
            type        : "PUT",
            data        : JSON.stringify(data),
            dataType    : "json",
            contentType: "application/json; charset=utf-8"
        }).done(function(data)
        {
            callback(data);        
        }).error(function(request, status, error)
        {            
            sweetAlert("Oops...", request.responseText, "error");
            //alert(request.responseText);
            window.location = "/";
        });
    }

    var crearRegistro = function(callback)
    {
        var data = {};
        data.cedula = $("#identifica").val();
        data.nombre = $("#nombre").val();
        data.apellido = $("#apellido").val();
        data.nacimiento = $("#fechanace").val();
        data.correo = $("#email").val();

        $.ajax(
        {
            url         : "createRegistro123",
            type        : "POST",
            data        : JSON.stringify(data),
            dataType    : "json",
            contentType: "application/json; charset=utf-8"
        }).done(function(data)
        {
         //   console.log(data);
            callback(data);            
        }).error(function(request, status, error)
        {            
            sweetAlert("Oops...", request.responseText, "error");
            //alert(request.responseText);
            window.location = "/";
        });
    }

    //Para listar los trabajos...
    var muestraTodos = function (tipo, index)
    {
        $("#titulo").html($nomUsuario + " ("+(todos.length <= 9 ? "0" + todos.length : todos.length)+")");
        //Para mostrar todos los elementos...
        var $txt = "";
        if(tipo === 1)
        {
            $txt = "<table width='100%' border='0' cellspacing='0' cellpadding='0' id = 'tableTodo'>";
            for(var veces = 1; veces <= 2; veces++)
            {
                for(var i = todos.length - 1; i >= 0; i--)
                {
                    if(veces === 1)
                    {
                        $txt += contenidoTabla(todos[i], 1);
                    }
                    else
                    {
                        contenidoTabla(todos[i], 2);
                    }
                }
                if(veces === 1)
                {
                    $txt += "</table>";
                    $("#todos").html($txt);
                }
            }
        }
        else
        {
            $('#tableTodo').prepend(contenidoTabla(todos[index], 1));
            $("#td_" + todos[index].id).hide().fadeIn('fast');
            contenidoTabla(todos[index], 2);
        }
    };

    var buscarIndice = function(id)
    {
        var ind = -1;
        for(var i = 0; i < todos.length; i++)
        {
            if(todos[i].id === id)
            {
                ind = i;
                break;
            }
        }
        return ind;
    };

    var imprimeUsuarios = (function imprimeUsuarios()
    {
        var muestra = true;
        var txt = "<table class = 'table-fill'>" + 
                    "<thead><tr>" + 
                    "<th>Cédula</th>" + 
                    "<th>Nombre</th>" + 
                    "<th>Correo</th>" + 
                    "<th>Fecha Nacimiento</th>" +
                    "<th>Edad</th>" + 
                    "<th>Editar</th>" + 
                    "<th>Eliminar</th></tr></thead>" + 
                    "<tbody class = 'table-hover'>";
        for(var i = 0; i < listadoPersonas.length; i++)
        {
            muestra = true;
            for(var c in resultadoBusca)
            {
                if(resultadoBusca[c] === i)
                {
                    muestra = false;
                }
            }
            if(muestra)
            {
                txt += "<tr>";
            var datosPersona = listadoPersonas[i];

           // console.log(datosPersona)

           
                txt += "<td><center>"+datosPersona.cedula+"</center></td>";
                txt += "<td><center>"+datosPersona.nombre +" "+ datosPersona.apellido+"</center></td>";
                txt += "<td><center>"+datosPersona.correo+"</center></td>";
                txt += "<td><center>"+datosPersona.nacimiento+"</center></td>";
                txt += "<td><center>"+ calculaEdad(datosPersona.nacimiento)+"</center></td>";

                //Editar...
                txt += "<td><center>";
                txt += "<img src = 'img/editar.png' border = '0' id = 'e_"+i+"'/>";
                txt += "</center</td>";
                //Eliminar...
                txt += "<td><center>";
                txt += "<img src = 'img/eliminar.png' border = '0' id = 'd_"+i+"'/>";
                txt += "</center</td>";
                txt += "</tr>";
            }
        }
        txt += "</tbody></table>";
        nom_div("imprime").innerHTML = txt;

        //Poner las acciones de editar y eliminar...
        for(var i = 0; i < listadoPersonas.length; i++)
        {    

            muestra = true;
            for(var c in resultadoBusca)
            {
                if(resultadoBusca[c] === i)
                {
                    muestra = false;
                }
            }
            if(muestra)
            {    
                //Editar...
                nom_div("e_" + i).addEventListener('click', function(event)
                {
                    ind = event.target.id.split("_")[1];
                    // console.log(ind); //Posicion en la tabla
                    // var idUser = listadoPersonas[ind].cedula;
                    // console.log("Valor de idUser: ", idUser);
                    //  ind = buscaIndice(idUser);
                    if(ind >= 0)
                    {
                        nom_div("identifica").value = listadoPersonas[ind].cedula;
                        nom_div("nombre").value = listadoPersonas[ind].nombre;
                        nom_div("apellido").value = listadoPersonas[ind].apellido;
                        nom_div("email").value = listadoPersonas[ind].correo;
                        nom_div("fechanace").value = listadoPersonas[ind].nacimiento;
                        $('#guarda').html("Actualizar Usuario");
                    }
                    else
                    {
                       alert("No existe el ID");
                    }
                });

                //Eliminar...
                nom_div("d_" + i).addEventListener('click', function(event)
                {
                    var ind = event.target.id.split("_")[1];
                    var idUser = listadoPersonas[ind].identificacion;
                    swal({
                            title: "¿Estás segur@?",
                            text: "Se eliminara al paciente " + listadoPersonas[ind].nombre + " " + listadoPersonas[ind].apellido,
                            type: "warning",
                            showCancelButton: true,
                            confirmButtonColor: "#DD6B55",
                            confirmButtonText: "Ok",
                            closeOnConfirm: false
                        },
                    function()
                    {
                        eliminarRegistro(ind,function(data)
                        {
                            if(data.status)
                            {
                                sweetAlert("Oops", "No se pudo eliminar.", "error");
                            }
                            else
                            {
                                ind = buscaIndice(idUser);
                                if(ind >= 0)
                                {
                                    listadoPersonas.splice(ind, 1);
                                    swal({   title: "Eliminado!",   text: "Se ha elimiando exitosamente",   timer: 1500,   showConfirmButton: false, type : "success"});
                                    traerPersonas();
                                }                            
                            }
                        });
                    })
                });
            }
        }
    return imprimeUsuarios;
    })();

    function nom_div(div)
    {
        return document.getElementById(div);
    }
    
    var buscaIndice = function(id)
    {
        var indice = -1;
        for(var i in listadoPersonas)
        {
            if(listadoPersonas[i].identificacion === id)
            {
                indice = i;
                break;
            }
        }
        return indice;
    }

    $("#form").submit(function(event)
    {
        event.preventDefault();

        var enviaForm = true;
       // var valores = [];
        var campos = ["identifica", "nombre", "apellido", "email", "fechanace"];
        for(var i = 0; i < campos.length; i++)
        {
           
            if($("#" + campos[i]).val().length === 0)
            {
                sweetAlert("Completar campos", "Por favor completa el campo " + campos[i], "error");
                enviaForm = false;
                break;
            }
            
        }

        var patron = /^\d*$/;                          //Expresión regular para aceptar solo números enteros positivos
            if (!patron.test($("#identifica").val())) 
            {             
                sweetAlert("Cedula inválida", "La cedula "+($("#identifica").val())+", no es válida", "error");
                $("#identifica").focus();
                enviaForm = false;  
            }

        if(enviaForm)
        {
            //Validar que el e-mail sea válido...
            if(!validaEmail($("#email").val()))
            {
                sweetAlert("Correo inválido", "El correo "+($("#email").val())+", no es válido", "error");
                enviaForm = false;
            }




        var letrero = $('#guarda').html();        
        if (letrero == "Guardar Usuario") 
            {
                crearRegistro(function(data)
                {
                    if(!data.status)
                    {
                        $("#identifica").val("");
                        $("#email").val("");
                        $("#identifica").focus();
                        traerPersonas();                        
                        swal
                        ({  

                            title   : "Oops",   
                            text    : "CREAR Esta cedula o correo ya esta asociad@ a un paciente.",   
                            timer   : 1000,
                            type    : "error",  
                            showConfirmButton: false 
                        });                
                    }
                    else
                    {
                        //limpiaCampos(campos);
                        traerEmailandPass($("#identifica").val(),function(data)
                        {

                       // console.log("Estado: " + data.status)

                            if(!data.status)
                            {
                              
                                console.log("No se actualizo contraseña por que no se encontro usuario " + data.correo);
                                 traerPersonas();
                                // limpiaCampos(campos)
                            
                            }
                            else
                            {
                                enviarContrasena({"contrasena"  : data.contrasena, "nombre" : data.nombre ,  "email" : data.correo, "tipo": "informar_paciente"}, function(data)
                                    {

                                        if(data.status)
                                        {
                                            //event.preventDefault();
                                            swal
                                            ({   
                                                title   : "!Bien! :)",   
                                                text    : "Se ha guardado el paciente correctamente.",   
                                                timer   : 2000,
                                                type    : "success",  
                                                showConfirmButton: false 
                                            });
                                
                                            traerPersonas();
                                            limpiaCampos(campos);                                
                                        }

                                        else
                                        {
                                            swal("Error!", "No se ha podido enviar el email a: " + data.correo, "error");
                                        }
                                    });                                        
                            }
                        });                            
                    }
              });
            };             
            if (letrero === "Actualizar Usuario") 
            {                                    
                updateRegistro(ind,function(data)
                {
                   // console.log("Estado: " + data.status)
                    if(!data.status)
                    {                      
                        $("#identifica").val("");
                        $("#email").val("");
                        $("#identifica").focus();
                        traerPersonas();
                        $('#guarda').html("Guardar Usuario")
                        swal
                        ({  
                            title   : "Oops",   
                            text    : "UPDATE Esta cedula o correo ya esta asociad@ a un paciente.",   
                            timer   : 1000,
                            type    : "error",  
                            showConfirmButton: false 
                        });                    
                    }
                    else
                    {
                        limpiaCampos(campos);
                        swal
                        ({   
                            title   : "Bien!",   
                            text    : "Se ha actualizado el paciente correctamente",   
                            timer   : 1000,
                            type    : "success",  
                            showConfirmButton: false 
                        });
                        traerPersonas();
                        $('#guarda').html("Guardar Usuario");
                    }
                });
            };
        }    
        return enviaForm;
    });


    nom_div("buscar").addEventListener('keyup', function(event)
    {
        resultadoBusca = []; //Reiniciar el array de resultados de búsqueda...
        var busca = false;
        if(this.value !== "")
        {
            for(var i = 0; i < listadoPersonas.length; i++)
            {

                busca = listadoPersonas[i].cedula.search(this.value) < 0;
                busca = busca && listadoPersonas[i].nombre.search(this.value) < 0;
                busca = busca && listadoPersonas[i].apellido.search(this.value) < 0;
                busca = busca && listadoPersonas[i].correo.search(this.value) < 0;
                if(busca)
                {
                    resultadoBusca.push(i);
                }
            }
        }
        imprimeUsuarios();
    });









    function calculaEdad (fechanacimiento) 
    {
        var fecha_actual = new Date();
        var parteFn = fechanacimiento.split("-");
        var fechaCompara = new Date(parteFn[0], parteFn[1], parteFn[2]); //año, mes día
        return Math.floor((fecha_actual - fechaCompara) / 1000 / 3600 / 24 / 365);
        //Milisegundos, segundos en una hora, horas en un día, días en un año...
    }
    
    function limpiaCampos(campos)
    {
        for(var i = 0; i < campos.length; i++)
        {
            $("#" + campos[i]).val("");
        }
    }

    var validaEmail = function(email)
	{
		var emailReg = /^([\da-zA-Z_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        return emailReg.test(email);
	};
});
