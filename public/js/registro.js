$(function()
{
    $("#form").submit(function(event)
    {
        var enviaForm = true;
        var campos = ["nombre", "correo", "username", "password"];
        for(var i = 0; i < campos.length; i++)
        {
            if($("#" + campos[i]).val().length === 0)
            {
                sweetAlert("Completar campos", "Por favor completa el caaaampo " + campos[i], "error");
                enviaForm = false;
                break;
            }
        }
        if(enviaForm)
        {
            //Validar que el e-mail sea válido...
            if(!validaEmail($("#correo").val()))
            {
                sweetAlert("Correo inválido", "El correo "+($("#correo").val())+", no es válido", "error");
                enviaForm = false;
            }
            if(!validaPassword($("#password").val()))
            {
                sweetAlert("Contraseña inválida", "La contraseña debe tener minimo mayusculas-minuscula-caracter especial- sin espacio en blanco", "error");
                enviaForm = false;
            }
        }
        return enviaForm;
    });
    
    var validaEmail = function(email)
	{
		var emailReg = /^([\da-zA-Z_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        return emailReg.test(email);
	};

    var validaPassword = function(password)
    {
        var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])([A-Za-z\d$@$!%*?&]|[^ ]){8,15}$/;
        return regex.test(password);
    };

   

});
