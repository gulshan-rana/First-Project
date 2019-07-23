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
                Country();
                RefreshData();




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
            string countValueField = ds.Tables[0].Rows[0]["CountryID"].ToString();
            string stateValueField = ds.Tables[0].Rows[0]["StateID"].ToString();
            string cityValueField = ds.Tables[0].Rows[0]["CityID"].ToString();
            //userAddressInput           
            if (ds.Tables[0].Rows[0]["Address"].ToString() != "")
            {
                textboxAddress.Text = ds.Tables[0].Rows[0]["Address"].ToString();
            }
            //userPhone
            if (ds.Tables[0].Rows[0]["PhoneNumber"].ToString() != "")
            {
                textboxPhoneNumber.Text = ds.Tables[0].Rows[0]["PhoneNumber"].ToString();
            }
            /*
            * Country selection
            */

            if (Convert.ToInt32(countValueField) > 0)
            {
                DDCountryName.SelectedValue = countValueField;
            }
            else
            {
                DDCountryName.Items.Insert(0, new ListItem("select country", "0"));
                DDCountryName.SelectedValue = "0";
            }
            /*
             * State selection
             */
            this.State(countValueField);
            if (Convert.ToInt32(stateValueField) > 0)
            {
                DDStateName.SelectedValue = stateValueField;
            }
            else
            {
                DDStateName.Items.Insert(0, new ListItem("select country", "0"));
                DDStateName.SelectedValue = "0";
            }
            /*
             * City selection
             */
            this.City(stateValueField);
            if (Convert.ToInt32(cityValueField) > 0)
            {
                DDCityName.SelectedValue = cityValueField;
            }
            else
            {
                DDCityName.Items.Insert(0, new ListItem("select country", "0"));
                DDCityName.SelectedValue = "0";
            }
            if (ds.Tables[0].Rows[0]["Photo"].ToString() != "")
            {
                String Photo = "~/Images/" + ds.Tables[0].Rows[0]["Photo"].ToString();
                imageID.ImageUrl = Photo;
            }

            objSqlConnection.Close();
        }




        protected void BntUpdate_Click(object sender, EventArgs e)
        {
            String fileName = string.Empty;
            if (FileUploadID.HasFile)
            {
                fileName = Path.GetFileName(FileUploadID.PostedFile.FileName);
                FileUploadID.PostedFile.SaveAs(Server.MapPath("~/Images/") + fileName);
            }

            SqlConnection objSqlConnection = new SqlConnection(ConString);
            SqlCommand objSqlCommand = new SqlCommand("UpdateUserDetails", objSqlConnection);
            objSqlCommand.CommandType = CommandType.StoredProcedure;
            objSqlCommand.Parameters.AddWithValue("@id", Session["id"]);
            objSqlCommand.Parameters.AddWithValue("@FirstName", textboxFirstName.Text);
            objSqlCommand.Parameters.AddWithValue("@LastName", textboxLastName.Text);
            objSqlCommand.Parameters.AddWithValue("@EmailAddress", textboxEmailAddress.Text);
            objSqlCommand.Parameters.AddWithValue("@Password", textboxPassword.Text);
            objSqlCommand.Parameters.AddWithValue("@Address", textboxAddress.Text);
            objSqlCommand.Parameters.AddWithValue("@PhoneNumber", textboxPhoneNumber.Text);
            objSqlCommand.Parameters.AddWithValue("@CountryID", DDCountryName.SelectedItem.Value);
            objSqlCommand.Parameters.AddWithValue("@StateID", DDStateName.SelectedItem.Value);
            objSqlCommand.Parameters.AddWithValue("@CityID", DDCityName.SelectedItem.Value);
            objSqlCommand.Parameters.AddWithValue("@RollID", "2");
            objSqlCommand.Parameters.AddWithValue("@Photo", fileName);

            objSqlConnection.Open();
            objSqlCommand.ExecuteNonQuery();
            objSqlConnection.Close();
        }

        public void Country()
        {
            SqlConnection objSqlConnection = new SqlConnection(ConString);
            SqlCommand objSqlCommand = new SqlCommand("Select * From Countrytable ", objSqlConnection);
            SqlDataAdapter SDA = new SqlDataAdapter(objSqlCommand);
            DataTable DT = new DataTable();
            SDA.Fill(DT);
            DDCountryName.DataSource = DT;
            DDCountryName.DataValueField = DT.Columns["CountryID"].ToString();
            DDCountryName.DataTextField = DT.Columns["CountryName"].ToString();
            DDCountryName.Items.Insert(0, new ListItem("select country", "0"));
            DDCountryName.DataBind();
            //State(cou);

        }

        public void State(string cou)
        {

            SqlConnection objSqlConnection = new SqlConnection(ConString);
            SqlCommand objSqlCommand = new SqlCommand("Select * From StatesName where CountryID='" + cou + "'", objSqlConnection);
            SqlDataAdapter SDA = new SqlDataAdapter(objSqlCommand);
            DataTable DT = new DataTable();
            SDA.Fill(DT);
            DDStateName.DataSource = DT;
            var State = DT.Rows[0]["StateID"].ToString();
            DDStateName.DataBind();
            City(State);
        }

        public void City(String State)
        {
            SqlConnection objSqlConnection = new SqlConnection(ConString);
            SqlCommand objSqlCommand = new SqlCommand("Select * From CityName where StateID='" + State + "'", objSqlConnection);
            SqlDataAdapter SDA = new SqlDataAdapter(objSqlCommand);
            DataTable DT = new DataTable();
            SDA.Fill(DT);
            DDCityName.DataSource = DT;
            DDCityName.DataBind();
        }

        protected void DDCountryName_SelectedIndexChanged(object sender, EventArgs e)
        {
            DDStateName.Items.Clear();
            DDStateName.Items.Insert(0, new ListItem("--Select State--", "0"));
            DDCityName.Items.Clear();
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




    }
}
