﻿<%@ Page Title="Book Issue" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminbookissue.aspx.cs" Inherits="TestApp.bookissue" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
            //$('#myTable').DataTable();
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5 ">

                <div class="card" >
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Book Issueing</h4> 
                                    </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/book.png" width="100px" />
                                    
                                    
                                   
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
                            
                            <div class="col-md-6">
                               <label>Member ID:</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4"
                                         runat="server" placeholder="Member ID" ></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                               <label>Book ID:</label>
                                <div class="form-group">
                                    <div class="input-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3"
                                         runat="server" placeholder="Book ID"></asp:TextBox>
                                    <asp:Button Class="btn btn-secondary " ID="Button1" 
                                        runat="server" Text="Go" OnClick="Button1_Click" />
                                        </div>
                               
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            
                            <div class="col-md-6">
                               <label>Member Name:</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1"
                                         runat="server" placeholder="Member Name" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                               <label>Book Name:</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2"
                                         runat="server" placeholder="Book Name" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            
                        </div>

                        <div class="row">
                            
                            <div class="col-md-6">
                               <label>Issue Date:</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox5"
                                         runat="server" placeholder="Issue Date" TextMode="Date" ></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                               <label>Due Date:</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox6"
                                         runat="server" placeholder="Due Date" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                            
                        </div>

                         <div class="row">
                            <div class="col-6">
                               <asp:Button Class="btn btn-primary btn-lg btn-block " ID="Button2" 
                                        runat="server" Text="Issue" OnClick="Button2_Click" />
                            </div>
                             <div class="col-6">
                               <asp:Button Class="btn btn-success btn-lg btn-block" ID="Button3" 
                                        runat="server" Text="Return" OnClick="Button3_Click" />
                            </div>

                        </div>

                       

                        



                        

                    </div>
                </div>

                <a href="home.aspx" ><< Back to Home </a>
                <br><br>
            </div>

            <div class="col-md-7">

                <div class="card" >
                    <div class="card-body">
                         <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Issued Book List</h4> 
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
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString2 %>" SelectCommand="SELECT * FROM [book_issue_tbl]"></asp:SqlDataSource>
                                <asp:GridView class="table table-striped table-bordered" 
                                    ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="member_id" HeaderText="Member ID" SortExpression="member_id" />
                                        <asp:BoundField DataField="member_name" HeaderText="Member Name" SortExpression="member_name" />
                                        <asp:BoundField DataField="book_id" HeaderText="Book ID" SortExpression="book_id" />
                                        <asp:BoundField DataField="book_name" HeaderText="Book Name" SortExpression="book_name" />
                                        <asp:BoundField DataField="issue_date" HeaderText="Issue Date" SortExpression="issue_date" />
                                        <asp:BoundField DataField="due_date" HeaderText="Due Date" SortExpression="due_date" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>

                        
                        
                    </div>
                </div>

            </div>

        </div>
    </div>

</asp:Content>
