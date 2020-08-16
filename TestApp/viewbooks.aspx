<%@ Page Title="View Books" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="viewbooks.aspx.cs" Inherits="TestApp.viewbooks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });

       
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <center>
                    <h3>Book inventory list</h3>
                </center>
                
                <br />
                <div class="row">
                    <div class="card">
                    <div class="card-body">
                       
                        

                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString2 %>" SelectCommand="SELECT * FROM [book_master_tbl]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered"
                                    ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="book_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="book_id" HeaderText="ID" ReadOnly="True" SortExpression="book_id" >
                                        
                                    
                                        <ItemStyle Font-Bold="True" />
                                        </asp:BoundField>
                                        
                                    <%--Custom grid view--%>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <div class="container-fluid">
                                                    <div class="row">
                                                        <div class="col-lg-10">
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("book_name") %>' Font-Bold="True" Font-Size="Large"></asp:Label>
                                                                
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    
                                                                    Author-<asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Medium" Text='<%# Eval("author_name") %>'></asp:Label>
                                                                    &nbsp;| Genre-<asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Medium" Text='<%# Eval("genre") %>'></asp:Label>
                                                                    &nbsp;| Language-
                                                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Medium" Text='<%# Eval("language") %>'></asp:Label>
                                                                    
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12">

                                                                    Publisher-<asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Medium" Text='<%# Eval("publisher_name") %>'></asp:Label>
                                                                    &nbsp;| Publisher Date-<asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Medium" Text='<%# Eval("publish_date") %>'></asp:Label>
                                                                    &nbsp;| Pages-<asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="Medium" Text='<%# Eval("no_of_pages") %>'></asp:Label>
                                                                    &nbsp;| Edition-<asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Medium" Text='<%# Eval("edition") %>'></asp:Label>

                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12">

                                                                    Cost-<asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Medium" Text='<%# Eval("book_cost") %>'></asp:Label>
                                                                    &nbsp;| Actual Stock-<asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="Medium" Text='<%# Eval("actual_stock") %>'></asp:Label>
                                                                    &nbsp;| Available Stock-<asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Size="Medium" Text='<%# Eval("current_stock") %>'></asp:Label>

                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12">

                                                                    Description-<asp:Label ID="Label12" runat="server" Font-Bold="False" Font-Italic="True" Font-Size="Small" Text='<%# Eval("book_description") %>'></asp:Label>

                                                                </div>
                                                            </div>

                                                        </div>
                                                        
                                                        <div class="col-lg-2 ">
                                                            <asp:Image class="img-fluid p-2" ID="Image1" runat="server" ImageUrl='<%# Eval("book_img_link") %>' />
                                                        </div>

                                                    </div>

                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                    
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>



                    </div>
                </div>

                </div>


            </div>
            
            <center>
                <a href="home.aspx"><< Back to Home </a>
            </center>
            
        </div>
        
    </div>

</asp:Content>
