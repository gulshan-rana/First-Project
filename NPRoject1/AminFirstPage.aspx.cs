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
    public partial class AminFirstPage : System.Web.UI.Page
    {
        String ConString = ConfigurationManager.ConnectionStrings["DataBase"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                RefreshData();
            }
        }

        public void RefreshData()
        {
            SqlConnection objSqlConnection = new SqlConnection(ConString);
            SqlCommand objSqlCommand = new SqlCommand("Select FirstName From LoginP Where id='" + Session["id"] + "'", objSqlConnection);
            SqlDataAdapter SDA = new SqlDataAdapter(objSqlCommand);
            DataSet ds = new DataSet();
            SDA.Fill(ds);

            lblAdmin.Text = ds.Tables[0].Rows[0]["FirstName"].ToString();

        }

        protected void btnUserList_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDataShow.aspx");
        }

        protected void AdminProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserPage.aspx");
        }

        protected void btnUserList_Click1(object sender, EventArgs e)
        {
            Response.Redirect("AdminAttendenceshow.aspx");
        }
    }
}