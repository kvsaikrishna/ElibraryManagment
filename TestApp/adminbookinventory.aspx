<%@ Page Title="Book Inventory List" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminbookinventory.aspx.cs" Inherits="TestApp.adminbookinventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#imgview').attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
              
            }
        }
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5 ">

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Book Details</h4> 
                                    </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img id="imgview"src="book_inventory/book.png" width="100px" />
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
                                <center>
                                  <asp:FileUpload onchange="readURL(this);" class="form-control" ID="FileUpload1" runat="server"></asp:FileUpload>
                                </center>
                            </div>
                        </div>

                        <div class="row">

                            <div class="col-md-4">
                                <label>Book ID:</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox3"
                                            runat="server" placeholder="ID"></asp:TextBox>

                                        <asp:Button Class="form-control btn btn-primary " ID="Button4" runat="server" Text="Go" OnClick="Button4_Click" />
                                    </div>

                                </div>
                            </div>

                            <div class="col-md-8">
                                <label>Book Name:</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4"
                                        runat="server" placeholder="Book Name"></asp:TextBox>
                                </div>
                            </div>



                        </div>

                        <div class="row">

                            <div class="col-md-4">
                                <label>Language:</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="DropDownList1"
                                        runat="server">
                                       
                                        <asp:ListItem Text="English" Value="English" />
                                        <asp:ListItem Text="Telugu" Value="Telugu" />
                                        <asp:ListItem Text="Hindhi" Value="Hindhi" />
                                        <asp:ListItem Text="French" Value="French" />
                                        <asp:ListItem Text="Spanish" Value="Spanish" />
                                    </asp:DropDownList>
                                </div>
                                <label>Publisher Name:</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="DropDownList2"
                                        runat="server">
                                        <asp:ListItem Text="Publisher 1" Value="Publisher 1" />
                                        <asp:ListItem Text="Publisher2" Value="Publisher 2" />
                                        
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Author Name:</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="DropDownList3"
                                        runat="server">
                                       
                                        <asp:ListItem Text="A1" Value="A1" />
                                        <asp:ListItem Text="A2" Value="A2" />
                                        
                                    </asp:DropDownList>
                                </div>
                                <label>Publisher date:</label>
                                <div class="form-group">
                                     <asp:TextBox CssClass="form-control" ID="TextBox1"
                                        runat="server" placeholder="Date" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Genre:</label>
                                <div class="form-group">
                                    <asp:ListBox CssClass="form-control" ID="ListBox1" runat="server" SelectionMode="Multiple" Rows="5">
                                        <asp:ListItem Text="Action" Value="Action" />
                                        <asp:ListItem Text="Drama" Value="Drama" />
                                        <asp:ListItem Text="Love" Value="Love" />
                                        <asp:ListItem Text="Fantasy" Value="Fantasy" />
                                        <asp:ListItem Text="Thriller" Value="Thriller" />
                                        <asp:ListItem Text="Suspense" Value="Suspense" />
                                        <asp:ListItem Text="Autobiography" Value="Autobiography" />
                                        <asp:ListItem Text="Fiction" Value="Fiction" />
                                    </asp:ListBox>
                                     </div>
                            </div>

                        </div>

                        <div class="row">

                            <div class="col-md-4">
                                <label>Edition:</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox9"
                                        runat="server" placeholder="Edition" ></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Book Cost(per Unit):</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox10"
                                        runat="server" placeholder="City" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Pages:</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox11"
                                        runat="server" placeholder="Pages" ></asp:TextBox>
                                </div>
                            </div>

                        </div>

                         <div class="row">

                            <div class="col-md-4">
                                <label>Actual Stock:</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2"
                                        runat="server" placeholder="Actual Stock" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Current Stock:</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox5"
                                        runat="server" placeholder="Stock" TextMode="Number" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Issued Books:</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox6"
                                        runat="server" placeholder="Pages" TextMode="Number" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-12">
                                <label>Book Description:</label>
                                <asp:TextBox CssClass="form-control" ID="TextBox12"
                                    runat="server" placeholder="Description" 
                                    TextMode="MultiLine" Rows="2"></asp:TextBox>

                            </div>
                        </div>



                        <div class="row">
                            <div class="col-4 ">
                                <asp:Button Class="btn btn-success btn-lg btn-block mt-2 " ID="Button2"
                                    runat="server" Text="ADD" OnClick="Button2_Click" />
                            </div>
                            <div class="col-4 ">
                                <asp:Button Class="btn btn-warning btn-lg btn-block mt-2 " ID="Button1"
                                    runat="server" Text="Update" OnClick="Button1_Click" />
                            </div>
                            <div class="col-4 ">
                                <asp:Button Class="btn btn-danger btn-lg btn-block mt-2 " ID="Button3"
                                    runat="server" Text="Delete " OnClick="Button3_Click" />
                            </div>


                        </div>









                    </div>
                </div>

                <a href="home.aspx"><< Back to Home </a>
                <br>
                <br>
            </div>

            <div class="col-md-7">

                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Book Inventory List</h4> 
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
                                                        
                                                        <div class="col-lg-2">
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
    </div>


</asp:Content>
