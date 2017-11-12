using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MUAWA.Business;
using MUAWA.Common.Constants;
using MUAWA.Common.BusinessObjects;
using Newtonsoft.Json;
using System.Web.Services;

public partial class Gallery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        AlbumManager albumManager = new AlbumManager();
        Session["albums"] = albumManager.GetAlbums(Constants.defaultAlbumsPageSize, Constants.defaultAlbumsPageIndex);
        Session["albumCount"] = albumManager.GetAlbumCount().ToString();
    }

    [WebMethod]
    public static string getAlbums(string pageIndex)
    {
        int pageId = int.Parse(pageIndex);
        AlbumManager albumManager = new AlbumManager();
        List<Album> albums = albumManager.GetAlbums(Constants.defaultAlbumsPageSize, pageId);
        return JsonConvert.SerializeObject(albums);
    }
}