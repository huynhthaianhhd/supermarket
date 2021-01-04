<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProfileSidebar.ascx.cs" Inherits="_1685009.WebUC.ProfileSidebar" %>

<div class="profile-sidebar">
    <!-- SIDEBAR USERPIC -->
    <div class="profile-userpic">
        <asp:Image ID="ImageAvatar" runat="server" CssClass="img-responsive" alt=""/>
    </div>
    <!-- END SIDEBAR USERPIC -->

    <!-- SIDEBAR USER TITLE -->
    <div class="profile-usertitle">
        <div class="profile-usertitle-name">
            <asp:Label ID="LabelUserFullName" runat="server" Text="Label"></asp:Label>
        </div>
        <div class="profile-usertitle-job">

		</div>
    </div>
    <!-- END SIDEBAR USER TITLE -->

    <!-- SIDEBAR BUTTONS -->
	<div class="profile-userbuttons">
        <asp:FileUpload ID="FileUploadAvatar" runat="server" CssClass="btn btn-sm"/>
        <asp:Button ID="ButtonUploadAvatar" runat="server" ClientIDMode="Static" ValidationGroup="UploadAvatar" Text="Upload" OnClick="ButtonUploadAvatar_Click" CssClass="btn btn-sm btn-success"/>
    </div>
    <!-- SIDEBAR BUTTONS -->
                    
    <!-- SIDEBAR MENU -->
    <div class="profile-usermenu">
        <ul class="nav">
            <li class="<%= isActiveTab("MyAccount") ? "active" : "" %>">
                <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Member/Account.aspx"><i class="glyphicon glyphicon-home"></i> Personal</asp:LinkButton>
            </li>
            <li class="<%= isActiveTab("MyAddress") ? "active" : "" %>">
                <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/Member/MyAddress.aspx"><i class="glyphicon glyphicon-user"></i> Delivery Addresses</asp:LinkButton>
            </li>
            <li class="<%= isActiveTab("MyOrders") ? "active" : "" %>">
                <asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="~/Member/MyOrders.aspx"><i class="glyphicon glyphicon-shopping-cart"></i> My Orders</asp:LinkButton>
            </li>
            <li>
                <asp:LinkButton ID="LinkButtonLogout" runat="server" OnClick="LinkButtonLogout_Click"><i class="glyphicon glyphicon-log-out"></i> Logout</asp:LinkButton>
            </li>
        </ul>
    </div>
    <!-- END MENU -->
</div>