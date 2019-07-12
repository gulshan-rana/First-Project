<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="LogInFirst.aspx.cs" Inherits="NPRoject1.LogInFirst" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<h1> Welcome <asp:Label ID="lblFirstName" runat="server" Text="Label"></asp:Label></h1>
    


    <div class="row">
        <div class="col-md-3">
            <asp:Button ID="btnAttendence" CssClass="btn btn-primary" runat="server" OnClick="btnAttendence_Click" Text="Attendence" />
        </div>
        <div class="col-md-3">
            <asp:Button ID="btnProfile" CssClass="btn btn-success" runat="server" OnClick="btnProfile_Click" Text="My Profile" />
        </div>
          <div class="col-md-6">
         
        </div>
        </div>





</asp:Content>
