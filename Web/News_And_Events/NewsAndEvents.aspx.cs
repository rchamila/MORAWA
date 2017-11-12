using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using MUAWA.Business;
using MUAWA.Common.Constants;
using MUAWA.Common.BusinessObjects;
using Newtonsoft.Json;


public partial class NewsAndEvents : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        NewsAndEventManager newsAndEventsManager = new NewsAndEventManager();
        Session["news"] = newsAndEventsManager.GetNewsHeadline(Constants.defaultNewsPageSize, Constants.defaultNewsPageIndex);
        Session["newsCount"] = newsAndEventsManager.GetNewsCount().ToString();
        Session["events"] = newsAndEventsManager.GetEventsHeadlines(Constants.defaultEventsPageSize, Constants.defaultEventsPageIndex);
        Session["newsLetters"] = newsAndEventsManager.GetNewsLetters(Constants.defaultNewsLettersPageSize, Constants.defaultNewsLettersPageIndex);
    }

    [WebMethod]
    public static string getNews(string pageIndex)
    {
        int pageId = int.Parse(pageIndex);
        NewsAndEventManager newsAndEventsManager = new NewsAndEventManager();
        List<NewsAndEventsItem> newsHeadlines = newsAndEventsManager.GetNewsHeadline(Constants.defaultNewsPageSize, pageId);
        return JsonConvert.SerializeObject(newsHeadlines);
    }
}