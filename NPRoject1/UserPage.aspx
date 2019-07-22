<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="UserPage.aspx.cs" Inherits="NPRoject1.UserPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #imageID {
        border: 2px solid #0a0a0a;
    margin-left: 77px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding-top:12px;">
  <div class="form-group">
              <asp:Label ID="lblImage" runat="server" Text="Image"></asp:Label>
               <asp:Image ID="imageID" ImageUrl='<%#Eval("Photo","~/Images/{0}")%>'  runat="server" Height="80" Width="90" />
           </div>
    <div class="form-group">      
               <asp:Label ID="lblFirstName" runat="server" Text="First Name"></asp:Label>
                      <asp:TextBox ID="textboxFirstName" class="form-control" runat="server"></asp:TextBox>
    </div>
      <div class="form-group"> 
              <asp:Label ID="lblLastName" runat="server" Text="Last Name"></asp:Label>
         
               <asp:TextBox ID="textboxLastName" class="form-control" runat="server"></asp:TextBox>
          </div>
       <div class="form-group"> 
              <asp:Label ID="lblEmailAddress" runat="server" Text="Email Address"></asp:Label>
         
               <asp:TextBox ID="textboxEmailAddress" class="form-control" runat="server"></asp:TextBox>
           </div>
 <div class="form-group"> 
      
              <asp:Label ID="lblPassword" runat="server" Visible="false" Text="Password"></asp:Label>
          
               <asp:TextBox ID="textboxPassword" class="form-control" Visible="false"  runat="server"></asp:TextBox>
          </div>
      <div class="form-group">
              <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
          
               <asp:TextBox ID="textboxAddress" class="form-control" runat="server"></asp:TextBox>
                    </div>
       <div class="form-group">
              <asp:Label ID="lblPhoneNumber" runat="server" Text="Phone Number"></asp:Label>
        
               <asp:TextBox ID="textboxPhoneNumber" class="form-control" runat="server"></asp:TextBox>
          </div>

         <div class="form-group">
       
              <asp:Label ID="lblCountryName" runat="server" Text="Country Name"></asp:Label>
        
               <asp:DropDownList ID="DDCountryName" runat="server" class="form-control" DataValueField="CountryID" 
                   DataTextField="CountryName" OnSelectedIndexChanged="DDCountryName_SelectedIndexChanged" AutoPostBack="true">
                   <asp:ListItem Value="0">--Select Country--</asp:ListItem>
                   
               </asp:DropDownList>                                    
          </div>
       <div class="form-group">

      
              <asp:Label ID="lblStateName" runat="server" Text="State Name"></asp:Label>
         
               <asp:DropDownList ID="DDStateName" runat="server" class="form-control" AutoPostBack="true" DataTextField="StateName" DataValueField="StateID" OnSelectedIndexChanged="DDStateName_SelectedIndexChanged" >
                    <asp:ListItem Value="0">--Select State--</asp:ListItem>
               </asp:DropDownList>
            </div>
        <div class="form-group">
   
              <asp:Label ID="lblCityName" runat="server" Text="City Name"></asp:Label>
         
               <asp:DropDownList ID="DDCityName" runat="server" class="form-control" AutoPostBack="true" DataTextField="CityName" DataValueField="CityID"> 
                <asp:ListItem Value="0">--Select City--</asp:ListItem>
               </asp:DropDownList>
          </div>

         

             <div class="form-group">
               <asp:FileUpload ID="FileUploadID" class="form-control" runat="server" />
             </div>

            <div class="form-group">
               <asp:Button ID="BntUpdate" runat="server" CssClass="btn btn-success" Text="Update" OnClick="BntUpdate_Click" />
           </div>
          </div>

</asp:Content>
