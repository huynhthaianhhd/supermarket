<%@ Page Title="" Language="C#" MasterPageFile="~/GuestMasterPage.Master" AutoEventWireup="true" CodeBehind="Succeed.aspx.cs" Inherits="_1685009.Member.Succeed" %>

<%@ Register Src="~/WebUC/MemberSucceed.ascx" TagPrefix="uc1" TagName="MemberSucceed" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:MemberSucceed runat="server" id="MemberSucceed" />
</asp:Content>
