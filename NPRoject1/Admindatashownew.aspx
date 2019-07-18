<%@ Page Title="" Language="C#" MasterPageFile="~/Amin.Master" AutoEventWireup="true" CodeBehind="Admindatashownew.aspx.cs" Inherits="NPRoject1.Admindatashownew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:GridView ID="GridviewID" runat="server" DataKeyNames="UserID" AutoGenerateColumns="false" >
            <Columns>
                <asp:BoundField DataField="CheckIN" HeaderText="CheckIN" />
                <asp:BoundField DataField="CheckOut" HeaderText="CheckOut" />
                <asp:CommandField ButtonType="Link" ShowDeleteButton="true" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
