<%@ Page Title="User Login" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userlogin.aspx.cs" Inherits="TestApp.userlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">

                <div class="card" >
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/user.png" width="100px" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                   <h3>User Login</h3> 
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                   <hr> 
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label>User ID:</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1"
                                         runat="server" placeholder="User id"></asp:TextBox>
                                </div>
                                <label>Password:</label> <%--put Textmode as password--%>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2"
                                         runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <asp:Button Class="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="Log in" OnClick="Button1_Click" />
                                </div>
                                <div class="form-group">
                                    <a href="usersignup.aspx" ><input Class="btn btn-primary btn-block btn-lg" id="Button2" type="button" value="Sign Up" /></a>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>

                <a href="home.aspx" ><< Back to Home </a>
                <br><br>
            </div>
        </div>
    </div>

</asp:Content>
