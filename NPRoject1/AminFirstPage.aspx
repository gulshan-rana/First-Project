<%@ Page Title="" Language="C#" MasterPageFile="~/Amin.Master" AutoEventWireup="true" CodeBehind="AminFirstPage.aspx.cs" Inherits="NPRoject1.AminFirstPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 style="text-align:center;">WelCome <asp:Label ID="lblAdmin" runat="server"></asp:Label></h1>
    <div class="row" style="text-align:center;">
        <div class="col-md-12">
            <asp:Button ID="btnUserAtdnce" CssClass="btn btn-primary" runat="server" Text="User Attendence List" />
       
            <asp:Button ID="btnUserList" CssClass="btn btn-success" OnClick="btnUserList_Click" runat="server" Text="User List" />
        </div>
    </div>
   <br/>
    <div class="row" style="text-align:center;">
        <div class="col-md-12">
        <asp:Button ID="AdminProfile" CssClass="btn btn-danger" OnClick="AdminProfile_Click" runat="server" Text="My Profile" />

        </div>
    </div>

</asp:Content>
