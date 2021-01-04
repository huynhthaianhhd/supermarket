<%@ Page Title="" Language="C#" MasterPageFile="~/GuestMasterPage.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="_1685009.Member.Checkout" %>

<%@ Register Src="~/WebUC/MemberCheckout.ascx" TagPrefix="uc1" TagName="MemberCheckout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:MemberCheckout runat="server" id="MemberCheckout" />
</asp:Content>
