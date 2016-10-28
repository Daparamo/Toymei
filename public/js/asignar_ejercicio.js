$(document).ready(function() {
        
          var delay = 700;
          setTimeout(function(){  $(".se-pre-con").fadeOut('slow'); }, delay);
    
   

    //En el select el valor "0" es para EJERCICIOS
    //En el select el valor "1" es para ESTIRAMIENTO
    var resultadoBusca = []; //Gurda los usuarios que cumplen con el criterio de búsqueda...
   
    $('#repeticionesEjercicio').hide();
    //--> Tareas iniciales
    traerPersonas(); //Traer pacientes
    traervistaCubos();
    //Traer los TO-DO creados...
    todos = [];



$('#edita_ejercicio').click(function(event) 
{
    window.location = "/Editar_Ejercicios";

 });



    $('#Opciones').change(function(event) {

        if ($('#Opciones').val() === "opcion1" )  
        {

            $('#repeticionesEjercicio').show();
        }
        else
        {
            $('#repeticionesEjercicio').hide();
        }

     //  console.log($('#Opciones').val())
    });
   

    


   


function traervistaCubos(callback)
 {        
    $.ajax(
        {
            url         : "vista_cubos",
            type        : "GET",
            data        : "",
            dataType    : "json",
            contentType: "application/json; charset=utf-8"
        })
};


function traerPersonas (callback)
 {        

    //console.log("Entro a traer los pacientes");
        $.ajax(
        {
            url         : "traerPersonas",
            type        : "GET",
            data        : "",
            dataType    : "json",
            contentType: "application/json; charset=utf-8"
        }).done(function(data)
        { 
            todos = data;
            //console.log(todos);
            //imprimeUsuarios(data);
            muestraTodos(1, 0);
            
           
            $('#todos').addClass('todos');

  
        }).error(function(request, status, error)
        {
            sweetAlert("Oops...", request.responseText, "error");
            var delay = 2000;
            setTimeout(function(){ window.location = "/" }, delay);
        });

    }

 


    var contenidoTabla = function(data, type)
    {
        if(type === 1)
        {
            return "<tr>" +
                        "<td width='10%'><center>" +
                            "<input type = 'radio' name = 'radio' id = '"+(data.id)+"'/>" +
                        "</center></td>" +
                        "<td width='70%'><div>" + (data.nombre)+" "+ data.apellido + "</div>" +
                        "</tr>";
        }
        
        /*
        else
        {
            $("#" + data.id).click(function(event) 
            {
                console.log( $("#" + data.id).val());
                //accionTodo(ind, 1);
            });
        }*/

    };

    //Para listar los trabajos...
    var muestraTodos = function (tipo, index)
    {
        

        //Para mostrar todos los elementos...
        var $txt = "";
        if(tipo === 1)
        {
            $txt = "<table width='94%' border='0' cellspacing='0' cellpadding='0' id = 'tableTodo'>";
            for(var veces = 1; veces <= 2; veces++)
            {
                for(var i = todos.length - 1; i >= 0; i--)
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

                        if(veces === 1)
                        {
                            $txt += contenidoTabla(todos[i], 1);
                        }
                        else
                        {
                            contenidoTabla(todos[i], 2);
                        }
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
            $("#" + todos[index].id).hide().fadeIn('fast');
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



function seleccionoPaciente () 
{

    var status = false;
    for (var i = 0; i < todos.length; i++) 
    {
       // console.log(todos[i].id);
        
        if ($('#' + todos[i].id).is(':checked')) 
            {
                console.log($('#' + todos[i].id).is(':checked'));
                status = true;
                var id = todos[i].id;
                var nombre = todos[i].nombre + " " + todos[i].apellido ;
                var correo = todos[i].correo;
                break;
            }
        
    };


    if (status) 
        {
            return ({
                        status  : true,
                        id      : id,
                        nombre  : nombre,
                        correo  : correo
                    });
        }
    else
        {
            return ({
                        status  : false,
                        id      : "",
                        nombre  : ""
                    });;
        }

}



function enviarEjercicio (coordenadas,tipo,id_paciente,callback) 
    {
        var data = {};

        if (tipo === "ejercitar") 
        {
            data.id_paciente = id_paciente;
            data.nombre_ejercicio = $('#NombreEjercicio').val();
            data.tiempo = $('#tiempoEjercicio').val();
            data.tipo = "Ejercitar";
            data.repeticiones = $('#repeticionesEjercicio').val();
            data.coordenadas = coordenadas;
        }
        else
        {
            data.id_paciente = id_paciente;
            data.nombre_ejercicio = $('#NombreEjercicio').val();
            data.tiempo = $('#tiempoEjercicio').val();
            data.tipo = "Estiramiento";
            data.repeticiones = 0;
            data.coordenadas = coordenadas;

        }

        
        $.ajax(
        {
            url         : "insertarEjercicio",
            type        : "POST",
            data        : JSON.stringify(data),
            dataType    : "json",
            contentType: "application/json; charset=utf-8"
        }).done(function(data)
        {
            callback(data);
            //console.log(data.status)

        }).error(function(request, status, error)
        {
            

            sweetAlert("Oops...", request.responseText, "error");
            //alert(request.responseText);
            window.location = "/";
        });

    }

function enviarCorreo_newEjercicio (datos,callback) 
    {
        $(".se-pre-con").fadeIn("slow");
        var data = {};
        data.correo = datos.correo;
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










    $('#guarda').click(function(event) 
    {

        var coordenadas = $("#cubos").contents().find("#Array_Cubos").val();
        console.log(coordenadas);

        var opcion = $('#Opciones').val();

        
        

        if (opcion !== null && opcion !=="")
            {
                if (opcion == "opcion1") 
                {
                    //console.log("ENTRO A EJERCICIO")
                    var enviaForm = true;       
                    var campos = ["NombreEjercicio", "tiempoEjercicio", "repeticionesEjercicio"];

                    for(var i = 0; i < campos.length; i++)
                    {
                        if($("#" + campos[i]).val().length === 0)
                        {
                            sweetAlert("Completar campos", "Por favor completa el campo " + campos[i], "error");
                            enviaForm = false;
                            break;
                        }
                    }

                    if (enviaForm) 
                        {

                            var id_Paciente = seleccionoPaciente();

                           // console.log("Ha seleccionado paciente" + id_Paciente.id);

                            if (id_Paciente.status) 
                                {
                                    enviarEjercicio(coordenadas,"ejercitar",id_Paciente.id, function(data)
                                    {

                                        if(data.status)
                                        {   

                                            enviarCorreo_newEjercicio({"nombre" : id_Paciente.nombre ,  "correo" : id_Paciente.correo, "tipo": "informar_paciente_new_ejercicio"}, function(data)
                                            {

                                                if(data.status)
                                                {
                                               
                                                    swal
                                                    ({   
                                                        title   : "!Bien! :)",   
                                                        text    : "Se ha asignado un nuevo ejercicio al paciente. " + data.nombre,   
                                                        timer   : 2000,
                                                        type    : "success",  
                                                        showConfirmButton: false 
                                                    });
                                        
                                                    limpiaCampos(campos);    
                                                                   
                                                 }

                                                else
                                                {
                                                    swal("Error!", "No se ha podido enviar el email a: " + data.correo, "error");
                                                }
                                            }); 
                                        
                                        }

                                        else
                                        {
                                            swal("Error!", "No se ha podido guardar el ejercicio "+ data.nombre_ejercicio +"  del paciente " + id_Paciente.nombre +", por que este ya tiene asociado un ejercicio de tipo: "+ data.tipo +" con el mismo nombre.", "error");
                                            limpiaCampos(campos);
                                        }
                                    });
                                   
                                }
                            else
                                {
                                    sweetAlert("Oops", "Seleccione a un paciente ", "error");
                                    
                                }


                           
                        };
                };

        if (opcion === "opcion2") 
        {
            //console.log("ENTRO A ESTIRAR")
            var enviaForm = true;       
            var campos = ["NombreEjercicio", "tiempoEjercicio"];
            for(var i = 0; i < campos.length; i++)
            {
                if($("#" + campos[i]).val().length === 0)
                {
                    sweetAlert("Completar campos", "Por favor completa el campo " + campos[i], "error");
                    enviaForm = false;
                    break;
                }
            }

            if (enviaForm) 
            {
               var id_Paciente = seleccionoPaciente();

              // console.log("Ha seleccionado paciente" + id_Paciente.id);
                    if (id_Paciente.status) 
                        {
                            enviarEjercicio(coordenadas,"estirar",id_Paciente.id, function(data)
                            {

                                if(data.status)
                                {
                                   
                                   enviarCorreo_newEjercicio({"nombre" : id_Paciente.nombre ,  "correo" : id_Paciente.correo, "tipo": "informar_paciente_new_ejercicio"}, function(data)
                                    {

                                        if(data.status)
                                        {
                                       
                                            swal
                                            ({   
                                                title   : "!Bien! :)",   
                                                text    : "Se ha asignado un nuevo ejercicio al paciente. " + data.nombre,   
                                                timer   : 2000,
                                                type    : "success",  
                                                showConfirmButton: false 
                                            });
                                
                                            limpiaCampos(campos);    
                                                           
                                         }

                                        else
                                        {
                                            swal("Error!", "No se ha podido enviar el email a: " + data.correo, "error");
                                             limpiaCampos(campos);    
                                        }
                                    });                               
                                }

                                else
                                {
                                    swal("Error!", "No se ha podido guardar el ejercicio "+ data.nombre_ejercicio +"  del paciente " + id_Paciente.nombre +", por que este ya tiene asociado un ejercicio de tipo: "+ data.tipo +" con el mismo nombre.", "error");
                                     limpiaCampos(campos);    
                                }
                            });
                            
                        }
                    else
                        {
                            sweetAlert("Oops", "Seleccione a un paciente ", "error");
                            
                        }
                
            };

        }
    }
        else
        {
           
             sweetAlert("Completar campos", "Elija alguna opcion de ejercicio", "error");
        }

     
       



    });


    nom_div("buscar").addEventListener('keyup', function(event)
    {
        resultadoBusca = []; //Reiniciar el array de resultados de búsqueda...
        var busca = false;
        if(this.value !== "")
        {
            for(var i = 0; i < todos.length; i++)
            {

                
                busca = todos[i].nombre.search(this.value) < 0;
                busca = busca && todos[i].apellido.search(this.value) < 0;
               
               
                if(busca)
                {
                    resultadoBusca.push(i);
                }
            }
        }
        muestraTodos(1,todos[i]);
    });


    function limpiaCampos(campos)
    {
        for(var i = 0; i < campos.length; i++)
        {
            $("#" + campos[i]).val("");
        }

        $("#TipoEjercicio").val("");
        $("input:radio").attr("checked", false);
        $('#Opciones').prop('selectedIndex',0);

    }

    function nom_div(div)
    {
        return document.getElementById(div);
    }
  

   
});
