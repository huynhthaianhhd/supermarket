<%@ Page Title="" Language="C#" MasterPageFile="~/Member/MemberMasterPage.master" AutoEventWireup="true" CodeBehind="MyOrders.aspx.cs" Inherits="_1685009.Member.MyOrders" %>

<%@ Register Src="~/WebUC/MemberOrders.ascx" TagPrefix="uc1" TagName="MemberOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MemberContent" runat="server">
    <uc1:MemberOrders runat="server" id="MemberOrders" />
</asp:Content>
