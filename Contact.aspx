<%@ Page Title="" Language="C#" MasterPageFile="~/GuestMasterPage.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="_1685009.Contact" %>

<%@ Register Src="~/WebUC/Contacts.ascx" TagPrefix="uc1" TagName="Contacts" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
                <li><a href="Default.aspx"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
                <li class="active">Contact</li>
            </ol>
        </div>
    </div>
    <!-- //breadcrumbs -->
    
    <uc1:Contacts runat="server" id="Contacts" />
</asp:Content>
