<%@ Page Title="" Language="C#" MasterPageFile="~/Amin.Master" AutoEventWireup="true" CodeBehind="AdminAttendenceshow.aspx.cs" Inherits="NPRoject1.AdminAttendenceshow" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    th,td {
    text-align:center;
    }

table {
  border-collapse: collapse;
  width: 80%;
    margin-left: 10%;
}

th, td {
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {background-color: #f2f2f2;}


    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align:center;">
          <h1 style="text-align:center;">User Name</h1>
         <asp:DropDownList ID="DDName" runat="server" AutoPostBack="true"  DataTextField="FirstName" DataValueField="id" OnSelectedIndexChanged="DDName_SelectedIndexChanged">
             <asp:ListItem Value="0">--Select User Name--</asp:ListItem>
         </asp:DropDownList>
        <br />
        <h1 style="text-align:center;">Search Button</h1>
        <asp:Label ID="lblSearchTo" runat="server" Text="SearchTo"></asp:Label>
        <input id="SearchTo" runat="server" type="date" />
        <asp:Label ID="lblSearchFrom" runat="server" Text="SearchFrom"></asp:Label>
        <input id="SearchFrom" runat="server" type="date" />
        <asp:Button ID="BtnSearch" runat="server" Text="Search" OnClick="BtnSearch_Click" />
        <br />
        <h1>Attendence</h1>
    <asp:GridView ID="GridViewID" runat="server" AutoGenerateColumns="false" >
        <Columns>
            <asp:BoundField DataField="CheckIN" HeaderText="CheckIN" />
            <asp:BoundField DataField="CheckOut" HeaderText="CheckOut" />
            <asp:BoundField DataField="UserID"  HeaderText="UserID" />
           
        </Columns>
    </asp:GridView>
    </div>
    
</asp:Content>
