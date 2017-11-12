using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MUAWA.Business;
using MUAWA.Common.Constants;
using MUAWA.Common.BusinessObjects;


public partial class SearchResults : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString.Get("SK") != null)
        {
            string searchKey = Request.QueryString.Get("SK");

            if (searchKey.Length > 3)
            {
                NewsAndEventManager newsAndEventsManager = new NewsAndEventManager();
                List<NewsAndEventsItem> news = newsAndEventsManager.SearchNewsHeadlines(searchKey);
                List<NewsAndEventsItem> events = newsAndEventsManager.SearchEventsHeadlines(searchKey);
                List<NewsLetter> letters = newsAndEventsManager.SearchNewsLetters(searchKey);                

                AlbumManager albumManager = new AlbumManager();
                List<Album> albums = albumManager.SearchAlbums(searchKey);                

                if (news.Count == 0 && events.Count == 0 && letters.Count == 0 && albums.Count == 0)
                {
                    Session["error"] = "No Match Found";
                }
                else
                {
                    Session["news"] = news;
                    Session["events"] = events;
                    Session["newsLetters"] = letters;
                    Session["albums"] = albums;
                    Session["error"] = null;
                }
            }
            else
            {
                Session["error"] = "You must include at least one positive keyword with 3 characters or more.";
            }            
        }
        else
        {
            Response.Redirect(Request.ApplicationPath + "/Default.aspx");
        }  
    }
}