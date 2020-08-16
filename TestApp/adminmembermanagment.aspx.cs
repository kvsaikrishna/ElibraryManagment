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
    public partial class adminmembermanagment : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        //Go
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            getmemberbyID();

        }

        //Active button
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            updatememberstatusbyID("Active");
        }

        //Pending
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            updatememberstatusbyID("Pending");
        }

        //Deactivate
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            updatememberstatusbyID("Deactivate");
        }

        //Delete
        protected void Button2_Click(object sender, EventArgs e)
        {
            deletememberbyID();

        }


        //checks is autho exists or not
        bool checkifmemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from member_master_tbl where member_id='" + TextBox3.Text.Trim() + "';", con);
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

        //Go
        void getmemberbyID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from member_master_tbl where member_id='" + TextBox3.Text.Trim() +"'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        TextBox4.Text= dr.GetValue(0).ToString();
                        TextBox7.Text = dr.GetValue(10).ToString();
                        TextBox1.Text = dr.GetValue(1).ToString();
                        TextBox2.Text = dr.GetValue(2).ToString();
                        TextBox8.Text = dr.GetValue(3).ToString();
                        TextBox9.Text = dr.GetValue(4).ToString();
                        TextBox10.Text = dr.GetValue(5).ToString();
                        TextBox11.Text = dr.GetValue(6).ToString();
                        TextBox12.Text = dr.GetValue(7).ToString();

                        
                    }
                    
                }
                else
                {
                    Response.Write("<script>alert('Invalid');</script>");

                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //Active-pending-deactivate
        void updatememberstatusbyID(string status)
        {
            if (checkifmemberExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("update member_master_tbl set account_status='" + status + "' where member_id='" + TextBox3.Text.Trim() + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();
                    Response.Write("<script>alert('Member status updated');</script>");
                    clearform();


                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Member ID');</script>");
            }

            
        }

        //Delete
        void deletememberbyID()
        {
            if (checkifmemberExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("delete member_master_tbl where member_id='" + TextBox3.Text.Trim() + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Member deleted successfully');</script>");
                    clearform();
                    GridView1.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Invalid Member ID');</script>");
            }

        }

        //clearform
        void clearform()
        {
            TextBox4.Text = "";
            TextBox7.Text = "";
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox8.Text = "";
            TextBox9.Text = "";
            TextBox10.Text = "";
            TextBox11.Text = "";
            TextBox12.Text = "";


        }

        
        

    }
    }
