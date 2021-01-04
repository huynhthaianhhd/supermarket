<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdminTopNav.ascx.cs" Inherits="_1685009.WebUC.AdminTopNav" %>

<nav class="navbar navbar-default navbar-static-top m-b-0">
    <div class="navbar-header">
        <div class="top-left-part">
            <!-- Logo -->
            <a class="logo" href="Default.aspx">
                <!-- Logo icon image, you can use font-icon also -->
                <b>
                    <!--This is dark logo icon-->
                    <img src="../plugins/images/admin-logo.png" alt="home" class="dark-logo" /><!--This is light logo icon--><img src="../plugins/images/admin-logo-dark.png" alt="home" class="light-logo" />
                </b>
                <!-- Logo text image you can use text also -->
                <span class="hidden-xs">
                    <!--This is dark logo text-->
                    <img src="../plugins/images/admin-text.png" alt="home" class="dark-logo" /><!--This is light logo text--><img src="../plugins/images/admin-text-dark.png" alt="home" class="light-logo" />
                </span></a>
        </div>
        <!-- /Logo -->
        <ul class="nav navbar-top-links navbar-right pull-right">
            <li>
                <a href="../Default.aspx">&laquo; Back to Website</a>
            </li>
            <li>
                <asp:HyperLink ID="HyperLinkProfile" runat="server" CssClass="profile-pic">
                    <asp:Image ID="ImageAvatar" runat="server" CssClass="img-circle" alt="user-img" width="36"/>
                    <b class="hidden-xs"><asp:Label ID="LabelUserFullName" runat="server" Text="Label"></asp:Label></b>
                </asp:HyperLink>
            </li>
        </ul>
    </div>
    <!-- /.navbar-header -->
    <!-- /.navbar-top-links -->
    <!-- /.navbar-static-side -->
</nav>