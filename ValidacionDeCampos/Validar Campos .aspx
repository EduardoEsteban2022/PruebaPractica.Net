<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Validar Campos .aspx.cs" Inherits="ValidacionDeCampos.Fomulario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        
       <div class="col-md-4"></div>
        <div class="col-md-4">
            <div class="row-fluid">
                <div class="span12">
                    <div class="login well well-small">
                        <div class="control-group">
                            <div class="input-prepend">
                                <asp:Label ID="Label1" runat="server" Text="Usuario"></asp:Label>
                                <asp:TextBox ID="txtUser" runat="server" CssClass="form-control" placeholder="Ingrese Usuario ..."></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <div class="control-group">
                            <div class="input-prepend">
                                <asp:Label ID="Label2" runat="server" Text="Contraseña"></asp:Label>
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Ingrese Contraseña ..."></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <div class="control-group justify-content-center">
                            <asp:Button ID="validateButton" runat="server" Text="Validar Formulario" CssClass="btn btn-primary" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

 

<link href="Content/bootstrap.min.css" rel="stylesheet" />
<script src="scripts/bootstrap.min.js"></script>
<script src="scripts/jquery-3.0.0.min.js"></script>
<script src="validationFields.js"></script>


