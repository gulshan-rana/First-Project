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
    public partial class AdminDataShow : System.Web.UI.Page
    {
        String ConString = ConfigurationManager.ConnectionStrings["DataBase"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
             if (!Page.IsPostBack)
            {
                RefreshData();
                Cuntry();
                RollName();
            }
        }
        public void RefreshData()
        {
            SqlConnection objSqlConnection = new SqlConnection(ConString);
            SqlCommand objSqlCommand = new SqlCommand("DDLogIn", objSqlConnection);
            objSqlCommand.CommandType = CommandType.Text;
            SqlDataAdapter SDA = new SqlDataAdapter(objSqlCommand);
            DataTable DT = new DataTable();
            SDA.Fill(DT);
            GridView1.DataSource = DT;
            GridView1.DataBind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            SqlConnection objSqlConnection = new SqlConnection(ConString);
            GridViewRow rows = GridView1.Rows[e.RowIndex];
            String id = rows.Cells[0].Text;
            SqlCommand objSqlCommand = new SqlCommand("DeleteLoginP", objSqlConnection);
            objSqlCommand.CommandType = CommandType.StoredProcedure;
            objSqlCommand.Parameters.AddWithValue("@id", id);
            objSqlConnection.Open();
            objSqlCommand.ExecuteNonQuery();
            objSqlConnection.Close();
            RefreshData();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string filename = string.Empty;
            if (FileUploadid.HasFile)
            {
                filename = Path.GetFileName(FileUploadid.PostedFile.FileName);
                FileUploadid.PostedFile.SaveAs(Server.MapPath("~/Images/") + filename);
            }
            SqlConnection objSqlConnection = new SqlConnection(ConString);
            SqlCommand objSqlCommand = new SqlCommand("UpdateData", objSqlConnection);
            objSqlCommand.CommandType = CommandType.StoredProcedure;
            objSqlConnection.Open();
            objSqlCommand.Parameters.AddWithValue("@id", Session["UpdateID"]);
            objSqlCommand.Parameters.AddWithValue("@FirstName", textboxFirstname.Text);
            objSqlCommand.Parameters.AddWithValue("@LastName", textboxLastName.Text);
            objSqlCommand.Parameters.AddWithValue("@EmailAddress", textboxEmailAddress.Text);
            objSqlCommand.Parameters.AddWithValue("@Password", textboxPassword.Text);
            objSqlCommand.Parameters.AddWithValue("@Address", textboxAddress.Text);
            objSqlCommand.Parameters.AddWithValue("@PhoneNumber", textboxPhoneNumber.Text);
            objSqlCommand.Parameters.AddWithValue("@RollID", DDRollName.SelectedItem.Value);
            objSqlCommand.Parameters.AddWithValue("@CountryID", DDCountryName.SelectedItem.Value);
            objSqlCommand.Parameters.AddWithValue("@StateID", DDStatename.SelectedItem.Value);
            objSqlCommand.Parameters.AddWithValue("@CityID", DDCityName.SelectedItem.Value);
            objSqlCommand.Parameters.AddWithValue("@Photo", filename);
            objSqlCommand.ExecuteNonQuery();
            RefreshData();
            objSqlConnection.Close();
            textboxFirstname.Text = "";
            textboxLastName.Text = "";
            textboxEmailAddress.Text = "";
            textboxPassword.Text = "";
            textboxAddress.Text = "";
            textboxPhoneNumber.Text = "";
            DDCountryName.Items.Clear();
            DDCountryName.Items.Insert(0, new ListItem("--Select State--", "o"));
            DDStatename.Items.Clear();
            DDStatename.Items.Insert(0, new ListItem("--Select State--", "0"));
            DDCityName.Items.Clear();
            DDCityName.Items.Insert(0, new ListItem("--Select City--", "0"));
           
        }
       
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            
            {
                int id = Convert.ToInt32(e.CommandArgument);
                Session["UpdateID"] = id;
                GridViewRow row = GridView1.SelectedRow;
                SqlConnection objSqlConnection = new SqlConnection(ConString);
                SqlCommand objSqlCommand = new SqlCommand("select * From LoginP where id='" + id + "'",objSqlConnection);
                objSqlConnection.Open();
                SqlDataReader SDR = objSqlCommand.ExecuteReader();
                
                while(SDR.Read())
                {
                    textboxFirstname.Text = SDR["FirstName"].ToString();
                    textboxLastName.Text = SDR["LastName"].ToString();
                    textboxEmailAddress.Text = SDR["EmailAddress"].ToString();
                    textboxPassword.Text = SDR["Password"].ToString();
                    textboxAddress.Text = SDR["Address"].ToString();
                    textboxPhoneNumber.Text = SDR["PhoneNumber"].ToString();
                    DDRollName.SelectedValue = SDR["RollID"].ToString();
                    DDCountryName.SelectedValue = SDR["CountryID"].ToString();
                    DDStatename.SelectedValue = SDR["StateID"].ToString();
                    DDCityName.SelectedValue = SDR["CityID"].ToString();

                    String Photo = "~/Images/" + SDR["Photo"].ToString(); 
                    ImageGrid.ImageUrl = Photo;
                }
                    objSqlConnection.Close();

            }
        }

        public void Cuntry()
        {
            SqlConnection objSqlConnection = new SqlConnection(ConString);
            SqlCommand objSqlCommand = new SqlCommand("Select * From Countrytable ", objSqlConnection);
            SqlDataAdapter SDA = new SqlDataAdapter(objSqlCommand);
            DataTable DT = new DataTable();
            SDA.Fill(DT);
            DDCountryName.DataSource = DT;
            DDCountryName.DataBind();
            var cou = DT.Rows[0]["CountryID"].ToString();
            DDCountryName.DataValueField="CountryID";
            State(cou);
        }

        public void State(string cou)
        {

            SqlConnection objSqlConnection = new SqlConnection(ConString);
            SqlCommand objSqlCommand = new SqlCommand("Select * From StatesName where CountryID='"+cou+"'", objSqlConnection);
            SqlDataAdapter SDA = new SqlDataAdapter(objSqlCommand);
            DataTable DT = new DataTable();
            SDA.Fill(DT);
            DDStatename.DataSource = DT;
            var State = DT.Rows[0]["StateID"].ToString();
            DDStatename.DataBind();
            City(State);
        }


        public void City(String State)
        {
            SqlConnection objSqlConnection = new SqlConnection(ConString);
            SqlCommand objSqlCommand = new SqlCommand("Select * From CityName where StateID='"+State+"'", objSqlConnection);
            SqlDataAdapter SDA = new SqlDataAdapter(objSqlCommand);
            DataTable DT = new DataTable();
            SDA.Fill(DT);
            DDCityName.DataSource = DT;
            DDCityName.DataBind();
        }

        protected void DDCountryName_SelectedIndexChanged(object sender, EventArgs e)
        {
            DDStatename.Items.Clear();
            DDStatename.Items.Insert(0, new ListItem("--Select State--", "0"));
            SqlConnection objSqlConnection = new SqlConnection(ConString);
            SqlCommand objSqlCommand = new SqlCommand("Select * from StatesName where CountryID ='" + DDCountryName.SelectedItem.Value + "'", objSqlConnection);
            SqlDataAdapter SDA = new SqlDataAdapter(objSqlCommand);
            DataTable DT = new DataTable();
            SDA.Fill(DT);
            DDStatename.DataSource = DT;
            DDStatename.DataBind();
        }

        protected void DDStatename_SelectedIndexChanged(object sender, EventArgs e)
        {
            DDCityName.Items.Clear();
            DDCityName.Items.Insert(0, new ListItem("--Select City--"));
            SqlConnection objSqlConnection = new SqlConnection(ConString);
            SqlCommand objSqlCommand = new SqlCommand("Select * From CityName where StateID='" + DDStatename.SelectedItem.Value + "'", objSqlConnection);
            SqlDataAdapter SDA = new SqlDataAdapter(objSqlCommand);
            DataTable DT = new DataTable();
            SDA.Fill(DT);
            DDCityName.DataSource = DT;
            DDCityName.DataBind();
        }

       public void RollName()
       {
            SqlConnection objSqlConnection = new SqlConnection(ConString);
            SqlCommand objSqlCommand = new SqlCommand("Select * From RollTable ", objSqlConnection);
            SqlDataAdapter SDA = new SqlDataAdapter(objSqlCommand);
            DataTable DT = new DataTable();
            SDA.Fill(DT);
            DDRollName.DataSource = DT;
            DDRollName.DataBind();
       }
    }
}