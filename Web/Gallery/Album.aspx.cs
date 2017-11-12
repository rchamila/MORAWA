using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MUAWA.Business;
using MUAWA.Common.Constants;
using MUAWA.Common.BusinessObjects;

public partial class Gallery_Album : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString.Get("AI") != null)
        {
            int id = int.Parse(Request.QueryString.Get("AI"));
            AlbumManager newsAndEventsManager = new AlbumManager();
            Session["album"] = newsAndEventsManager.GetAlbum(id);
        }
        else
        {
            Response.Redirect(Request.ApplicationPath + "/Gallery/Gallery.aspx");
        }   
     
    }
}