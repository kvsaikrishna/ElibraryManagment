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
    public partial class usersignup : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        //on click sign up button
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkMemberExists())
            {
                Response.Write("<script>alert('User id already exists,Try other ID');</script>");

            }
            else
            {
                signUpNewMember();
            }
            
        }
         
        bool checkMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from member_master_tbl where member_id='"+ TextBox2.Text.Trim()+"';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if(dt.Rows.Count>=1)
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
        void signUpNewMember()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("Insert into member_master_tbl(full_name,dob,contact_no,email,state,city,pincode,full_address,member_id,password,account_status) values(@full_name,@dob,@contact_no,@email,@state,@city,@pincode,@full_address,@member_id,@password,@account_status) ", con);
                cmd.Parameters.AddWithValue("@full_name", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@email", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@state", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", TextBox8.Text.Trim());
                cmd.Parameters.AddWithValue("@pincode", TextBox9.Text.Trim());
                cmd.Parameters.AddWithValue("@full_address", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@member_id", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@password", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@account_status", "Pending");

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Sign up successful, Go to login page');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
    }
}