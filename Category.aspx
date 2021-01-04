<%@ Page Title="" Language="C#" MasterPageFile="~/GuestMasterPage.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="_1685009.Category" %>

<%@ Register Src="~/WebUC/Categories.ascx" TagPrefix="uc1" TagName="Categories" %>
<%@ Register Src="~/WebUC/ItemList.ascx" TagPrefix="uc1" TagName="ItemList" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
                <li><a href="Default.aspx"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
                <li class="active">Products</li>
            </ol>
        </div>
    </div>
    <!-- //breadcrumbs -->
    <!--- products --->
    <div class="products">
        <div class="container">
            <div class="col-md-4 products-left">

                <uc1:Categories runat="server" id="Categories" />

            </div>
            <div class="col-md-8 products-right">

                <uc1:ItemList runat="server" id="ItemList" />

            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <!--- products --->
</asp:Content>
