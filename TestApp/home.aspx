<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="TestApp.home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <%--Start 1st image--%>
    <section>
        <img src="imgs/slideshow1.jpg" class="img-fluid" />
    </section>
    <%--End 1st image--%>

    <%--Start 2nd section--%>
    <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <center>
                    <h2>Our features</h2>
                    <p>Our 3 primary features</p>
                     </center>
                </div>
            </div>

             <div class="row">
                <div class="col-md-4">
                    <center>
                    <img src="imgs/library.png" width="150px"/>
                   <h4>Digitial Book</h4>
                    <p class="text-justify">Lorem ipsum dolor sit amet consectetur adipisicing elit. 
                        Corrupti aperiam cum itaque sit nostrum impedit
                        debitis, officiis repudiandae et perspiciatis doloribus optio 
                        deleniti maiores perferendis, doloremque autem
                        molestias quis? Maxime?</p>
                        </center>
                </div>

                 <div class="col-md-4">
                    <center>
                    <img src="imgs/error.png" width="150px"/>
                   <h4>Defaulters List</h4>
                    <p class="text-justify">Lorem ipsum dolor sit amet consectetur adipisicing elit. 
                        Corrupti aperiam cum itaque sit nostrum impedit
                        debitis, officiis repudiandae et perspiciatis doloribus optio 
                        deleniti maiores perferendis, doloremque autem
                        molestias quis? Maxime?</p>
                        </center>
                </div>

                 <div class="col-md-4">
                    <center>
                    <img src="imgs/search.png" width="150px"/>
                   <h4>Search Books</h4>
                    <p class="text-justify">Lorem ipsum dolor sit amet consectetur adipisicing elit. 
                        Corrupti aperiam cum itaque sit nostrum impedit
                        debitis, officiis repudiandae et perspiciatis doloribus optio 
                        deleniti maiores perferendis, doloremque autem
                        molestias quis? Maxime?</p>
                        </center>
                </div>

            </div>

        </div>
        
    </section>
    <%--End 2nd section--%>

    <%--Start 3rd image--%>
    <section>
        <img src="imgs/slideshow2.jpg" class="img-fluid" />
    </section>
    <%--End 3rd image--%>

    <%--Start 4th section--%>
    <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <center>
                    <h2>Our Process</h2>
                    <p>Simple 3 primary steps</p>
                     </center>
                </div>
            </div>

             <div class="row">
                <div class="col-md-4">
                    <center>
                    <img src="imgs/signup.png" width="150px"/>
                   <h4>Sign up</h4>
                    <p class="text-justify">Lorem ipsum dolor sit amet consectetur adipisicing elit. 
                        Corrupti aperiam cum itaque sit nostrum impedit
                        debitis, officiis repudiandae et perspiciatis doloribus optio 
                        deleniti maiores perferendis, doloremque autem
                        molestias quis? Maxime?</p>
                        </center>
                </div>

                  <div class="col-md-4">
                    <center>
                    <img src="imgs/search.png" width="150px"/>
                   <h4>Search Books</h4>
                    <p class="text-justify">Lorem ipsum dolor sit amet consectetur adipisicing elit. 
                        Corrupti aperiam cum itaque sit nostrum impedit
                        debitis, officiis repudiandae et perspiciatis doloribus optio 
                        deleniti maiores perferendis, doloremque autem
                        molestias quis? Maxime?</p>
                        </center>
                </div>

                 <div class="col-md-4">
                    <center>
                        <img src="imgs/user.png" width="150px"/>
                    
                   <h4>Visit us</h4>
                    <p class="text-justify">Lorem ipsum dolor sit amet consectetur adipisicing elit. 
                        Corrupti aperiam cum itaque sit nostrum impedit
                        debitis, officiis repudiandae et perspiciatis doloribus optio 
                        deleniti maiores perferendis, doloremque autem
                        molestias quis? Maxime?</p>
                        </center>
                </div>

                

            </div>

        </div>
        
    </section>
    <%--End 4th section--%>

</asp:Content>
