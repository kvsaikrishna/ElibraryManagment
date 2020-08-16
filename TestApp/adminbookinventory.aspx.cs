﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace TestApp
{
    public partial class adminbookinventory : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath;
        static int global_actual_stock, global_current_stock, global_issued_books;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                fillauthorpublishervalues();
            }
            
            GridView1.DataBind();
        }
        //Gooo
        
        protected void Button4_Click(object sender, EventArgs e)
        {
            getbookbyID();
        }

        //ADD
        protected void Button2_Click(object sender, EventArgs e)
        {
            if(checkifbookExists())
            {
                Response.Write("<script>alert('Book Id or Book name already exists');</script>");
            }
            else
            {
                addnewBook();
            }
        }

        //Update
        protected void Button1_Click(object sender, EventArgs e)
        {
            updatebookbyID();
        }

        //Delete
        protected void Button3_Click(object sender, EventArgs e)
        {
            deletebookbyID();
        }

        //user defined functions

        void fillauthorpublishervalues()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if(con.State==ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select author_name from author_master_tbl;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                DropDownList3.DataSource = dt;
                DropDownList3.DataValueField = "author_name";
                DropDownList3.DataBind();

                cmd=new SqlCommand("select publisher_name from publisher_master_tbl;", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                DropDownList2.DataSource = dt;
                DropDownList2.DataValueField = "publisher_name";
                DropDownList2.DataBind();

            }
            catch(Exception ex)
            {

            }
        }

        //Checkif book exists
        bool checkifbookExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from book_master_tbl where book_id='" + TextBox3.Text.Trim() + "'or book_name='"+ TextBox4.Text.Trim() + "';", con);
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

        //Add
        void addnewBook()
        {
            try
            {
                //genre
                string genre = "";
                foreach (int i in ListBox1.GetSelectedIndices())
                {
                    genre = genre + ListBox1.Items[i] + ",";
                }
                //to remove comma for last
                genre = genre.Remove(genre.Length - 1);

                //file path
                string filepath = "~/book_inventory/book1.jpg";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("~/book_inventory/" + filename));
                filepath = "~/book_inventory/" + filename;

                SqlConnection con = new SqlConnection(strcon);
                if(con.State==ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("insert into book_master_tbl(book_id,book_name,genre,author_name,publisher_name,publish_date,language,edition,book_cost,no_of_pages,book_description,actual_stock,current_stock,book_img_link) values(@book_id,@book_name,@genre,@author_name,@publisher_name,@publish_date,@language,@edition,@book_cost,@no_of_pages,@book_description,@actual_stock,@current_stock,@book_img_link)", con);
                cmd.Parameters.AddWithValue("@book_id", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", TextBox4.Text.Trim());

                cmd.Parameters.AddWithValue("@genre", genre);

                cmd.Parameters.AddWithValue("@author_name", DropDownList3.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publisher_name", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publish_date", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@language", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@edition", TextBox9.Text.Trim());
                cmd.Parameters.AddWithValue("@book_cost", TextBox10.Text.Trim());
                cmd.Parameters.AddWithValue("@no_of_pages", TextBox11.Text.Trim());
                cmd.Parameters.AddWithValue("@book_description", TextBox12.Text.Trim());
                cmd.Parameters.AddWithValue("@actual_stock", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@current_stock", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@book_img_link", filepath);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Book added sucessfully');</script>");
                GridView1.DataBind();

            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //gooo
        void getbookbyID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from book_master_tbl where book_id='" + TextBox3.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    TextBox4.Text = dt.Rows[0]["book_name"].ToString();
                    TextBox1.Text = dt.Rows[0]["publish_date"].ToString();
                    TextBox9.Text = dt.Rows[0]["edition"].ToString();
                    TextBox10.Text = dt.Rows[0]["book_cost"].ToString().Trim();
                    TextBox11.Text = dt.Rows[0]["no_of_pages"].ToString().Trim();
                    TextBox2.Text = dt.Rows[0]["actual_stock"].ToString().Trim();
                    TextBox5.Text = dt.Rows[0]["current_stock"].ToString().Trim();
                    TextBox12.Text = dt.Rows[0]["book_description"].ToString();

                    TextBox6.Text = "" + (Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString()) - Convert.ToInt32(dt.Rows[0]["current_stock"].ToString()));

                    DropDownList1.SelectedValue = dt.Rows[0]["language"].ToString();
                    DropDownList2.SelectedValue = dt.Rows[0]["publisher_name"].ToString();
                    DropDownList3.SelectedValue = dt.Rows[0]["author_name"].ToString();
//foe genre multi selection
                    ListBox1.ClearSelection();
                    string[] genre = dt.Rows[0]["genre"].ToString().Trim().Split(',');
                    for (int i = 0; i < genre.Length; i++)
                    {
                        for(int j=0; j<ListBox1.Items.Count;j++)
                        {
                            if(ListBox1.Items[j].ToString()==genre[i])
                            {
                                ListBox1.Items[j].Selected = true;
                            }
                        }
                    }

                    global_actual_stock = Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString().Trim());
                    global_current_stock = Convert.ToInt32(dt.Rows[0]["current_stock"].ToString().Trim());
                    global_issued_books = global_actual_stock - global_current_stock;
                    global_filepath = dt.Rows[0]["book_img_link"].ToString();



                }
                else
                {
                    Response.Write("<script>alert('Inavlid id');</script>");


                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
               
            }

        }

        

      

        //update
        void updatebookbyID()
        {
            if (checkifbookExists())
            {
                try
                {
                    int actual_stock = Convert.ToInt32(TextBox2.Text.Trim());
                    int current_stock = Convert.ToInt32(TextBox5.Text.Trim());

                    if(global_actual_stock==actual_stock)
                    {

                    }
                    else
                    {
                        if(actual_stock < global_issued_books)
                        {
                            Response.Write("<script>alert('Actual stock value cannot be lessthan issued books');</script>");
                            return;
                        }
                        else
                        {
                            current_stock = actual_stock - global_issued_books;
                            TextBox5.Text = "" + current_stock;
                        }
                    }

                    //genre
                    string genre = "";
                    foreach (int i in ListBox1.GetSelectedIndices())
                    {
                        genre = genre + ListBox1.Items[i] + ",";
                    }
                    //to remove comma for last
                    genre = genre.Remove(genre.Length - 1);

                    //file path
                    string filepath = "~/book_inventory/book1.jpg";
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    if (filename == "" || filename == null)
                    {
                        filepath = global_filepath;
                    }
                    else
                    {
                        FileUpload1.SaveAs(Server.MapPath("~/book_inventory/" + filename));
                        filepath = "~/book_inventory/" + filename;
                    }

                    

                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("update book_master_tbl set book_name=@book_name,genre=@genre,author_name=@author_name,publisher_name=@publisher_name,publish_date=@publish_date,language=@language,edition=@edition,book_cost=@book_cost,no_of_pages=@no_of_pages,book_description=@book_description,actual_stock=@actual_stock,current_stock=@current_stock,book_img_link=@book_img_link where book_id= '" + TextBox3.Text.Trim() + "'", con);

                    cmd.Parameters.AddWithValue("@book_name", TextBox4.Text.Trim());

                    cmd.Parameters.AddWithValue("@genre", genre);

                    cmd.Parameters.AddWithValue("@author_name", DropDownList3.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@publisher_name", DropDownList2.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@publish_date", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@language", DropDownList1.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@edition", TextBox9.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_cost", TextBox10.Text.Trim());
                    cmd.Parameters.AddWithValue("@no_of_pages", TextBox11.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_description", TextBox12.Text.Trim());
                    cmd.Parameters.AddWithValue("@actual_stock", actual_stock.ToString());
                    cmd.Parameters.AddWithValue("@current_stock", current_stock.ToString());
                    cmd.Parameters.AddWithValue("@book_img_link", filepath);


                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();
                    Response.Write("<script>alert('Book updated successfully');</script>");
                    


                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Book ID');</script>");
            }

        }

        //Delete

        void deletebookbyID()
        {
            if (checkifbookExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("delete book_master_tbl where book_id='" + TextBox3.Text.Trim() + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Book deleted successfully');</script>");
                    
                    GridView1.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Invalid Book ID');</script>");
            }

        }



    }
}