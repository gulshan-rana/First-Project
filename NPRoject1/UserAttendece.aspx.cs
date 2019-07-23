using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace NPRoject1
{
    public partial class UserAttendece : System.Web.UI.Page
    {
        string Constring = ConfigurationManager.ConnectionStrings["DataBase"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                refreshdata();
                refreshPage();
            }
        }

        public void refreshPage()
        {
           
            SqlConnection objSqlConnection = new SqlConnection(Constring);
            SqlCommand objSqlCommand = new SqlCommand("Select * From UserAttendence   Where UserID='" + Session["id"] + "' Order  by id DESC", objSqlConnection);
            SqlDataAdapter SDA = new SqlDataAdapter(objSqlCommand);
            DataTable DT = new DataTable();
            SDA.Fill(DT);
            if (DT.Rows.Count == 0)
            {
                IDCheckIN.Enabled = true;
                IDCheckOut.Enabled = false;
            }
            else {
                var Checkin =Convert.ToString( DT.Rows[0]["CheckIN"]);
                   var chckout =Convert.ToString( DT.Rows[0]["CheckOut"]);
                    if (Checkin != "" && chckout != "")
            {
                DateTime CheckIN = Convert.ToDateTime(DT.Rows[0]["CheckIN"]);
                DateTime Checkout = Convert.ToDateTime(DT.Rows[0]["CheckOut"]);
                DateTime now = DateTime.Now;
                DateTime yesterday = now.AddDays(-1);

                if (CheckIN > yesterday && CheckIN <= now && Checkout > yesterday && Checkout <= now)
                {
                    IDCheckIN.Enabled = false;
                    IDCheckOut.Enabled = false;
                 
                    string message = "Today you have Sucessfully Done CheckIN And CheckOut .";
                    string script = "window.onload = function(){ alert('";
                    script += message;
                    script += "')};";
                    ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                }

                else
                {
                    var Checkoutt = Convert.ToString(DT.Rows[0]["CheckOut"]);
                    if (Checkoutt == "")
                    {
                        IDCheckIN.Enabled = false;
                    }
                    else
                    {
                        IDCheckOut.Enabled = false;
                    }

                }


            }
            else
            {
                var Checkoutt = Convert.ToString(DT.Rows[0]["CheckOut"]);
                if (Checkoutt == "")
                {
                    IDCheckIN.Enabled = false;
                }
                else
                {
                    IDCheckOut.Enabled = false;
                }
            }

            }


           
            
        }

       
        public void refreshdata()
        {
            int useid = Convert.ToInt32(Session["id"]);
            SqlConnection objSqlConnection = new SqlConnection(Constring);
            SqlCommand objSqlCommand = new SqlCommand("SearchData", objSqlConnection);
            objSqlCommand.CommandType = CommandType.StoredProcedure;
            objSqlCommand.Parameters.AddWithValue("@Searchto", ISearchTo.Value);
            objSqlCommand.Parameters.AddWithValue("@SearchFrom", ISearchFrom.Value);
            objSqlCommand.Parameters.AddWithValue("@UserID", useid);
            SqlDataAdapter objSqlDataAdapter = new SqlDataAdapter(objSqlCommand);
            DataTable dt = new DataTable();
            objSqlDataAdapter.Fill(dt);
            GridViewID.DataSource = dt;
            GridViewID.DataBind();
            
        }
        
        protected void IDCheckIN_Click(object sender, EventArgs e)
        {
            SqlConnection objSqlConnection = new SqlConnection(Constring);
            SqlCommand objSqlCommand = new SqlCommand("Insert Into UserAttendence  (CheckIN,UserID,CreatedDate)values(@CheckIN,@UserID,@CreatedDate)", objSqlConnection);
            objSqlConnection.Open();
            objSqlCommand.Parameters.AddWithValue("@CheckIN",DateTime.Now);
            ViewState["Checkin"] = DateTime.Now;
            //var CheckInDate = ViewState["Checkin"];
            objSqlCommand.Parameters.AddWithValue("@UserID", Convert.ToInt32(Session["id"]));
            objSqlCommand.Parameters.AddWithValue("@CreatedDate",DateTime.Now);
            objSqlCommand.ExecuteNonQuery();
            IDCheckIN.Enabled = false;
            IDCheckOut.Enabled = true;
            objSqlConnection.Close();
            refreshdata();
            lblMessage.Text = "Check IN SucessFully";
           

        }

        protected void IDCheckOut_Click(object sender, EventArgs e)
        {
            SqlConnection objsqlconnection = new SqlConnection(Constring);
            SqlCommand objsqlcommand = new SqlCommand("AttendenceCheckout ", objsqlconnection);
            objsqlcommand.CommandType = CommandType.StoredProcedure;
            objsqlcommand.Parameters.AddWithValue("@id", Session["id"]);
            objsqlconnection.Open();
            objsqlcommand.Parameters.AddWithValue("@checkout", DateTime.Now);
            objsqlcommand.ExecuteNonQuery();
            IDCheckOut.Enabled = false;
            IDCheckIN.Enabled = true;
            objsqlconnection.Close();
            refreshdata();
            lblMessage.Text = "Check Out SucessFully";
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

            refreshdata();
     
        }

        protected void GridViewID_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewID.PageIndex = e.NewPageIndex;
            refreshdata();
        }
    }
}