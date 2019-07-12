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
                countryList();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

            String fileName = string.Empty;
            if(FileUploadDP.HasFile)
            {
                fileName = Path.GetFileName(FileUploadDP.PostedFile.FileName);
                FileUploadDP.PostedFile.SaveAs(Server.MapPath("~/Images/") + fileName);
            }
             
            SqlConnection objSqlConnection = new SqlConnection(constring);
            SqlCommand objSqlCommand = new SqlCommand("Insert into LoginP Values(@Firstname,@Lastname,@EmailAddress,@Password,@Address,@PhoneNumber,@RollID,@CountryID,@StateID,@CityID,@Photo)", objSqlConnection);
            objSqlConnection.Open();
            objSqlCommand.Parameters.AddWithValue("@Firstname",textboxFirstName.Text);
            objSqlCommand.Parameters.AddWithValue("@Lastname",textboxLastName.Text);
            objSqlCommand.Parameters.AddWithValue("@EmailAddress",textboxEmailAddress.Text);
            objSqlCommand.Parameters.AddWithValue("@Password",textboxPassword.Text);
            objSqlCommand.Parameters.AddWithValue("@Address",textboxAddress.Text);
            objSqlCommand.Parameters.AddWithValue("@PhoneNumber",textboxPhoneNumber.Text);
            objSqlCommand.Parameters.AddWithValue("@RollID","2");
            objSqlCommand.Parameters.AddWithValue("@CountryID",DDCountry.SelectedValue);
            objSqlCommand.Parameters.AddWithValue("@StateID",DDState.SelectedValue);
            objSqlCommand.Parameters.AddWithValue("@CityID",DDcity.SelectedValue);
            objSqlCommand.Parameters.AddWithValue("@Photo",fileName);


            SqlDataReader objSqlDataReader = objSqlCommand.ExecuteReader();
            objSqlConnection.Close();
            textboxFirstName.Text = "";
            textboxLastName.Text = "";
            textboxEmailAddress.Text = "";
            textboxPassword.Text = "";
            textboxAddress.Text = "";
            textboxPhoneNumber.Text = "";
            DDCountry.Items.Clear();
            DDCountry.Items.Insert(0, new ListItem("--Select State--", "o")); 
            DDState.Items.Clear();
            DDState.Items.Insert(0, new ListItem("--Select State--", "0"));
            DDcity.Items.Clear();
            DDcity.Items.Insert(0, new ListItem("--Select City--", "0"));
        }
        public void countryList()
        {
            SqlConnection con = new SqlConnection(constring);
            SqlCommand objSqlCommand = new SqlCommand("Select * from Countrytable",con);
            SqlDataAdapter SDA = new SqlDataAdapter(objSqlCommand);
            DataTable DT = new DataTable();
            SDA.Fill(DT);
            DDCountry.DataSource = DT;
            DDCountry.DataBind();
        }

        protected void DDCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            DDState.Items.Clear();
            DDcity.Items.Clear();
            DDState.Items.Insert(0, new ListItem("--Select State--", "0"));
            DDcity.Items.Insert(0, new ListItem("--Select City--"));
            SqlConnection objSqlConnection = new SqlConnection(constring);
            SqlCommand objSqlCommand = new SqlCommand("Select * From StatesName where CountryID=" + DDCountry.SelectedItem.Value, objSqlConnection);
            SqlDataAdapter SDA = new SqlDataAdapter(objSqlCommand);
            DataTable DT = new DataTable();
            SDA.Fill(DT);
            DDState.DataSource = DT;
            DDState.DataBind();
        }

        protected void DDState_SelectedIndexChanged(object sender, EventArgs e)
        {
            DDcity.Items.Clear();
            DDcity.Items.Insert(0, new ListItem("--Select City--"));
            SqlConnection objSqlConnection = new SqlConnection(constring);
            SqlCommand objSqlCommand = new SqlCommand("Select * from CityName where StateID=" + DDState.SelectedItem.Value, objSqlConnection);
            SqlDataAdapter SDA = new SqlDataAdapter(objSqlCommand);
            DataTable DT = new DataTable();
            SDA.Fill(DT);
            DDcity.DataSource = DT;
            DDcity.DataBind();
        }

        
    }
}