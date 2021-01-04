<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdminSidebar.ascx.cs" Inherits="_1685009.WebUC.AdminSidebar" %>

<div class="navbar-default sidebar" role="navigation">
    <div class="sidebar-nav slimscrollsidebar">
        <div class="sidebar-head">
            <h3><span class="fa-fw open-close"><i class="ti-close ti-menu"></i></span><span class="hide-menu">Navigation</span></h3>
        </div>
        <ul class="nav" id="side-menu">
            <li style="padding: 70px 0 0;">
                <a href="Default.aspx" class="waves-effect"><i class="fa fa-clock-o fa-fw" aria-hidden="true"></i>Dashboard</a>
            </li>
            <li>
                <a href="Accounts.aspx" class="waves-effect"><i class="fa fa-group fa-fw" aria-hidden="true"></i>Accounts</a>
            </li>
            <li>
                <a href="Products.aspx" class="waves-effect"><i class="fa fa-shopping-bag fa-fw" aria-hidden="true"></i>Products</a>
            </li>
            <li>
                <a href="Reviews.aspx" class="waves-effect"><i class="fa fa-comments fa-fw" aria-hidden="true"></i>Reviews</a>
            </li>
            <li>
                <a href="Orders.aspx" class="waves-effect"><i class="fa fa-shopping-cart fa-fw" aria-hidden="true"></i>Orders</a>
            </li>
            <li>
                <a href="../Default.aspx" class="waves-effect"><i class="fa fa-globe fa-fw" aria-hidden="true"></i>Website</a>
            </li>
            <li>
                <asp:LinkButton ID="LinkButtonLogout" runat="server" CssClass="waves-effect" OnClick="LinkButtonLogout_Click"><i class="fa fa-sign-out fa-fw" aria-hidden="true"></i>Logout</asp:LinkButton>
            </li>
        </ul>
    </div>
</div>
