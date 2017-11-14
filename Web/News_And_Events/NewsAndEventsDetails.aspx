<%@ page title="" language="C#" masterpagefile="~/AlumniWeb.master" autoeventwireup="true" inherits="News_And_Events_NewsAndEventsDetails, App_Web_d4hxodt5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>News Details</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageBody" Runat="Server">
<div id="container">
  <div class="wrapper">
    
    <div class="f_w_container">
      <div class="b_wrapper">
      <%if (Session["newsDetails"] != null)
        { 
            MUAWA.Common.BusinessObjects.NewsAndEventsItem newsOrEventDetails= (MUAWA.Common.BusinessObjects.NewsAndEventsItem)Session["newsDetails"];

            string title = newsOrEventDetails.Title;
            string body = newsOrEventDetails.NewsBody; 
            %>
        <h1 class="title u_l_title"><%=title%></h1>
        <%=body %>
      <%}
        else
        {
            %>
            <p>No Details Available</p>
            <%
        } %>
      </div>
    </div>
  </div>
  <br class="clear" />
</div>
<input type="hidden" id="pageId" value="3" />
</asp:Content>

