<%@ Page Title="" Language="C#" MasterPageFile="~/AlumniWeb.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<title>Home</title>  
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageBody" Runat="Server">
<div id="container">
    <div class="wrapper"><!--wrapper Start-->
        <div class="main_slider">
            <div id="wowslider-container1">
                <div class="ws_images">
                    <ul>
                        <li><img src="App_Themes/Default/images/Banner/20.png" alt="Civil" title=""   id="wows1_0"/></li>
                        <li><img src="App_Themes/Default/images/Banner/1.png" alt="Civil" title=""   id="wows1_1"/></li>
                        <li><img src="App_Themes/Default/images/Banner/2.JPG" alt="Civil" title=""   id="wows1_2"/></li>
                        <li><img src="App_Themes/Default/images/Banner/3.png" alt="Civil" title=""   id="wows1_3"/></li>
                        <li><img src="App_Themes/Default/images/Banner/4.png" alt="Civil" title=""   id="wows1_4"/></li>
                        <li><img src="App_Themes/Default/images/Banner/5.png" alt="Civil" title=""   id="wows1_5"/></li>
                        <li><img src="App_Themes/Default/images/Banner/6.png" alt="Civil" title=""   id="wows1_6"/></li>
                        <li><img src="App_Themes/Default/images/Banner/7.png" alt="Civil" title=""   id="wows1_7"/></li>
                        <li><img src="App_Themes/Default/images/Banner/8.png" alt="Civil" title=""   id="wows1_8"/></li>
                        <li><img src="App_Themes/Default/images/Banner/9.png" alt="Civil" title=""   id="wows1_9"/></li>
                        <li><img src="App_Themes/Default/images/Banner/10.png" alt="Civil" title=""   id="wows1_10"/></li>
                        <li><img src="App_Themes/Default/images/Banner/11.png" alt="Civil" title=""   id="wows1_11"/></li>
                        <li><img src="App_Themes/Default/images/Banner/12.png" alt="Civil" title=""   id="wows1_12"/></li>
                        <li><img src="App_Themes/Default/images/Banner/13.png" alt="Civil" title=""   id="wows1_13"/></li>
                        <li><img src="App_Themes/Default/images/Banner/14.png" alt="Civil" title=""   id="wows1_14"/></li>
                        <li><img src="App_Themes/Default/images/Banner/15.png" alt="Civil" title=""   id="wows1_15"/></li>
                        <li><img src="App_Themes/Default/images/Banner/16.png" alt="Civil" title=""   id="wows1_16"/></li>
                        <li><img src="App_Themes/Default/images/Banner/17.png" alt="Civil" title=""   id="wows1_17"/></li>
                        <li><img src="App_Themes/Default/images/Banner/18.png" alt="Civil" title=""   id="wows1_18"/></li>
                        <li><img src="App_Themes/Default/images/Banner/19.jpeg" alt="Civil" title=""   id="wows1_19"/></li>
                        <!--<li><img src="data1/images/koala.jpg" alt="Koala" title="Koala" id="wows1_4"/></li>-->
                    </ul>
                </div>
                <div class="ws_shadow"></div>
            </div>
            <script type="text/javascript" src="scripts/wowslider.js"></script>
            <script type="text/javascript" src="scripts/script.js"></script>
        </div>
        <div class="col_1"><!--col_1 Start-->
            <div class="side_gallery">
                <div class="title">
                    <h2>Latest Albums</h2>
                </div>
                <div class="content">
                    <ul class="img_thumbnail">
                        <%if (Session["albums"] != null)
                          {
                              List<MUAWA.Common.BusinessObjects.Album> albumList = (List<MUAWA.Common.BusinessObjects.Album>)Session["albums"];

                              foreach (MUAWA.Common.BusinessObjects.Album album in albumList)
                              {
                                  string albumTitle = album.Title;
                                  string albumId = album.AlbumId.ToString();
                                  string image = album.ImageURLs.Split(',')[0];
                                  %>
                                     <li class="min_img_wrapper"><a href="<%=Request.ApplicationPath %>/Gallery/Album.aspx?AI=<%= albumId%>"><span class="min_img">
                            <img style="height: 70px; width: 112px;" src="<%=Request.ApplicationPath %>/Gallery/Albums/<%= albumId%>/thumb-<%= image %>" alt="Alternate Text" /></span></a></li>

                                  <%
                              }
                          }%>
                     
                    </ul>
                    <br class="clear"/>
                </div>
                <div class="bot"></div>
            </div>
            <div class="b_wrapper" style="padding: 0px !important;"><a href="http://info.flagcounter.com/n4WX"><img
                    src="http://s04.flagcounter.com/count/n4WX/bg_FFFFFF/txt_000000/border_CCCCCC/columns_3/maxflags_12/viewers_0/labels_1/pageviews_1/flags_1/"
                    alt="Flag Counter" border="0"></a></div>
        </div>
        <!--col_1 End-->
        <div class="col_2"><!--col_2 Start-->
            <div class="b_wrapper">
                <div class="main_title">
                    <h1>"Alumni Association of the University of Moratuwa Western Australia (MORA-WA)"</h1>
                </div>
                <p> The Moratuwa University Alumni of Western Australia was officially formed on 3rd of February 2013 at
                    the inaugural meeting held at Centenary park, Perth in Western Australia. The short name for the
                    Alumni is "Mora- WA". </p>
            </div>
            <div>
                <div class="b_wrapper" style="float: left;margin-right: 9px;width: 65%;height: 160px">
                    <h3 class="intro_title">Latest News:</h3>
                    <ul class="headlines">
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
                </div>
                <div class="b_wrapper" style="height: 160px">
                    <h3 class="intro_title">Quick Links:</h3>
                    <ul class="headlines">
                        <li><a href="http://www.mrt.ac.lk">University of Moratuwa</a></li>
                        <li><a href="http://www.uomalumni.lk/">Alumini University of Moratuwa</a></li>
                        <li><a href="http://umaav.org.au/">University of Moratuwa Alumni Association in Victoria</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <!--col_1 End-->
        <br class="clear"/>

        <div class="f_w_container">
            <div class="b_wr b_wrapper"> Advertisments</div>
        </div>
    </div>
    <!--wrapper Start-->
    <br class="clear"/>
</div>
    <input type="hidden" id="pageId" value="1" />
</asp:Content>

