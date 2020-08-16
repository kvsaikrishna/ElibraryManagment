﻿<%@ Page Title="Admin Login" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminlogin.aspx.cs" Inherits="TestApp.adminlogin" %>
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
                                    <img src="imgs/admin.png"width="100px" />
                                    
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                   <h3>Admin Login</h3> 
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
                                <label>Admin ID:</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1"
                                         runat="server" placeholder="Admin Login"></asp:TextBox>
                                </div>
                                <label>Password:</label> <%--put Textmode as password--%>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2"
                                         runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <asp:Button Class="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="Log in" OnClick="Button1_Click" />
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
