using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NPRoject1
{
    public partial class Amin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                SessionNull();
            }
           
        }
        public void SessionNull()
        {

            var SessionStrng = Convert.ToString(Session);
            if (SessionStrng == "" )
            {
                Response.Redirect("LogInPage.aspx");
            }
        }
    }
}