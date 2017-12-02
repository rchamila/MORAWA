<%@ Page Title="" Language="C#" MasterPageFile="~/AlumniWeb.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Home</title>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageBody" runat="Server">
    <div id="container">

        <div class="slider">
            <ul class="bxslider">  
                 <li>
                    <img src="App_Themes/Default/images/Banner/New_Members_Welcome_2017.jpg"  title="New Members Welcome 2017"/>
                </li>
                <li>
                    <img src="App_Themes/Default/images/Banner/MoraMuyuruSara2017small.png" align="middle" title="Mora Muyuru Sara 2017" id="wows1_26" />
                </li> 
               <li>
                    <img src="App_Themes/Default/images/Banner/CareerDay2016.jpg"  title="" />
                </li>
                <li>
                    <img src="App_Themes/Default/images/Banner/Tree Planting.jpg" alt="Civil" title="" id="wows1_25" />
                </li>
                <li>
                    <img src="App_Themes/Default/images/Banner/Mora-Pera.jpg" alt="Civil" title="" id="wows1_25"/>
                </li>
                <li>
                    <img src="App_Themes/Default/images/Banner/10.jpg" alt="Civil" title="" id="wows1_25"  />
                </li>
                <li>
                    <img src="App_Themes/Default/images/Banner/Miyurusara.jpg" alt="Civil" title="" id="wows1_26"  />
                </li>
                <li>
                    <img src="App_Themes/Default/images/Banner/MoraFoodFair.jpg" alt="Civil" title="" id="wows1_26"/>
                </li>
                 <li>
                    <img src="App_Themes/Default/images/Banner/MoraPera2015.jpg" alt="Civil" title="" id="wows1_26"  />
                </li>
                <li>
                    <img src="App_Themes/Default/images/Banner/Weeding.jpg" alt="Civil" title="" id="wows1_26"  />
                </li> 
                <li>
                    <img src="App_Themes/Default/images/Banner/foodfair_SLSBS2016.jpg" alt="Civil" title="" id="wows1_26"   />
                </li> 
                  <li>
                    <img src="App_Themes/Default/images/Banner/bbq-2017.png" alt="Civil" title="" id="wows1_26"   />
                </li> 

              
            </ul>
        </div>
        <script src="Scripts/jquery.bxslider.min.js" type="text/javascript"></script>
        <script src="Scripts/jcarousel.basic.js" type="text/javascript"></script>



        <div class="wrapper">
            <!--wrapper Start-->

            <div class="col_1">
                <!--col_1 Start-->
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
                       <br class="clear" />
                       <p><a href="https://www.facebook.com/groups/170683540038578/" target="_blank">Events photos, Please visit our facebook page</a></p>  
                      
                    </div>                    
                     
                        
                    <div class="bot"></div>
                  <br/>
                  <br/>
                </div>
                <div class="b_wrapper" style="padding: 0px !important;">
                    <a href="http://info.flagcounter.com/n4WX">
                        <img
                            src="http://s04.flagcounter.com/count/n4WX/bg_FFFFFF/txt_000000/border_CCCCCC/columns_3/maxflags_12/viewers_0/labels_1/pageviews_1/flags_1/"
                            alt="Flag Counter" border="0"></a>
                </div>
            </div>
            <!--col_1 End-->
            <div class="col_2">
                <!--col_2 Start-->
                <div class="b_wrapper">
                    <div class="main_title">
                        <h1>"Alumni Association of the University of Moratuwa Western Australia (MORA-WA)"</h1>
                    </div>
                    <p>
                        The Moratuwa University Alumni of Western Australia was officially formed on 3rd of February 2013 at
                    the inaugural meeting held at Centenary park, Perth in Western Australia. The short name for the
                    Alumni is "Mora- WA".                    
                    </p>
                     <p>
                       Our Vision is to dedicate its activities to wellbeing of the membership and their families in WA, charity and good will missions                   
                    </p>
                    <p>
                      Our Mission is to social interaction, networking and social welfare of past students and others who are affiliated to Moratuwa University.
                    </p>
                </div>
              <br/>
                <div>
                    <div class="b_wrapper" style="float: left; margin-right: 9px; width: 65%; height: 360px">
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
                    <div class="b_wrapper" style="height: 120px">
                        <h3 class="intro_title">Quick Links:</h3>
                        <ul class="headlines">
                            <li><a href="https://www.facebook.com/groups/170683540038578/" target="_blank">Our Facebook Closed Group</a></li>  
                             
                            <li><a href="http://www.mrt.ac.lk" target="_blank">University of Moratuwa</a></li>                            
                            <li><a href="http://umaav.org.au/" target="_blank">University of Moratuwa Alumni Association in Victoria</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!--col_1 End-->
        
        </div>
        <!--wrapper Start-->
       <br class="clear" />
    </div>
    <input type="hidden" id="pageId" value="1" />
</asp:Content>

