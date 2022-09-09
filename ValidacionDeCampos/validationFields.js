$("#validateButton").click(function () {

    if ($("#txtUser").val().trim() == "") {
        alert("El campo usuario es requerido ...");
    }

    else if ($("#txtPassword").val().trim() == "") {
        alert("El campo contraseña es requerido ...");
    }
    else {
        alert("Validación exitosa.");

    }
});