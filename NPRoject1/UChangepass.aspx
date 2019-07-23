<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="UChangepass.aspx.cs" Inherits="NPRoject1.UChangepass" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
    <div>
        <asp:Label ID="lblOldPass" runat="server" Text="Old Password"></asp:Label>
        <asp:TextBox ID="textboxOldPass" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rrOldPass" ValidationGroup="Button" ControlToValidate="textboxOldPass" runat="server" ErrorMessage="Old Password is Required" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
    <br />
    <div>
        <asp:Label ID="lblNewPass" runat="server" Text="New Password"></asp:Label>
        <asp:TextBox ID="textboxNewPass" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rrNewPass" ValidationGroup="Button" ControlToValidate="textboxNewPass" runat="server" ErrorMessage="New Password is Required" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>

    <br />
    <div>
        <asp:Label ID="lblConPass" runat="server" Text="Confirm Password"></asp:Label>
        <asp:TextBox ID="textboxConPass" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rrConPass" ValidationGroup="Button" ControlToValidate="textboxConPass" runat="server" ErrorMessage="Confirm Password is Required" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="cvConPass" ControlToValidate="textboxConPass" ValidationGroup="Button" ControlToCompare="textboxNewPass" ErrorMessage="New Password and ConFirm Password not matched" runat="server" ForeColor="Red"></asp:CompareValidator>
        </div>
        <br />
    <div>
        <asp:Button ID="btnChangePass" runat="server" ValidationGroup="Button" OnClick="btnChangePass_Click" Text="Change Password" />
        <asp:Label ID="lbMsg" runat="server"></asp:Label>
    </div>
        </div>
</asp:Content>
