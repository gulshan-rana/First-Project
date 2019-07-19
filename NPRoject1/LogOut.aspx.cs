﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NPRoject1
{
    public partial class LogOut : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                Logout1();
            }
        }
        public void Logout1()
        {

            Session["id"] = null;
            Session.Clear();
            //Session.RemoveAll();
            Session.Abandon();
            Session.Contents.RemoveAll();
            Response.Redirect("LogInPage.aspx");
        }
    }
}