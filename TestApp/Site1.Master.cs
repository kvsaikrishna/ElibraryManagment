using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestApp
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
               if(Session["role"].Equals(""))
                {
                    LinkButton1.Visible = true; //user login
                    LinkButton2.Visible = true; //sign up

                    LinkButton3.Visible = false; //logout
                    LinkButton7.Visible = false; //hello user

                    LinkButton6.Visible = true; //admin login
                    LinkButton11.Visible = false; //author managment
                    LinkButton12.Visible = false; //publisher managment
                    LinkButton8.Visible = false; //book inventory
                    LinkButton9.Visible = false; //book issue
                    LinkButton10.Visible = false; //member managment
                }
               else if(Session["role"].Equals("user"))
                {
                    LinkButton1.Visible = false; //user login
                    LinkButton2.Visible = false; //sign up

                    LinkButton3.Visible = true; //logout
                    LinkButton7.Visible = true; //hello user
                    LinkButton7.Text = "Hello " + Session["username"].ToString();


                    LinkButton6.Visible = true; //admin login
                    LinkButton11.Visible = false; //author managment
                    LinkButton12.Visible = false; //publisher managment
                    LinkButton8.Visible = false; //book inventory
                    LinkButton9.Visible = false; //book issue
                    LinkButton10.Visible = false; //member managment
                }
                else if (Session["role"].Equals("admin"))
                {
                    LinkButton1.Visible = false; //user login
                    LinkButton2.Visible = false; //sign up

                    LinkButton3.Visible = true; //logout
                    LinkButton7.Visible = true; //hello user
                    //LinkButton7.Text = "Hello" + Session["username"].ToString();
                    LinkButton7.Text = "Hello Admin";



                    LinkButton6.Visible = false; //admin login
                    LinkButton11.Visible = true; //author managment
                    LinkButton12.Visible = true; //publisher managment
                    LinkButton8.Visible = true; //book inventory
                    LinkButton9.Visible = true; //book issue
                    LinkButton10.Visible = true; //member managment
                }
            }
            catch(Exception ex)
            {

            }
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminlogin.aspx");
        }

        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminauthormanagment.aspx");
        }

        protected void LinkButton12_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminpublishermanagment.aspx");
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminbookinventory.aspx");
        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminbookissue.aspx");
        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminmembermanagment.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("userlogin.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("usersignup.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["fullname"] = "";
            Session["role"] = "";
            Session["status"] = "";

            LinkButton1.Visible = true; //user login
            LinkButton2.Visible = true; //sign up

            LinkButton3.Visible = false; //logout
            LinkButton7.Visible = false; //hello user

            LinkButton6.Visible = true; //admin login
            LinkButton11.Visible = false; //author managment
            LinkButton12.Visible = false; //publisher managment
            LinkButton8.Visible = false; //book inventory
            LinkButton9.Visible = false; //book issue
            LinkButton10.Visible = false; //member managment
            Response.Redirect("home.aspx");
        }

        //viewbooks
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewbooks.aspx");
        }

        //user profile
        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Response.Redirect("userprofile.aspx");
        }
    }
}