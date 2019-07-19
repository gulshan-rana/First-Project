<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="UserAttendece.aspx.cs" Inherits="NPRoject1.UserAttendece" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div>
        <asp:Label ID="lblSearchTo" runat="server" Text="Search TO"></asp:Label>
        <input id="ISearchTo" type="date" runat="server" />
        <asp:Label ID="lblFrom" runat="server" Text="FRom"></asp:Label>
         <input id="ISearchFrom" type="date" runat="server" />
        <asp:Button ID="btnSearch" runat="server" Text=" Search " OnClick="btnSearch_Click" />
    </div>
    <br />
    <div>
        <asp:Button ID="IDCheckIN" runat="server" Text="CheckIn" OnClick="IDCheckIN_Click" />
   
        <asp:Button ID="IDCheckOut" runat="server" Text="CheckOut" OnClick="IDCheckOut_Click" />

    </div>
    <br />
    <div>
        <asp:Label ID="lblMessage" runat="server" ForeColor="SteelBlue" Font-Bold="true" ></asp:Label>
    </div>
        
    

   <h1>Attendence Record</h1>
    <asp:GridView ID="GridViewID" runat="server" AutoGenerateColumns="false" >
        <Columns>
            <asp:BoundField DataField="CheckIN" HeaderText="CheckIN Date" />
            <asp:BoundField DataField="CheckOut" HeaderText="CheckOut Date" />
            <asp:BoundField DataField="CreatedDate" HeaderText="Created Date" />
        </Columns>
    </asp:GridView>
</asp:Content>
