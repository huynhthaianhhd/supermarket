<%@ Page Title="" Language="C#" MasterPageFile="~/GuestMasterPage.Master" AutoEventWireup="true" CodeBehind="Offers.aspx.cs" Inherits="_1685009.Offers" %>

<%@ Register Src="~/WebUC/TopOffers.ascx" TagPrefix="uc1" TagName="TopOffers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
                <li><a href="Default.aspx"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
                <li class="active">Offers</li>
            </ol>
        </div>
    </div>
    <!-- //breadcrumbs -->
    
    <uc1:TopOffers runat="server" ID="TopOffers" />
</asp:Content>
