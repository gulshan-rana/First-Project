<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="UserPage.aspx.cs" Inherits="NPRoject1.UserPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <table>
      <tr>
          <td>
               <asp:Label ID="lblFirstName" runat="server" Text="First Name"></asp:Label>
          </td>
      </tr>
       <tr>
           <td>
               <asp:TextBox ID="textboxFirstName" runat="server"></asp:TextBox>
           </td>
       </tr>

       <tr>
          <td>
              <asp:Label ID="lblLastName" runat="server" Text="Last Name"></asp:Label>
          </td>
      </tr>
       <tr>
           <td>
               <asp:TextBox ID="textboxLastName" runat="server"></asp:TextBox>
           </td>
       </tr>
       <tr>
          <td>
              <asp:Label ID="lblEmailAddress" runat="server" Text="Email Address"></asp:Label>
          </td>
      </tr>
       <tr>
           <td>
               <asp:TextBox ID="textboxEmailAddress" runat="server"></asp:TextBox>
           </td>
       </tr>
       <tr>
          <td>
              <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
          </td>
      </tr>
       <tr>
           <td>
               <asp:TextBox ID="textboxPassword" runat="server"></asp:TextBox>
           </td>
       </tr>
       <tr>
          <td>
              <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
          </td>
      </tr>
       <tr>
           <td>
               <asp:TextBox ID="textboxAddress" runat="server"></asp:TextBox>
           </td>
       </tr>
       <tr>
          <td>
              <asp:Label ID="lblPhoneNumber" runat="server" Text="Phone Number"></asp:Label>
          </td>
      </tr>
       <tr>
           <td>
               <asp:TextBox ID="textboxPhoneNumber" runat="server"></asp:TextBox>
           </td>
       </tr>

       <tr>
          <td>
              <asp:Label ID="lblCountryName" runat="server" Text="Country Name"></asp:Label>
          </td>
      </tr>
       <tr>
           <td>
               <asp:DropDownList ID="DDCountryName" runat="server"  DataValueField="CountryID" DataTextField="CountryName">
                   <asp:ListItem Value="0">--Select Country--</asp:ListItem>
                   
               </asp:DropDownList>
           </td>
       </tr>

       <tr>
          <td>
              <asp:Label ID="lblStateName" runat="server" Text="State Name"></asp:Label>
          </td>
      </tr>
       <tr>
           <td>
               <asp:DropDownList ID="DDStateName" runat="server" AutoPostBack="true" DataTextField="StateName" DataValueField="StateID">
                    <asp:ListItem Value="0">--Select State--</asp:ListItem>
               </asp:DropDownList>
           </td>
       </tr>

       <tr>
          <td>
              <asp:Label ID="lblCityName" runat="server" Text="City Name"></asp:Label>
          </td>
      </tr>
       <tr>
           <td>
               <asp:DropDownList ID="DDCityName" runat="server" AutoPostBack="true" DataTextField="CityName" DataValueField="CityID"> 
                    <asp:ListItem Value="0">--Select City--</asp:ListItem>
               </asp:DropDownList>
           </td>
       </tr>

       <tr>
          <td>
              <asp:Label ID="lblImage" runat="server" Text="Image"></asp:Label>
          </td>
      </tr>
       <tr>
           <td> 
               <asp:Image ID="imageID" ImageUrl='<%#Eval("Photo","~/Images/{0}")%>' runat="server" Height="80" Width="90" />
           </td>
       </tr>

       

   </table>
</asp:Content>
