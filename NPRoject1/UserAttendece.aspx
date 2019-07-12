<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="UserAttendece.aspx.cs" Inherits="NPRoject1.UserAttendece" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
        <asp:Button ID="IDCheckIN" runat="server" Text="CheckIn" OnClick="IDCheckIN_Click" />
    </div>
    <div>
        <asp:Button ID="IDCheckOut" runat="server" Text="CheckOut" OnClick="IDCheckOut_Click" />
    </div>

   <h1>Heading List</h1>
    <asp:GridView ID="GridViewID" runat="server" AutoGenerateColumns="false" >
        <Columns>
            <asp:BoundField DataField="CheckIN" HeaderText="CheckIN Date" />
            <asp:BoundField DataField="CheckOut" HeaderText="CheckOut Date" />
            <asp:BoundField DataField="CreatedDate" HeaderText="Created Date" />
        </Columns>
    </asp:GridView>
</asp:Content>
