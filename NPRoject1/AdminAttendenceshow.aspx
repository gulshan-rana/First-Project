<%@ Page Title="" Language="C#" MasterPageFile="~/Amin.Master" AutoEventWireup="true" CodeBehind="AdminAttendenceshow.aspx.cs" Inherits="NPRoject1.AdminAttendenceshow" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
          <h1>Attendence Record</h1>
    <asp:GridView ID="GridViewID" runat="server" AutoGenerateColumns="false" >
        <Columns>
            <asp:BoundField DataField="CheckIN" HeaderText="CheckIN Date" />
            <asp:BoundField DataField="CheckOut" HeaderText="CheckOut Date" />
            <asp:BoundField DataField="CreatedDate" HeaderText="Created Date" />
        </Columns>
    </asp:GridView>
    </div>
</asp:Content>
