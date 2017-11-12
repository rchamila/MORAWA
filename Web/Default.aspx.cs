using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MUAWA.Business;
using MUAWA.Common.Constants;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        NewsAndEventManager newsAndEventsManager = new NewsAndEventManager();
        Session["news"] = newsAndEventsManager.GetNewsHeadline(Constants.defaultHomeNewsPageSize, Constants.defaultNewsPageIndex);

        AlbumManager albumManager = new AlbumManager();
        Session["albums"] = albumManager.GetAlbums(Constants.defaultHomeAlbumsPageSize, Constants.defaultAlbumsPageIndex);
        Session["albumCount"] = albumManager.GetAlbumCount().ToString();
    }
}