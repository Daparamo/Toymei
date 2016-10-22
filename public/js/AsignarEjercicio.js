$(function()
{
	listadoPersonas = [];
    var ind;
  	traerPersonas();    
    
//Traer Personas
//    
    $("#asignarEjercicio").click(function(event) {
        alert("lol");
        crearEjercicio();
    });
    function crearEjercicio (callback)
    {        
        var dataEjercicio = {};
        dataEjercicio.nombreEjercicio = $("#NombreEjercicio").val();
        dataEjercicio.repeticiones = $("#repeticionesEjercicio").val();
        dataEjercicio.repeticiones = $("#tiempoEjercicio").val();        
        
        $.ajax(
        {
            url         : "crearEjercicio",
            type        : "POST",
            data        : JSON.stringify(dataEjercicio),
            dataType    : "json",
            contentType: "application/json; charset=utf-8"
        }).done(function(data)
        { 
            console.log(data)
            //listadoPersonas=data;
           //console.log(listadoPersonas);            
           //imprimeUsuarios(listadoPersonas);  
        }).error(function(request, status, error)
        {
            //sweetAlert("Oops...", request.responseText, "error");
            console.log("OOOOOPPPPSSSS::::: "+error);
            alert(request.responseText);
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
           imprimeUsuarios(listadoPersonas);  
        }).error(function(request, status, error)
        {
            sweetAlert("Oops...", request.responseText, "error");
            //alert(request.responseText);
            window.location = "/";
        });
    } 

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
        var txt = "<table class = 'table-fill'	>" + 
                    "<thead><tr>" +                     
                    "<th>Nombre</th>" +                                                            
                    "<th> </th>" +                     
                    "<tbody class = 'table-hover'>";
        for(var i = 0; i < listadoPersonas.length; i++)
        {
            txt += "<tr>";
            var datosPersona = listadoPersonas[i];

           // console.log(datosPersona)                          
                txt += "<td>"+datosPersona.nombre +" "+ datosPersona.apellido+"</td>";                                

            //Editar...
            txt += "<td><center>";
            txt += "<input type='checkbox' name='e_"+i+"' value='e_"+i+"' />";
            //txt += "<img src = 'img/check.png' border = '0' id = 'e_"+i+"'/>";
            txt += "</center</td>";            
        }
        txt += "</tbody></table>";
        nom_div("lista").innerHTML = txt;

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

});

/*
        //Poner las acciones de editar y eliminar...
        for(var i = 0; i < listadoPersonas.length; i++)
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
*/