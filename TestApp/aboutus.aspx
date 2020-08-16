<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="aboutus.aspx.cs" Inherits="TestApp.aboutus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!--START ABOUT US BREADCRUMB  -->
  <section class="breadcrumb-section">
    <div class="container p-1 p-sm-2">
      <div class="row">
        <div class="col-12">
          <h2>About Us</h2>
          <ol class="breadcrumb">
            <li class="breadcrumb-item" ><a href="home.aspx" >Home</a> </li>
            <li class="breadcrumb-item" >About Us </li>
          </ol>
        </div>
      </div>
    </div>
  </section>
  <!--END ABOUT US BREADCRUMB  -->

     <!--START ABOUT US DESCRIPTION  -->
  <section class="about-company-section">
    <div class="container p-1 p-sm-3">
      <div class="row">
        <div class="col-12 text-center">
          <h2>About Us</h2>
          <hr>
        </div>
        <div class="col-md-3">
          <img src="imgs/library.png" class="img-fluid" alt=""/>
        </div>
        <div class="col-md-9">
          <p>
            Lorem ipsum dolor sit amet consectetur adipisicing elit. 
            Ipsum cupiditate quae commodi iste eaque pariatur amet, 
            illo earum accusantium magni vitae, doloremque, iure obcaecati
             nihil deleniti. Aut minus deserunt praesentium?
          </p>
          <p>
            Lorem ipsum dolor sit amet consectetur adipisicing elit. 
            Ipsum cupiditate quae commodi iste eaque pariatur amet, 
            illo earum accusantium magni vitae, doloremque, iure obcaecati
             nihil deleniti. Aut minus deserunt praesentium?
          </p>
          <p>
            Lorem ipsum dolor sit amet consectetur adipisicing elit. 
            Ipsum cupiditate quae commodi iste eaque pariatur amet, 
            illo earum accusantium magni vitae, doloremque, iure obcaecati
             nihil deleniti. Aut minus deserunt praesentium?
          </p>
        </div>

      </div>
    </div>
  </section>
  <!--START ABOUT US DESCRIPTION  -->

</asp:Content>
