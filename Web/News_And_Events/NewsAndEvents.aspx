<%@ Page Title="" Language="C#" MasterPageFile="~/AlumniWeb.master" AutoEventWireup="true"
    CodeFile="NewsAndEvents.aspx.cs" Inherits="NewsAndEvents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>News & Events</title>
    <script src="<%=Request.ApplicationPath %>/Scripts/jquery.paginate.js" type="text/javascript"></script>
    <script src="<%=Request.ApplicationPath %>/Scripts/NewsAndEvents.js" type="text/javascript"></script>
    <link href="<%=Request.ApplicationPath %>/App_Themes/Default/pagination.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageBody" runat="Server">
    <div id="container">
        <div class="wrapper">
            <div class="col_2_b_c_1">
                <!--col_2_b_c_1 Start-->
                <div class="b_wrapper">
                    <h1 class="title u_l_title">
                        News</h1>
                    <ul class="headlines" id="newsHeadlines">
                        <%if (Session["news"] != null)
                          {
                              List<MUAWA.Common.BusinessObjects.NewsAndEventsItem> newsList = (List<MUAWA.Common.BusinessObjects.NewsAndEventsItem>)Session["news"];

                              foreach (MUAWA.Common.BusinessObjects.NewsAndEventsItem news in newsList)
                              {
                                  string newsTitle = news.Title;
                                  string newsId = news.NewsId.ToString();
                        %>
                        <li><a href="<%=Request.ApplicationPath %>/News_And_Events/NewsAndEventsDetails.aspx?NI=<%= newsId%>">
                            <%= newsTitle%></a></li>
                        <%
                            }
                          }
                        %>
                    </ul>
                    <div id="newsPagination">
                    </div>
                </div>
            </div>
            <!--col_2_b_c_1 End-->
            <div class="col_2_b_c_2">
                <div class="b_wrapper">
                    <h3 class="title u_l_title">
                        Event Schedule</h3>
                    <ul class="headlines" id="eventHeadlines">
                        <%if (Session["events"] != null)
                          {
                              List<MUAWA.Common.BusinessObjects.NewsAndEventsItem> eventsList = (List<MUAWA.Common.BusinessObjects.NewsAndEventsItem>)Session["news"];

                              foreach (MUAWA.Common.BusinessObjects.NewsAndEventsItem events in eventsList)
                              {
                                  string eventTitle = events.Title;
                                  string eventId = events.NewsId.ToString();
                        %>
                        <li><a href="<%=Request.ApplicationPath %>/News_And_Events/NewsAndEventsDetails.aspx?NI=<%= eventId%>">
                            <%= eventTitle%></a></li>
                        <%
                            }
                          }
                        %>
                    </ul>
                </div>
                <div class="b_wrapper">
                    <h3 class="title u_l_title">
                        News Letters</h3>
                    <ul class="headlines" id="newsLetters">
                       <%if (Session["newsLetters"] != null)
                          {
                              List<MUAWA.Common.BusinessObjects.NewsLetter> newsLettersList = (List<MUAWA.Common.BusinessObjects.NewsLetter>)Session["newsLetters"];

                              foreach (MUAWA.Common.BusinessObjects.NewsLetter letter in newsLettersList)
                              {
                                  string title = letter.Title;
                                  string fileName = letter.FileName;
                        %>
                        <li><a href="<%=Request.ApplicationPath %>/News_And_Events/NewsLetters/<%= fileName%>" target="_blank">
                            <%= title%></a></li>
                        <%
                            }
                          }
                        %> 
                    </ul>
                </div>
            </div>
            <br class="clear" />
            <div class="f_w_container">
                <div class="b_wr b_wrapper">
                    Advertisments
                </div>
            </div>
        </div>
        <br class="clear" />
    </div>
    <input type="hidden" id="pageId" value="3" />
    <%
        string newsCount;
        string pageSize = MUAWA.Common.Constants.Constants.defaultNewsPageSize.ToString();

        if (Session["newsCount"] != null)
        {
            newsCount = (String)Session["newsCount"];
        }
        else
        {
            newsCount = "0";
        }
    %>
    <input type="hidden" id="newsCount" value="<%= newsCount%>" />
    <input type="hidden" id="pageSize" value="<%= pageSize%>" />
</asp:Content>
