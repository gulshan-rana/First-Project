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
    public partial class UChangepass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnChangePass_Click(object sender, EventArgs e)
        {
            string conString = ConfigurationManager.ConnectionStrings["DataBase"].ConnectionString;
            SqlConnection objSqlConnection = new SqlConnection(conString);
            SqlCommand objSqlCommand = new SqlCommand("Select * from LoginP Where id='" + Session["id"] + "'", objSqlConnection);
            objSqlConnection.Open();
            SqlDataAdapter SDA = new SqlDataAdapter(objSqlCommand);
            DataTable DT = new DataTable();
            SDA.Fill(DT);
            
            var id = Session["id"];
            var Password = DT.Rows[0]["Password"];
            var newPassword = textboxNewPass.Text;
           
            if ( textboxOldPass.Text == Password.ToString())
            {
                SqlConnection obSqlConnection = new SqlConnection(conString);
                SqlCommand cmd = new SqlCommand ("UpdatePass", objSqlConnection);
                cmd.CommandType = CommandType.StoredProcedure;
                obSqlConnection.Open();
                cmd.Parameters.AddWithValue("@id", Convert.ToInt32(id));
                cmd.Parameters.AddWithValue("@Password", newPassword);
                
                cmd.ExecuteNonQuery();
                obSqlConnection.Close();
                lbMsg.Text = "Password Changed Sucessfully";
                lbMsg.ForeColor = System.Drawing.Color.Green;
                objSqlConnection.Close();
            }
            else
            {
                //sda = new SqlDataAdapter("update CrudOperation set Password='" + TNPassword.Text + "' where EmailAddress='" + Session["uname"].ToString() + "'", con);
                //sda.Fill(dt);
                //lbMsg.Text = "Password Changed Sucessfully";
                //lbMsg.ForeColor = System.Drawing.Color.Green;
            }
            //objSqlConnection.Close();
        }
    }
}