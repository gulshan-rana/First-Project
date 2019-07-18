<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistrationPage.aspx.cs" Inherits="NPRoject1.RegistrationPage" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <header>
       <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <style>
            body{
    background-color: #525252;
}
.centered-form{
	margin-top: 60px;
}

.centered-form .panel
{
	background: rgba(255, 255, 255, 0.8);
	box-shadow: rgba(0, 0, 0, 0.3) 20px 20px 20px;
}


@media screen and  (min-width: 992px) {
  .col-md-4 {
   width: 37.333333%;
  }
}
        </style>
    </header>
    
    <div class="container">
        <div class="row centered-form">
            <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Please sign up<small>Thanks!</small></h3>
                    </div>
                    <div class="panel-body">
                       <div class="row">
                           <div class="col-sm-12">
                               <div class="form-group">
                                   <asp:TextBox ID="textboxFirstName" CssClass="form-control" Placeholder="First Name" runat="server"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="RRFirstname" runat="server" ControlToValidate="textboxFirstName" ErrorMessage="First Name Required" ForeColor="Red" ValidationGroup="SUbmit"></asp:RequiredFieldValidator>
                               </div>
                           </div>

                           <div class="col-sm-12">
                               <div class="form-group">
                                    <asp:TextBox ID="textboxLastName" CssClass="form-control" Placeholder="Last Name" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RRLastName" runat="server" ControlToValidate="textboxLastName" ErrorMessage="Last Name Required" ForeColor="Red" ValidationGroup="SUbmit"></asp:RequiredFieldValidator>
                               </div>
                           </div>

                           <div class="col-sm-12">
                               <div class="form-group">
                                   <asp:TextBox ID="textboxEmailAddress" CssClass="form-control" Placeholder="Email Address" runat="server"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="RREmailAddress" runat="server" ControlToValidate="textboxEmailAddress" ErrorMessage="EmailAddress Required" ForeColor="Red" ValidationGroup="SUbmit"></asp:RequiredFieldValidator>
                                   </div>
                           </div>



                           <div class="col-sm-12">
                               <div class="form-group">
                                  <asp:TextBox ID="textboxPassword" CssClass="form-control" Placeholder="Password" runat="server"></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="RRPassword" runat="server" ControlToValidate="textboxPassword" ErrorMessage="Password Required" ForeColor="Red" ValidationGroup="SUbmit"></asp:RequiredFieldValidator>
                               </div>
                           </div>

                           <div class="col-sm-12">
                               <div class="form-group">
                                  <asp:TextBox ID="textboxConPassword" CssClass="form-control" Placeholder="Confirm Password" runat="server"></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="RRConPassword" runat="server" ControlToValidate="textboxConPassword" ErrorMessage="Confirm Password Required" ForeColor="Red" ValidationGroup="SUbmit"></asp:RequiredFieldValidator>
                                 <asp:CompareValidator ID="CompValidate" runat="server" ControlToValidate="textboxConPassword" ControlToCompare="textboxPassword" ErrorMessage="Password and Con-Password Not Matched" ForeColor="Red" ValidationGroup="SUbmit"></asp:CompareValidator>
                               </div>
                           </div>
                           </div>
                           <br />
                           <div class="row">
                               <div class="col-md-9" style="text-align:center">
                                <asp:Button ID="btnSave" CssClass="btn btn-success" ValidationGroup="SUbmit" runat="server" Text="Save" OnClick="btnSave_Click" />
                               </div>
                           </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
