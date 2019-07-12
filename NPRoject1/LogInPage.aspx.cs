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
    public partial class LogInPage : System.Web.UI.Page
    {
        string constring = ConfigurationManager.ConnectionStrings["DataBase"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string Email = textboxEmailAddress.Text;
            string Password = textboxPassword.Text;
            SqlConnection objSqlConnection = new SqlConnection(constring);
            SqlCommand objSqlCommand = new SqlCommand("Select * From LoginP Where Emailaddress='" + Email + "' And Password='" + Password + "'", objSqlConnection);
            SqlDataAdapter SDA = new SqlDataAdapter(objSqlCommand);
            DataTable DT = new DataTable();
            SDA.Fill(DT);
         
            textboxEmailAddress.Text = "";
            textboxPassword.Text = "";
            if (DT.Rows.Count > 0)
            {
            
                Session["id"] = DT.Rows[0]["id"].ToString();
                
                lblMessage.Text = "Login Sucessfull";
                
                if(DT.Rows[0]["RollID"].ToString()=="1")
                {
                    Response.Redirect("AminFirstPage.aspx");
                }
                else
                {
                    Response.Redirect("LogInFirst.aspx");
                }
            }
            else
            {
                lblMessage.Text = "Login Failed";
            }

        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegistrationPage.aspx");
        }
    }
}