<%@ Page Title="Author Managment" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminauthormanagment.aspx.cs" Inherits="TestApp.adminauthormanagment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
            //$('#myTable').DataTable();
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-md-5 ">

                <div class="card" >
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Author Details</h4> 
                                    </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/blogger.png" width="100px"/>
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
                            <div class="col-md-4">
                               <label>Author ID:</label>
                                <div class="form-group">
                                    <div class="input-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3"
                                         runat="server" placeholder="ID"></asp:TextBox>
                                    <asp:Button Class="btn btn-secondary " ID="Button1" 
                                        runat="server" Text="Go" OnClick="Button1_Click" />
                                        </div>
                               
                                </div>
                            </div>
                            <div class="col-md-8">
                               <label>Author Name:</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4"
                                         runat="server" placeholder="Author Name" ></asp:TextBox>
                                </div>
                            </div>
                        </div>

                         <div class="row">
                            <div class="col-4">
                               <asp:Button Class="btn btn-success btn-lg btn-block " ID="Button2" 
                                        runat="server" Text="Add" OnClick="Button2_Click" />
                            </div>
                             <div class="col-4">
                               <asp:Button Class="btn btn-warning btn-lg btn-block" ID="Button3" 
                                        runat="server" Text="Update" OnClick="Button3_Click" />
                            </div>
                             <div class="col-4">
                               <asp:Button Class="btn btn-danger btn-lg btn-block" ID="Button4" 
                                        runat="server" Text="Delete" OnClick="Button4_Click" />
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
                                    <h4>Author List</h4> 
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
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [author_master_tbl]"></asp:SqlDataSource>
                            <div class="col">
                                
                                <asp:GridView class="table table-striped table-bordered" 
                                    ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="author_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="author_id" HeaderText="author_id" ReadOnly="True" SortExpression="author_id" />
                                        <asp:BoundField DataField="author_name" HeaderText="author_name" SortExpression="author_name" />
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
