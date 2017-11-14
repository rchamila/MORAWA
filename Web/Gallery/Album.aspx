<%@ page title="" language="C#" masterpagefile="~/AlumniWeb.master" autoeventwireup="true" inherits="Gallery_Album, App_Web_t2puuarg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
 <title>Gallery</title>
    <script src="<%=Request.ApplicationPath %>/Scripts/jquery.fancybox.pack.js" type="text/javascript"></script>
    <link href="<%=Request.ApplicationPath %>/App_Themes/Default/jquery.fancybox.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function () {
            $(".fancybox").fancybox({
                openEffect: 'none',
                closeEffect: 'none'
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageBody" runat="Server">
    <div id="container">
        <div class="wrapper">
            <div class="b_wrapper">
                <%if (Session["album"] != null)
                  {
                      MUAWA.Common.BusinessObjects.Album album = (MUAWA.Common.BusinessObjects.Album)Session["album"];
                      string albumTitle = album.Title;
                      string albumId = album.AlbumId.ToString();
                      string[] imageList = album.ImageURLs.Split(',');
          
                %>
                <h1 class="title u_l_title">
                    <%=albumTitle%>
                    <div style="float: right;">
                        <a class="view_album_back" href="<%=Request.ApplicationPath %>/Gallery/Gallery.aspx">Back</a>
                    </div>
                </h1>
                <%
                    foreach (String image in imageList)
                    {                       
                    
                %>
                <a class="fancybox" rel="gallery1" href="<%=Request.ApplicationPath %>/Gallery/Albums/<%= albumId%>/<%= image %>"
                    title="">
                    <img src="<%=Request.ApplicationPath %>/Gallery/Albums/<%= albumId%>/thumb-<%= image %>" alt="" />
                </a>
                <%}
                  } %>
            </div>
        </div>
    </div>
    <input type="hidden" id="pageId" value="6" />
</asp:Content>
