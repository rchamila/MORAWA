<%@ Page Title="" Language="C#" MasterPageFile="~/AlumniWeb.master" AutoEventWireup="true"
    CodeFile="SearchResults.aspx.cs" Inherits="SearchResults" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
 <title>Search</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageBody" runat="Server">
    <div id="container">
        <div class="wrapper">
            <div class="f_w_container">
                <div class="b_wrapper">
                    <h1 class="title u_l_title">
                        Search Results</h1>
                    <%
                        if (Session["error"] != null)
                        {
                            string errorMessage = (String)Session["error"];
                    %>
                    <h4>
                        <%=errorMessage %>
                    </h4>
                    <%
                        }
                        else
                        {
                    %>
                    <%if (Session["news"] != null)
                      {
                          List<MUAWA.Common.BusinessObjects.NewsAndEventsItem> newsList = (List<MUAWA.Common.BusinessObjects.NewsAndEventsItem>)Session["news"];

                          if (newsList.Count > 0)
                          {                             
                          
                    %>
                    <h4 class="title u_l_title">
                        News</h4>
                    <ul class="headlines">
                        <%
                            
                          
                            foreach (MUAWA.Common.BusinessObjects.NewsAndEventsItem news in newsList)
                            {
                                string newsTitle = news.Title;
                                string newsId = news.NewsId.ToString();
                        %>
                        <li><a href="<%=Request.ApplicationPath %>/News_And_Events/NewsAndEventsDetails.aspx?NI=<%= newsId%>">
                            <%= newsTitle%></a></li>
                        <%
                            }
                        %>
                    </ul>
                    <%
                        }
                      }

                      if (Session["events"] != null)
                      {
                          List<MUAWA.Common.BusinessObjects.NewsAndEventsItem> eventsList = (List<MUAWA.Common.BusinessObjects.NewsAndEventsItem>)Session["events"];

                          if (eventsList.Count > 0)
                          {                             
                          
                    %>
                    <h4 class="title u_l_title">
                        Events</h4>
                    <ul class="headlines">
                        <%
                            
                          
                            foreach (MUAWA.Common.BusinessObjects.NewsAndEventsItem news in eventsList)
                            {
                                string newsTitle = news.Title;
                                string newsId = news.NewsId.ToString();
                        %>
                        <li><a href="<%=Request.ApplicationPath %>/News_And_Events/NewsAndEventsDetails.aspx?NI=<%= newsId%>">
                            <%= newsTitle%></a></li>
                        <%
                            }%>
                    </ul>
                    <%
                        }
                      }
                      if (Session["newsLetters"] != null)
                      {

                          List<MUAWA.Common.BusinessObjects.NewsLetter> newsLettersList = (List<MUAWA.Common.BusinessObjects.NewsLetter>)Session["newsLetters"];

                          if (newsLettersList.Count > 0)
                          {                                
                            
                    %>
                    <h4 class="title u_l_title">
                        News Letters</h4>
                    <ul class="headlines">
                        <%
                          
                            foreach (MUAWA.Common.BusinessObjects.NewsLetter letter in newsLettersList)
                            {
                                string title = letter.Title;
                                string fileName = letter.FileName;
                        %>
                        <li><a href="<%=Request.ApplicationPath %>/News_And_Events/NewsLetters/<%= fileName%>" target="_blank">
                            <%= title%></a></li>
                        <%
                            }
                        %>
                    </ul>
                    <%
                        }

                      }
                      if (Session["albums"] != null)
                      {
                          List<MUAWA.Common.BusinessObjects.Album> albumList = (List<MUAWA.Common.BusinessObjects.Album>)Session["albums"];
                          if (albumList.Count > 0)
                          {                              
                          
                    %>
                     <h4 class="title u_l_title">
                        Albums</h4>
                    <ul class="img_thumbnail">
                        <%
                            foreach (MUAWA.Common.BusinessObjects.Album album in albumList)
                            {
                                string albumTitle = album.Title;
                                string albumId = album.AlbumId.ToString();
                                string image = album.ImageURLs.Split(',')[0];
                        %>
                        <li class="min_img_wrapper"><a href="<%=Request.ApplicationPath %>/Gallery/Album.aspx?AI=<%= albumId%>"><span
                            class="min_img">
                            <img style="height: 70px; width: 112px;" src="<%=Request.ApplicationPath %>/Gallery/Albums/<%= albumId%>/thumb-<%= image %>"
                                alt="Alternate Text" /></span></a></li>
                                <%=albumTitle%>
                        <%
                            }
                        %>
                    </ul>
                    <br class="clear" />
                    <%
                        }
                      }

                        }
                    %>
                </div>
            </div>
        </div>
        <br class="clear" />
    </div>
</asp:Content>
