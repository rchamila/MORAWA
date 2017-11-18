<%@ page title="" language="C#" masterpagefile="~/AlumniWeb.master" autoeventwireup="true" inherits="Gallery" CodeFile="Gallery.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   <title>Gallery</title>
    <script src="<%=Request.ApplicationPath %>/Scripts/jquery.paginate.js" type="text/javascript"></script>
    <script src="<%=Request.ApplicationPath %>/Scripts/Gallery.js" type="text/javascript"></script>
    <link href="<%=Request.ApplicationPath %>/App_Themes/Default/pagination.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageBody" Runat="Server">
<div id="container">
    <div class="wrapper">
        <div class="b_wrapper">
            <h1 class="title u_l_title">Gallery</h1>
            <div class="group_list" id="albumView">
            <%if (Session["albums"] != null)
              {
                  List<MUAWA.Common.BusinessObjects.Album> albumList = (List<MUAWA.Common.BusinessObjects.Album>)Session["albums"];

                  foreach (MUAWA.Common.BusinessObjects.Album album in albumList)
                  {
                      string albumTitle = album.Title;
                      string albumId = album.AlbumId.ToString();
                      string description = album.Description;
                      string image = album.ImageURLs.Split(',')[0];
                   %>
            <div class="group_item group_item_gallery">
                <h2><a href="<%=Request.ApplicationPath %>/Gallery/Album.aspx?AI=<%= albumId%>"><%=albumTitle%></a></h2>
                <p><a href="<%=Request.ApplicationPath %>/Gallery/Album.aspx?AI=<%= albumId%>"><span class="gallery_image"><img src="<%=Request.ApplicationPath %>/Gallery/Albums/<%= albumId%>/thumb-<%= image %>" class="img_frame" border="0" alt="our story" /></span></a>
                    <%= description%>
                </p>
                <br class="clear" />

            </div>
            <%}
              } %>
     <%--       <div class="group_item group_item_gallery">
                <h2><a href="viewAlbum.html">MORA‐WA FOUNDING DAY on 3<span class="sup">rd</span> of February 2013</a></h2>
                <p><a href="viewAlbum.html"><span class="gallery_image"><img src="images/test_image_1.png" class="img_frame" border="0" alt="our story" /></span></a>
                    University of Moratuwa Alumni Association was formed in February 2013 by past students of alma-mater who are living in Perth, Western Australia. The first event organised by this society was sponsoring the 2013 New Year traditional pirith chanting ceremony at Kenwick Buddhist Temple in Perth. Many Moratuwa University graduates living in Perth showed an overwhelming response to the request sent by few who became the self-appointed organizing committee. Thereafter many enthusiastic past students volunteered to help to organize Moratuwa Alumni association activities which lead to the first ever get-together. Many group meetings were held at organizing members' residences. All who participated were full of enthusiasm to see their emerging society get a unique identity and welcomed by the Perth Sri Lankan community.
                </p>
                <br class="clear" />
            </div>
                </div>--%>
            
        </div>
        <div id="albumPagination">
                    </div>
    </div>
</div>
  <%
      string albumCount;
      string pageSize = MUAWA.Common.Constants.Constants.defaultAlbumsPageSize.ToString();

        if (Session["albumCount"] != null)
        {
            albumCount = (String)Session["albumCount"];
        }
        else
        {
            albumCount = "0";
        }
    %>
    <input type="hidden" id="albumCount" value="<%= albumCount%>" />
    <input type="hidden" id="pageSize" value="<%= pageSize%>" />
    <input type="hidden" id="pageId" value="6" />
</asp:Content>

