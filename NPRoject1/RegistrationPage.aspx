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
                           <div class="col-xs-6 col-sm-6 col-md-6">
                               <div class="form-group">
                                   <asp:TextBox ID="textboxFirstName" Placeholder="First Name" runat="server"></asp:TextBox>
                               </div>
                           </div>

                           <div class="col-xs-6 col-sm-6 col-md-6">
                               <div class="form-group">
                                    <asp:TextBox ID="textboxLastName" Placeholder="Last Name" runat="server"></asp:TextBox>
                               </div>
                           </div>

                           <div class="col-xs-6 col-sm-6 col-md-6">
                               <div class="form-group">
                                   <asp:TextBox ID="textboxEmailAddress" Placeholder="Email Address" runat="server"></asp:TextBox>
                               </div>
                           </div>

                           <div class="col-xs-6 col-sm-6 col-md-6">
                               <div class="form-group">
                                  <asp:TextBox ID="textboxPassword" Placeholder="Password" runat="server"></asp:TextBox>
                               </div>
                           </div>

                           <div class="col-xs-6 col-sm-6 col-md-6">
                               <div class="form-group">
                                   <asp:TextBox ID="textboxAddress" Placeholder="Address" runat="server"></asp:TextBox>
                               </div>
                           </div>

                           <div class="col-xs-6 col-sm-6 col-md-6">
                               <div class="form-group">
                                   <asp:TextBox ID="textboxPhoneNumber" Placeholder="Phone Number " runat="server"></asp:TextBox>
                               </div>
                           </div>
                           </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <asp:Label ID="Country" runat="server" Text="Country"></asp:Label>
                                </div>

                                <div class="col-md-9">
                                    <asp:DropDownList ID="DDCountry" CssClass="btn btn-primary dropdown-toggle" data-toggle="dropdown" type="button" runat="server" AutoPostBack="true" DataTextField="CountryName"
                                DataValueField="CountryID" AppendDataBoundItems="true" OnSelectedIndexChanged="DDCountry_SelectedIndexChanged">
                               <asp:ListItem Value="0">-Select Country-</asp:ListItem>
                               </asp:DropDownList>
                                </div>
                            </div>

                            <br />
                           <div class="row">
                               <div class="col-md-3">
                                   <asp:Label ID="lblState" runat="server" Text="State"></asp:Label>
                               </div>
                               <div class="col-md-9">
                                    <asp:DropDownList ID="DDState" runat="server" CssClass="btn btn-primary dropdown-toggle" data-toggle="dropdown" type="button" AutoPostBack="true" DataTextField="Statename"
                   DataValueField="StateID" AppendDataBoundItems="true" OnSelectedIndexChanged="DDState_SelectedIndexChanged">
                    <asp:ListItem Value="0">-Select State-</asp:ListItem>
                </asp:DropDownList>
                               </div>
                           </div>
                               
                        <br />

                            <div class="row">
                               <div class="col-md-3">
                                   <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label>
                               </div>
                               <div class="col-md-9">
                                   <asp:DropDownList ID="DDcity" runat="server" CssClass="btn btn-primary dropdown-toggle" data-toggle="dropdown" type="button" AutoPostBack="true" DataTextField="CityName" 
                    DataValueField="CityID" AppendDataBoundItems="true">
                    <asp:ListItem Value="0">-Select City-</asp:ListItem>
                </asp:DropDownList>
                               </div>
                           </div>

                           <br />
                           
                               <div class="row">
                                   <div class="col-md-3">
                               <asp:Label ID="FileUpload" runat="server" Text="File Upload"></asp:Label>
                               </div>
                                <div class="col-md-9" >
                                   <asp:FileUpload ID="FileUploadDP" runat="server" />
                               </div>
                           </div>
                          
                           
                           <br />
                           <div class="row">
                               <div class="col-md-9" style="text-align:center">
                                <asp:Button ID="btnSave" CssClass="btn btn-success" runat="server" Text="Save" OnClick="btnSave_Click" />
                               </div>
                           </div>
                       
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
