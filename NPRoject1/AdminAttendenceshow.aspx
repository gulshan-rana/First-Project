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
        <input id="SearchTo" runat="server" name="meeting-time" type="date" />
        <asp:Label ID="lblSearchFrom" runat="server" Text="SearchFrom"></asp:Label>
        <input id="SearchFrom" runat="server" type="date" />
        <asp:Button ID="BtnSearch" runat="server" Text="Search" OnClick="BtnSearch_Click" />
        <br />
        <h1>Attendence</h1>
    <asp:GridView ID="GridViewID" runat="server" DataKeyNames="id" 
        AutoGenerateColumns="false" OnRowDataBound="GridViewID_RowDataBound"  OnRowDeleting="GridViewID_RowDeleting" >
        <Columns>
        
             <asp:TemplateField HeaderText="CheckIN">
                 <ItemTemplate>
                     <asp:Label ID="lblCheckIN" runat="server" Text='<%#Eval("CheckIN") %>'></asp:Label>
                 </ItemTemplate>
                 <EditItemTemplate>
                     <asp:Calendar ID="calanderCheckIN" runat="server" SelectedDate='<%#Eval("CheckIN") %>'></asp:Calendar>
                 </EditItemTemplate>
             </asp:TemplateField>
            
            <asp:TemplateField HeaderText="CheckIN">
                 <ItemTemplate>
                     <asp:Label ID="lblCheckOut" runat="server" Text='<%#Eval("CheckOut") %>'></asp:Label>
                 </ItemTemplate>
                 <EditItemTemplate>
                     <asp:Calendar ID="calanderCheckout" runat="server" SelectedDate='<%#Eval("CheckOut") %>'></asp:Calendar>
                 </EditItemTemplate>
             </asp:TemplateField>

            <asp:BoundField DataField="UserID"  HeaderText="UserID" />
           <asp:CommandField ShowDeleteButton="true"  />
        </Columns>
    </asp:GridView>
    </div>
    
</asp:Content>
