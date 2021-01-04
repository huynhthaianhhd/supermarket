<%@ Page Title="" Language="C#" MasterPageFile="~/Member/MemberMasterPage.master" AutoEventWireup="true" CodeBehind="MyAddress.aspx.cs" Inherits="_1685009.Member.MyAddress" %>

<%@ Register Src="~/WebUC/MemberAddress.ascx" TagPrefix="uc1" TagName="MemberAddress" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MemberContent" runat="server">
    <uc1:MemberAddress runat="server" id="MemberAddress" />
</asp:Content>
