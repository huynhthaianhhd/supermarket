<%@ Page Title="" Language="C#" MasterPageFile="~/GuestMasterPage.Master" AutoEventWireup="true" CodeBehind="PasswordRecovery.aspx.cs" Inherits="_1685009.PasswordRecovery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
                <li><a href="Default.aspx"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
                <li class="active">Password Recovery</li>
            </ol>
        </div>
    </div>
    <!-- //breadcrumbs -->

    <!-- form -->
    <div class="login">
        <div class="container">
            <h2>Recover your password</h2>
            <div class="login-form-grids animated wow slideInUp" data-wow-delay=".5s">
                <asp:PasswordRecovery ID="PasswordRecoveryMember" runat="server" ClientIDMode="Static"></asp:PasswordRecovery>
            </div>
        </div>
    </div>
</asp:Content>
