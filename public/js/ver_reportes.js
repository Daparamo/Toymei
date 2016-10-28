$(document).ready(function() {
    
    
    var resultadoBusca = []; //Guarda los usuarios que cumplen con el criterio de búsqueda...
    listadoPersonas = [];
    var ind;
    traerPersonasxNoInformes();
    todos = [];

   // $(".se-pre-con").fadeOut("slow");


function traerPersonasxNoInformes (callback)
 {        
    $.ajax(
    {
        url         : "traerPersonasxNoInformes",
        type        : "GET",
        data        : "",
        dataType    : "json",
        contentType: "application/json; charset=utf-8"
    }).done(function(data)
    { 


       listadoPersonas=data.data;
       console.log(listadoPersonas);
       imprimeUsuarios(data);



    }).error(function(request, status, error)
    {
        sweetAlert("Oops...", request.responseText, "error");
        window.location = "/";
    });
}



    //Para guardar el nombre del usuario...
    var $nomUsuario = $("#titulo").html();
  



    function updateEjercicio (ind,callback) 
    {
        var data = {};
        
        data.nombre_ejercicio = $("#nombre_ejercicio").val();
        data.tiempo = $("#tiempo").val();
        data.repeticiones = $("#repeticiones").val();
        data.tipo = $("#tipo_ejercicio").val();
        data.id_ejercicio = listadoEjercicios[ind].id_ejercicio;
        data.id_paciente = listadoEjercicios[ind].id_paciente;

        //console.log(listadoEjercicios[ind].id_ejercicio)
    
         
        $.ajax(
        {
            url         : "updateEjercicio",
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



    

 

    

function enviarEmailEjercicioEliminado (datos,callback) 
    {

        

        var data = {};
        data.correo = datos.correo;
        data.tipo = datos.tipo;
        data.nombre = datos.nombre + " " + datos.apellido;
        
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
        }).error(function(request, status, error)
        {
            sweetAlert("Oops...", request.responseText, "error");
            //alert(request.responseText);
            window.location = "/";
        });

    }







 

  













//Script para poner la primera en mayuscula
function MaysPrimera(string){
  return string.charAt(0).toUpperCase() + string.slice(1);
}




    var imprimeUsuarios = (function imprimeUsuarios()
    {
        var muestra = true;
        var txt = "<table class = 'table-fill'>" + 
                    "<thead><tr>" + 
                    "<th>Nombre Paciente</th>" +
                    "<th>Ver</th>" +  
                    "<th>Enviar</th>" + 
                    "<th>Descargar</th></tr></thead>" + 
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
            var datosPersonas = listadoPersonas[i];

           // console.log(datosPersona)

           
                txt += "<td><center>" + MaysPrimera(datosPersonas.nombre.toLowerCase()) + " " + MaysPrimera(datosPersonas.apellido.toLowerCase()) + "</center></td>";
                

                //Editar...
                //Ver...
                txt += "<td><center>";
                txt += "<img src = 'img/ver.png' border = '0' id = 'v_"+i+"'/>";
                txt += "</center</td>";
                txt += "</tr>";
                
                //Enviar...
                txt += "<td><center>";
                txt += "<img src = 'img/enviar.png' border = '0' id = 'e_"+i+"'/>";
                txt += "</center</td>";
                
                //Descargar...
                txt += "<td><center>";
                txt += "<img src = 'img/save.png' border = '0' id = 'd_"+i+"'/>";
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
                    //console.log(ind);
                    if(ind >= 0)
                    {


                        if (listadoEjercicios[ind].tipo.toLowerCase() === "estiramiento")
                        {
                            nom_div("nombre_paciente").value = listadoEjercicios[ind].nombre + " " + listadoEjercicios[ind].apellido ;
                            //No lo va poder modificar
                            $('#nombre_paciente').prop('disabled', true);
                            nom_div("tipo_ejercicio").value = listadoEjercicios[ind].tipo;
                            //No lo va poder modificar
                            $('#tipo_ejercicio').prop('disabled', true);
                            nom_div("nombre_ejercicio").value = listadoEjercicios[ind].nombre_ejercicio;
                            nom_div("tiempo").value = listadoEjercicios[ind].tiempo;
                            nom_div("repeticiones").value = listadoEjercicios[ind].repeticiones;
                            $('#repeticiones').hide();
                        }
                        else
                        {
                            nom_div("nombre_paciente").value = listadoEjercicios[ind].nombre + " " + listadoEjercicios[ind].apellido ;
                            //No lo va poder modificar
                            $('#nombre_paciente').prop('disabled', true);
                            nom_div("tipo_ejercicio").value = listadoEjercicios[ind].tipo;
                            //No lo va poder modificar
                            $('#tipo_ejercicio').prop('disabled', true);
                            nom_div("nombre_ejercicio").value = listadoEjercicios[ind].nombre_ejercicio;
                            nom_div("tiempo").value = listadoEjercicios[ind].tiempo;
                            nom_div("repeticiones").value = listadoEjercicios[ind].repeticiones;
                            $('#repeticiones').show();

                        }

                        $('#guarda').show();




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
                    var idEjercicio = listadoEjercicios[ind].id_ejercicio;
                  


                  //////*****/////////

                  swal({
                          title: "¿Estás segur@",
                          text: "Se eliminara el ejercicio " + listadoEjercicios[ind].nombre_ejercicio + " del paciente " + listadoEjercicios[ind].nombre + " " + listadoEjercicios[ind].apellido,
                          type: "warning",
                          showCancelButton: true,
                          confirmButtonColor: "#DD6B55",
                          confirmButtonText: "Si, borrar ejercicio!",
                          cancelButtonText: "No, cancelar plx!",
                          closeOnConfirm: false,
                          closeOnCancel: false
                        },
                        function(isConfirm)
                        {
                          if (isConfirm) 
                          {
                            eliminarEjercicio(ind,function(data)
                            {
                                if(data.status)
                                {
                                    sweetAlert("Oops", "No se pudo eliminar.", "error");
                                }
                                else
                                {
                                    ind = buscaIndice(idEjercicio);
                                    if(ind >= 0)
                                    {



                                        enviarEmailEjercicioEliminado({"apellido" : listadoEjercicios[ind].apellido ,"nombre" : listadoEjercicios[ind].nombre ,  "correo" : listadoEjercicios[ind].correo, "tipo": "informar_pacienteEliminadoEjercicio"}, function(data)
                                        {

                                            if(data.status)
                                            {
                                                listadoEjercicios.splice(ind, 1);
                                                swal({   title: "Eliminado!",   text: "Se ha elimiando exitosamente",   timer: 1500,   showConfirmButton: false, type : "success"});
                                                traerPersonasxNoInformes();                               
                                            }

                                            else
                                            {
                                                swal("Error!", "No se ha podido enviar el email a: " + data.correo, "error");
                                            }
                                        });   

                                 }//                            
                                }
                            });
                          } 

                          else 
                          {
                            swal("Cancelado", "El ejercicio no se ha eliminado :)", "error");
                          }
                        });


 
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
        for(var i in listadoEjercicios)
        {
            if(listadoEjercicios[i].id_ejercicio === id)
            {
                indice = i;
                break;
            }
        }
        return indice;
    }





    nom_div("buscar").addEventListener('keyup', function(event)
    {
        resultadoBusca = []; //Reiniciar el array de resultados de búsqueda...
        var busca = false;
        if(this.value !== "")
        {
            for(var i = 0; i < listadoEjercicios.length; i++)
            {

                busca = listadoEjercicios[i].cedula.search(this.value) < 0;
                busca = busca && listadoEjercicios[i].nombre.search(this.value) < 0;
                busca = busca && listadoEjercicios[i].apellido.search(this.value) < 0;
                busca = busca && listadoEjercicios[i].correo.search(this.value) < 0;
                busca = busca && listadoEjercicios[i].fecha_inicio.search(this.value) < 0;
                if(busca)
                {
                    resultadoBusca.push(i);
                }
            }
        }
        imprimeUsuarios();
    });

    function limpiaCampos(campos)
    {
        for(var i = 0; i < campos.length; i++)
        {
            $("#" + campos[i]).val("");
        }
    }

    
});
