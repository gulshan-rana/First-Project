using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace NPRoject1
{
    public partial class Admindatashownew : System.Web.UI.Page
    {
        string conString = ConfigurationManager.ConnectionStrings["DataBase"].ConnectionString;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                RefreshData();
            }
        }

        public void RefreshData()
        {
            SqlConnection objSqlConnection = new SqlConnection(conString);
            SqlCommand objSqlCommand = new SqlCommand("AdminAttendenceShow ", objSqlConnection);
            objSqlCommand.CommandType = CommandType.StoredProcedure;
            objSqlCommand.Parameters.AddWithValue("@id", Session["USERIID"]);
            SqlDataAdapter objSqlDataAdapter = new SqlDataAdapter(objSqlCommand);
            DataTable objDataTable = new DataTable();
            objSqlDataAdapter.Fill(objDataTable);
            GridviewID.DataSource = objDataTable;
            GridviewID.DataBind();
        }

        
        
    }
}