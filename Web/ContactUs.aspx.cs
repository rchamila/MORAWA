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

public partial class ContactUs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.ResetForm();            
        }        
    }

    protected void Send_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            Contact contact = new Contact();
            contact.Subject = ((TextBox)this.Subject).Text;
            contact.Name = ((TextBox)this.Name).Text;
            contact.Message = ((TextBox)this.Message).Text;
            contact.Email = ((TextBox)this.Email).Text;
            contact.Date = DateTime.Now;
            ContactUsManager manager = new ContactUsManager();
            manager.InsertContactUsDetails(contact);
            ResetForm();

            ((Label)this.MSG).Text = "Your Message is Successfully Sent.";
        }
    }

    protected void Reset_Click(object sender, EventArgs e)
    {
        this.ResetForm();
    }

    private void ResetForm()
    {
        ((TextBox)this.Subject).Text = "";
        ((TextBox)this.Name).Text = "";
        ((TextBox)this.Message).Text = "";
        ((TextBox)this.Email).Text = "";
        ((Label)this.MSG).Text = "";
    }
}