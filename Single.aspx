<%@ Page Title="" Language="C#" MasterPageFile="~/GuestMasterPage.Master" AutoEventWireup="true" CodeBehind="Single.aspx.cs" Inherits="_1685009.Single" %>

<%@ Register Src="~/WebUC/NewOffers.ascx" TagPrefix="uc1" TagName="NewOffers" %>
<%@ Register Src="~/WebUC/Detail.ascx" TagPrefix="uc1" TagName="Detail" %>
<%@ Register Src="~/WebUC/Reviews.ascx" TagPrefix="uc1" TagName="Reviews" %>
<%@ Register Src="~/WebUC/RecentViewedProducts.ascx" TagPrefix="uc1" TagName="RecentViewedProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <link href="css/reviews.css" rel="stylesheet" />
    <link href="css/carousel.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
                <li><a href="Default.aspx"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
                <li class="active">Singlepage</li>
            </ol>
        </div>
    </div>
    <!-- //breadcrumbs -->

    <uc1:Detail runat="server" id="Detail" />

    <uc1:Reviews runat="server" id="Reviews" />

    <uc1:RecentViewedProducts runat="server" id="RecentViewedProducts" />

    <uc1:NewOffers runat="server" ID="NewOffers" />
</asp:Content>
