<%@ Page Title="" Language="C#" MasterPageFile="~/AlumniWeb.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" EnableViewState="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Contact Us</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageBody" Runat="Server">
<div id="container">
  <div class="wrapper">
     <!-- <div class="col_2_b_c_1">
    <div class="b_wrapper">
		<h1 class="title u_l_title">Send a Message</h1>
       <form id="Form1" runat="server">
        <div style="margin-left:150px; margin-bottom:10px;">
        <asp:Label ID="MSG" runat="server" Text="Label"></asp:Label>
        </div>
        
        <ul class="con_form">
        	<li><span class="lbl">Subject</span><asp:TextBox ID="Subject" runat="server" CssClass="field" EnableViewState="false" ></asp:TextBox><span style="color: Red;padding-left: 5px;"><asp:RequiredFieldValidator
                ID="RequiredFieldValidator1" runat="server" ControlToValidate="Subject" ValidationGroup="ContactUs" ErrorMessage="*"></asp:RequiredFieldValidator></span> </li>
            <li><span class="lbl">Message</span><asp:TextBox ID="Message" runat="server" TextMode="MultiLine" CssClass="field txt_area" EnableViewState="false"></asp:TextBox>
            <span style="color: Red;padding-left: 5px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="Message" runat="server" ErrorMessage="*" ValidationGroup="ContactUs"></asp:RequiredFieldValidator> </span>
            </li>
            <li><span class="lbl">Name</span><asp:TextBox ID="Name" runat="server" CssClass="field" EnableViewState="false"></asp:TextBox><span style="color: Red;padding-left: 5px;"> 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="Name" ValidationGroup="ContactUs" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator> </span> </li>
            <li><span class="lbl">E-mail Address</span><asp:TextBox ID="Email" runat="server" CssClass="field" EnableViewState="false"></asp:TextBox>
                           <span style="color: Red;padding-left: 5px;">    <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
                                    ControlToValidate="Email" ErrorMessage="*" 
                                    ToolTip="E-mail is required." ValidationGroup="ContactUs" ></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="Email"
                                 ValidationExpression="^([a-zA-Z0-9]+[a-zA-Z0-9._%-]*@(?:[a-zA-Z0-9-]+\.)+[a-zA-Z]{2,4})$"  runat="server" 
                                ErrorMessage="Invalid Email" ValidationGroup="ContactUs">Invalid Email</asp:RegularExpressionValidator></span></li>
            <li class="btn_group">
            <asp:Button ID="Reset" runat="server" CssClass="btn_style_1" Text="Reset" EnableViewState="false" 
                    onclick="Reset_Click"/>
                <asp:Button ID="Send" runat="server" CssClass="btn_style_2" ValidationGroup="ContactUs" Text="Send"  EnableViewState="false"
                    onclick="Send_Click" />
            </li>
        </ul>
        </form> 
    </div>    
    </div> -->
    <div class="col_2_b_c_1">
      <div class="b_wrapper">
        <h3 class="title u_l_title">Contact Details</h3>
<%--        <p><strong>Tel:</strong> +94 112650301</p>
        <p><strong>Fax:</strong> +94112650622</p>--%>
        <p><strong>Email: </strong><a href="mailto:moratuwa.university.alumni.wa@gmail.com" class="link">moratuwa.university.alumni.wa@gmail.com</a> or <a href="mailto:contactmorawa@gmail.com" class="link">contactmorawa@gmail.com</a></p>
      </div>
      
    </div>
    <br class="clear" />
    <div class="img_frame">
         <iframe width="100%" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=perth+&amp;aq=&amp;sll=37.0625,-95.677068&amp;sspn=32.939885,86.572266&amp;ie=UTF8&amp;hq=&amp;hnear=Perth+Western+Australia,+Australia&amp;ll=-31.953004,115.857469&amp;spn=0.275552,0.676346&amp;t=m&amp;z=11&amp;output=embed"></iframe><br /><small><a href="https://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=perth+&amp;aq=&amp;sll=37.0625,-95.677068&amp;sspn=32.939885,86.572266&amp;ie=UTF8&amp;hq=&amp;hnear=Perth+Western+Australia,+Australia&amp;ll=-31.953004,115.857469&amp;spn=0.275552,0.676346&amp;t=m&amp;z=11" style="color:#0000FF;text-align:left">View Larger Map</a></small>
    	
    </div>
    
    
  </div>
  <br class="clear" />
</div>
<input type="hidden" id="pageId" value="7" />
</asp:Content>

