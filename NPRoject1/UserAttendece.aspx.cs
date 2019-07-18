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
             if(!Page.IsPostBack)
            {
                refreshdata();
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
            objSqlConnection.Close();
            refreshdata();
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
            objsqlconnection.Close();
            refreshdata();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

            refreshdata();
            //objSqlConnection.Close();
        }
    }
}