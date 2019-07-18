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
    public partial class UserPage : System.Web.UI.Page
    {
        String ConString = ConfigurationManager.ConnectionStrings["DataBase"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                RefreshData();
                Country();



            }
        }

        public void RefreshData()
        {
            SqlConnection objSqlConnection = new SqlConnection(ConString);
            SqlCommand objSqlCommand = new SqlCommand("UserProcedure1", objSqlConnection);
            objSqlCommand.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter SDA = new SqlDataAdapter(objSqlCommand);
            objSqlConnection.Open();
            objSqlCommand.Parameters.AddWithValue("@id", Session["id"]);
            DataSet ds = new DataSet();
            SDA.Fill(ds);
            textboxFirstName.Text = ds.Tables[0].Rows[0]["FirstName"].ToString();
            textboxLastName.Text = ds.Tables[0].Rows[0]["LastName"].ToString();
            textboxEmailAddress.Text = ds.Tables[0].Rows[0]["EmailAddress"].ToString();
            textboxPassword.Text = ds.Tables[0].Rows[0]["Password"].ToString();
            textboxAddress.Text = ds.Tables[0].Rows[0]["Address"].ToString();
            textboxPhoneNumber.Text = ds.Tables[0].Rows[0]["PhoneNumber"].ToString();
            String Photo = "~/Images/" + ds.Tables[0].Rows[0]["Photo"].ToString();
            //imageID.ImageUrl = Photo;
            objSqlConnection.Close();
        }

        public void Country()
        {
                SqlConnection con = new SqlConnection(ConString);
                SqlCommand objSqlCommand = new SqlCommand("Select * from Countrytable", con);
                SqlDataAdapter SDA = new SqlDataAdapter(objSqlCommand);
                DataTable DT = new DataTable();
                SDA.Fill(DT);
                DDCountryName.DataSource = DT;
                DDCountryName.DataBind();
                DDCountryName.Items.Insert(0, new ListItem("--Select Country--", "0"));

            
        }
        

        protected void DDCountryName_SelectedIndexChanged(object sender, EventArgs e)
        {
            DDStateName.Items.Clear();
            DDCityName.Items.Clear();
            DDStateName.Items.Insert(0, new ListItem("--Select State--", "0"));
            DDCityName.Items.Insert(0, new ListItem("--Select City--"));
            SqlConnection objSqlConnection = new SqlConnection(ConString);
            SqlCommand objSqlCommand = new SqlCommand("Select * From StatesName where CountryID=" + DDCountryName.SelectedItem.Value, objSqlConnection);
            SqlDataAdapter SDA = new SqlDataAdapter(objSqlCommand);
            DataTable DT = new DataTable();
            SDA.Fill(DT);
            DDStateName.DataSource = DT;
            DDStateName.DataBind();
        }

        protected void DDStateName_SelectedIndexChanged(object sender, EventArgs e)
        {
            DDCityName.Items.Clear();
            DDCityName.Items.Insert(0, new ListItem("--Select City--"));
            SqlConnection objSqlConnection = new SqlConnection(ConString);
            SqlCommand objSqlCommand = new SqlCommand("Select * from CityName where StateID=" + DDStateName.SelectedItem.Value, objSqlConnection);
            SqlDataAdapter SDA = new SqlDataAdapter(objSqlCommand);
            DataTable DT = new DataTable();
            SDA.Fill(DT);
            DDCityName.DataSource = DT;
            DDCityName.DataBind();
        }

        protected void BntUpdate_Click(object sender, EventArgs e)
        {
            String fileName = string.Empty;
            if(FileUploadID.HasFile)
            {
                fileName = Path.GetFileName(FileUploadID.PostedFile.FileName);
                FileUploadID.PostedFile.SaveAs(Server.MapPath("~/Images/") + fileName);
            }

            SqlConnection objSqlConnection = new SqlConnection(ConString);
            SqlCommand objSqlCommand = new SqlCommand("UpdateUserDetails", objSqlConnection);
            objSqlCommand.CommandType = CommandType.StoredProcedure;
            objSqlCommand.Parameters.AddWithValue("@FirstName", textboxFirstName.Text);
            objSqlCommand.Parameters.AddWithValue("@LastName",  textboxLastName.Text);
            objSqlCommand.Parameters.AddWithValue("@EmailAddress", textboxEmailAddress.Text);
            objSqlCommand.Parameters.AddWithValue("@Password", textboxPassword.Text);
            objSqlCommand.Parameters.AddWithValue("@Address", textboxAddress.Text);
            objSqlCommand.Parameters.AddWithValue("@PhoneNumber", textboxPhoneNumber.Text);
            objSqlCommand.Parameters.AddWithValue("@CountryID", DDCityName.SelectedItem.Value);
            objSqlCommand.Parameters.AddWithValue("@StateID", DDStateName.SelectedItem.Value);
            objSqlCommand.Parameters.AddWithValue("@CityID", DDCityName.SelectedItem.Value);
            objSqlCommand.Parameters.AddWithValue("@Photo",fileName);
        }
    }
}
