using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace TestApp
{
    public partial class adminauthormanagment : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        //ADD
        protected void Button2_Click(object sender, EventArgs e)
        {
            if(checkifauthorExists())
            {
                Response.Write("<script>alert('Author id already exists');</script>");
            }
            else
            {
                addnewauthor();
            }
        }

        //update
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (checkifauthorExists())
            {
                updateauthor();
                
            }
            else
            {
                Response.Write("<script>alert('Author id doesn't exists');</script>");
            }
        }

        //Delete
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (checkifauthorExists())
            {
                deleteauthor();

            }
            else
            {
                Response.Write("<script>alert('Author id doesn't exists');</script>");
            }
        }

        // Go
        protected void Button1_Click(object sender, EventArgs e)
        {
            getAuthorByID();
        }

        //user defined
        //checks is autho exists or not
        bool checkifauthorExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from author_master_tbl where author_id='" + TextBox3.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    
                    return false;
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }

        }

        //go
        void getAuthorByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from author_master_tbl where author_id='" + TextBox3.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    TextBox4.Text = dt.Rows[0][1].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Author ID');</script>");
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        //add new author
        void addnewauthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("Insert into author_master_tbl(author_id,author_name) values(@author_id,@author_name) ", con);
                cmd.Parameters.AddWithValue("@author_id", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@author_name", TextBox4.Text.Trim());
                

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('New Author added successfully');</script>");
                clearform();
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
//update
        void updateauthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("Update author_master_tbl set author_name=@author_name where author_id='"+ TextBox3.Text.Trim() + "' ", con);
                
                cmd.Parameters.AddWithValue("@author_name", TextBox4.Text.Trim());


                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author Updated successfully');</script>");
                clearform();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }

        }

        void deleteauthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("Delete author_master_tbl where author_id='" + TextBox3.Text.Trim() + "' ", con);

               


                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author Deleted successfully');</script>");
                clearform();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }

            
        }

        void clearform()
        {
            TextBox3.Text = "";
            TextBox4.Text = "";
        }

    }
}