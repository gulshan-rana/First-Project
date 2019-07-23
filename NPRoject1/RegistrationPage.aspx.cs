using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;

namespace NPRoject1
{
    public partial class RegistrationPage : System.Web.UI.Page
    {
        string constring = ConfigurationManager.ConnectionStrings["DataBase"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
           if(!Page.IsPostBack)
            {
                
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

           
             
            SqlConnection objSqlConnection = new SqlConnection(constring);
            SqlCommand objSqlCommand = new SqlCommand("Insert into LoginP Values(@Firstname,@Lastname,@EmailAddress,@Password,@Address,@PhoneNumber,@RollID,@CountryID,@StateID,@CityID,@Photo)", objSqlConnection);
            objSqlConnection.Open();
            objSqlCommand.Parameters.AddWithValue("@Firstname",textboxFirstName.Text);
            objSqlCommand.Parameters.AddWithValue("@Lastname",textboxLastName.Text);
            objSqlCommand.Parameters.AddWithValue("@EmailAddress",textboxEmailAddress.Text);
            objSqlCommand.Parameters.AddWithValue("@Password",textboxPassword.Text);
            objSqlCommand.Parameters.AddWithValue("@Address", string.Empty);
            objSqlCommand.Parameters.AddWithValue("@PhoneNumber", string.Empty);
            objSqlCommand.Parameters.AddWithValue("@RollID", "2");
            objSqlCommand.Parameters.AddWithValue("@CountryID", string.Empty);
            objSqlCommand.Parameters.AddWithValue("@StateID", string.Empty);
            objSqlCommand.Parameters.AddWithValue("@CityID", string.Empty);
            objSqlCommand.Parameters.AddWithValue("@Photo", string.Empty);



            SqlDataReader objSqlDataReader = objSqlCommand.ExecuteReader();
            objSqlConnection.Close();
            textboxFirstName.Text = "";
            textboxLastName.Text = "";
            textboxEmailAddress.Text = "";
            textboxPassword.Text = "";
            textboxConPassword.Text = "";

            string message = "Data Save Sucessfully .";
            string script = "window.onload = function(){ alert('";
            script += message;
            script += "')};";
            ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);

        }
       

        
    }
}