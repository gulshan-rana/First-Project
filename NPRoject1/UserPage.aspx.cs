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
            //SqlDataReader objSqlDataReader = objSqlCommand.ExecuteReader();

            textboxFirstName.Text = ds.Tables[0].Rows[0]["FirstName"].ToString();
            textboxLastName.Text = ds.Tables[0].Rows[0]["LastName"].ToString();
            textboxEmailAddress.Text = ds.Tables[0].Rows[0]["EmailAddress"].ToString();
            textboxPassword.Text = ds.Tables[0].Rows[0]["Password"].ToString();
            textboxAddress.Text = ds.Tables[0].Rows[0]["Address"].ToString();
            textboxPhoneNumber.Text = ds.Tables[0].Rows[0]["PhoneNumber"].ToString();
            DDCountryName.SelectedValue = ds.Tables[0].Rows[0]["CountryID"].ToString();
            String Photo = "~/Images/" + ds.Tables[0].Rows[0]["Photo"].ToString();
            imageID.ImageUrl = Photo;
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
            DDCountryName.DataBind();
            var cou = DT.Rows[0]["CountryID"].ToString();
            DDCountryName.DataValueField = "CountryID";
            State(cou);
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

    }
}
