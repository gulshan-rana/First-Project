<%@ Page Title="" Language="C#" MasterPageFile="~/Amin.Master" AutoEventWireup="true" CodeBehind="AdminDataShow.aspx.cs" Inherits="NPRoject1.AdminDataShow" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <header>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <style>
         

        .grdContent
        {
            width: 80%;
            border: solid 2px black;
            min-width: 80%;
        }
        .header
        {
            background-color: #646464;
            font-family: Arial;
            color: White;
            border: none 0px transparent;
            height: 25px;
            text-align: center;
            font-size: 16px;
        }
        .rows
        {
            background-color: #fff;
            font-family: Arial;
            font-size: 14px;
            color: #000;
            min-height: 25px;
            text-align: left;
            border: none 0px transparent;
        }
        .rows:hover
        {
            background-color: #ff8000;
            font-family: Arial;
            color: #fff;
            text-align: left;
        }
        .selectedrow
        {
            background-color: #ff8000;
            font-family: Arial;
            color: #fff;
            font-weight: bold;
            text-align: left;
        }
        .mydatagrid a /** FOR THE PAGING ICONS  **/
         {
            background-color: Transparent;
            padding: 5px 5px 5px 5px;
            color: #fff;
            text-decoration: none;
            font-weight: bold;
        }
        .mygrdContent a:hover /** FOR THE PAGING ICONS  HOVER STYLES**/
        {
            background-color: #000;
            color: #fff;
        }
        .mygrdContent span /** FOR THE PAGING ICONS CURRENT PAGE INDICATOR **/
         {
            background-color: #c9c9c9;
            color: #000;
            padding: 5px 5px 5px 5px;
        }
        .pager
        {
            background-color: #646464;
            font-family: Arial;
            color: White;
            height: 30px;
            text-align: left;
        }
        .mygrdContent td
        {
            padding: 5px;
        }
        .mygrdContent th
        {
            padding: 5px;
        }
          /* */
        
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
    <div class="col-md-9"  style="margin-top: 10px;">
        <div style="text-align:center">
            <asp:GridView ID="GridView1" class="container" Width="50%" CssClass="mygrdContent" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" 
            AllowPaging="True" runat="server" OnRowCommand="GridView1_RowCommand" AutoGenerateColumns="false" OnRowDeleting="GridView1_RowDeleting">

        <Columns>
            <asp:BoundField DataField="id" HeaderText="Id" />
            <asp:BoundField DataField="FirstName" HeaderText="First Name" />
            <asp:BoundField DataField="LastName" HeaderText="Last Name" />
            <asp:BoundField DataField="EmailAddress" HeaderText="Email Address" />
            <asp:BoundField DataField="Password" HeaderText="Password" />
            <asp:BoundField DataField="Address" HeaderText="Address" />
            <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" />
            <asp:BoundField DataField="RollName" HeaderText="RollID" />
            <asp:BoundField DataField="CountryName" HeaderText="CountryID" />
            <asp:BoundField DataField="StateName" HeaderText="StateID" />
            <asp:BoundField DataField="CityName" HeaderText="CityID" />
      
          
            <asp:TemplateField>
                <ItemTemplate>
                     <asp:Image ID="Image" runat="server" ImageUrl='<%#Eval("Photo","~/Images/{0}") %>' Height="90" Width="100" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowDeleteButton="true" ButtonType="Link" HeaderText="Delete Button" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandName="EditButton"  CommandArgument='<%#Eval("id") %>' BorderStyle="Double" BorderColor="Tomato" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
        </div>
    </div>

    <br/>
    <br/>

   <div class="container">
        <div class="row centered-form">
            <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4" style="margin-top: 10px;">
                <div class="panel panel-default">
                    <div class="panel-body">

    
    
                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <asp:TextBox ID="textboxFirstname" placeholder="First Name" runat="server"></asp:TextBox>
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
                                 <asp:TextBox ID="textboxPassword" runat="server" Placeholder="Password"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                 <asp:TextBox ID="textboxAddress" runat="server" Placeholder="Address"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                 <asp:TextBox ID="textboxPhoneNumber" runat="server" Placeholder="Phone Number"></asp:TextBox>
                                </div>
                            </div>
                            </div>
                            <div  class="row">
                                <div class="col-md-3">
                                    <asp:Label ID="lblCountryName" runat="server" Text="Country Name"></asp:Label>
                                </div>
                                <div class="col-md-9">
                                    <asp:DropDownList ID="DDCountryName" CssClass="btn btn-primary dropdown-toggle" data-toggle="dropdown" type="button" runat="server" OnSelectedIndexChanged="DDCountryName_SelectedIndexChanged" AutoPostBack="true" DataTextField="CountryName" DataValueField="CountryID" AppendDataBoundItems="true">
                                    <asp:ListItem Value="0">--Select Country--</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div  class="row">
                                <div class="col-md-3">
                                    <asp:Label ID="lblStateName" runat="server" Text="State Name"></asp:Label>
                                </div>
                                <div class="col-md-9">
                                    <asp:DropDownList ID="DDStatename" CssClass="btn btn-primary dropdown-toggle" data-toggle="dropdown" type="button" runat="server" OnSelectedIndexChanged="DDStatename_SelectedIndexChanged" AutoPostBack="true" DataTextField="StateName" DataValueField="StateID" AppendDataBoundItems="true">
                                    <asp:ListItem Value="0">--Select State--</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div  class="row">
                                <div class="col-md-3">
                                    <asp:Label ID="lblCityName" runat="server" Text="City Name"></asp:Label>
                                </div>
                                <div class="col-md-9">
                                    <asp:DropDownList ID="DDCityName" CssClass="btn btn-primary dropdown-toggle" data-toggle="dropdown" type="button" runat="server" AutoPostBack="true" DataTextField="CityName" DataValueField="CityID" AppendDataBoundItems="true">
                                    <asp:ListItem Value="0">--Select City--</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                           <br />
                            <div class="row">
                                <div class="col-md-3">
                                    <asp:Label ID="lblRollName" runat="server" Text="RollName"></asp:Label>
                                </div>
                                <div class="col-md-9">
                                    <asp:DropDownList ID="DDRollName" CssClass="btn btn-primary dropdown-toggle" data-toggle="dropdown" type="button" runat="server"  AutoPostBack="true" DataTextField="RollName" DataValueField="RollID" AppendDataBoundItems="true">
                                    <asp:ListItem Value="0">--Select Roll--</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        <br/>
                        <div class="row">
                            <div class="col-md-3">
                                <asp:Label ID="ImageID" runat="server" Text="image"></asp:Label>
                            </div>
                            <div class="col-md-9">
                                <asp:Image ID="ImageGrid" ImageUrl='<%#Eval("Photo","~/Images/{0}") %>'  runat="server" Height="90Px" Width="100px" />
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-3">
                                <asp:Label ID="lblFileUpload" runat="server" Text="File Upload"></asp:Label>
                            </div>
                            <div class="col-md-9">
                                <asp:FileUpload ID="FileUploadid"  runat="server" />
                            </div>
                        </div>
                        <br/>
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
