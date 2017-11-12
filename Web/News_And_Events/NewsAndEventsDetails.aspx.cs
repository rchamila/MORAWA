using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MUAWA.Business;
using MUAWA.Common.Constants;
using MUAWA.Common.BusinessObjects;

public partial class News_And_Events_NewsAndEventsDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString.Get("NI") != null)
        {
            int id = int.Parse(Request.QueryString.Get("NI"));
            NewsAndEventManager newsAndEventsManager = new NewsAndEventManager();
            Session["newsDetails"] = newsAndEventsManager.GetNewsOrEventDetails(id);
        }
        else
        {
            Response.Redirect(Request.ApplicationPath + "/News_And_Events/NewsAndEvents.aspx");
        }   
     
    }
}