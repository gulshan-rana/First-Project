using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;


namespace NPRoject1
{
    public partial class AdminAttendenceshow : System.Web.UI.Page
    {
        string constring = ConfigurationManager.ConnectionStrings["DataBase"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                DropDownList();
                refreshdata();
              

            }
        }
        

        public void refreshdata()
        {
            SqlConnection objSqlConnection = new SqlConnection(constring);
            SqlCommand objSqlCommand = new SqlCommand("AdminAttendenceShownew", objSqlConnection);
            objSqlCommand.Parameters.AddWithValue("@id", DDName.SelectedItem.Value);
            Session["IID"] = DDName.SelectedItem.Value;
            objSqlCommand.Parameters.AddWithValue("@DDName", DDName.SelectedItem.Text);
            
            objSqlCommand.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter objSqlDataAdapter = new SqlDataAdapter(objSqlCommand);
            DataTable objDataTable = new DataTable();
            objSqlDataAdapter.Fill(objDataTable);
            GridViewID.DataSource = objDataTable;
            GridViewID.DataBind();

        }

        public void DropDownList()
        {
            DDName.Items.Clear();
            SqlConnection objSqlConnection = new SqlConnection(constring);
            SqlCommand objSqlCommand = new SqlCommand("Select * From LoginP ", objSqlConnection);
            SqlDataAdapter DA = new SqlDataAdapter(objSqlCommand);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            DDName.DataSource = DT;
            DDName.DataBind();
            Session["id"] = DT.Rows[0]["id"];
            DDName.Items.Insert(0, new ListItem("--Select User Name--", "0"));
        }

        protected void DDName_SelectedIndexChanged(object sender, EventArgs e)
        {
            refreshdata();
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            SqlConnection objSqlConnection = new SqlConnection(constring);
            SqlCommand objSqlCommand = new SqlCommand("AdminSearchDate", objSqlConnection);
            objSqlCommand.CommandType = CommandType.StoredProcedure;
            objSqlCommand.Parameters.AddWithValue("@id", Session["IID"]);
            objSqlCommand.Parameters.AddWithValue("@Searchto", SearchTo.Value);
            objSqlCommand.Parameters.AddWithValue("@SearchFrom", SearchFrom.Value);
            SqlDataAdapter objSqlDataAdapter = new SqlDataAdapter(objSqlCommand);
            DataTable objDataTable = new DataTable();
            objSqlDataAdapter.Fill(objDataTable);
            GridViewID.DataSource = objDataTable;
            GridViewID.DataBind();
        }

        protected void GridViewID_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridViewID.DataKeys[e.RowIndex].Values[0]);
            SqlConnection objSqlConnection = new SqlConnection(constring);
            SqlCommand objSqlCommand = new SqlCommand("DeleteInfo", objSqlConnection);
            objSqlCommand.CommandType = CommandType.StoredProcedure;
            objSqlCommand.Parameters.AddWithValue("@id", id);
            objSqlCommand.Connection = objSqlConnection;
            objSqlConnection.Open();
            objSqlCommand.ExecuteNonQuery();
            objSqlConnection.Close();
            refreshdata();

        }

        protected void GridViewID_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if(e.Row.RowType==DataControlRowType.DataRow&&e.Row.RowIndex!=GridViewID.EditIndex)
            {
                (e.Row.Cells[3].Controls[0] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
                //(e.Row.Cells[2].Controls[1] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
            }
        }
    }
}