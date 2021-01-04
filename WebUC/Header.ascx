<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="_1685009.WebUC.Header" %>

<!-- header -->
<div class="agileits_header">
    <div class="container">
        <div class="w3l_offers">
            <p>SALE UP TO 70% OFF. USE CODE "SALE70%" . <a href="Products.aspx">SHOP NOW</a></p>
        </div>
        <div class="agile-login">
            <ul>
                <asp:LoginView ID="LoginViewHeader" runat="server">
                    <AnonymousTemplate>
                        <li><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Register.aspx">Create Account</asp:HyperLink></li>
                        <li><asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Login.aspx">Login</asp:HyperLink></li>
                    </AnonymousTemplate>
                    <LoggedInTemplate>
                        <li>
                            <asp:HyperLink ID="HyperLinkAdmin" runat="server" NavigateUrl="~/Admin/Default.aspx">Administration</asp:HyperLink>
                        </li>

                        <li>
                            <div id="dropdown-menu-user" class="btn-group">
                                <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                    <asp:LoginName ID="LoginName1" runat="server" />
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                    <li>
                                        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Member/Account.aspx">My Account</asp:HyperLink>
                                    </li>
                                    <li>
                                        <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/Member/MyOrders.aspx">My Orders</asp:HyperLink>
                                    </li>
                                    <li>
                                        <asp:LoginStatus ID="LoginStatus1" runat="server" />
                                    </li>
                                </ul>
                            </div>
                        </li>
                     </LoggedInTemplate>
                </asp:LoginView>
                
                <li><asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Contact.aspx">Help</asp:HyperLink></li>
            </ul>
        </div>
        <div class="product_list_header">
            <asp:LinkButton ID="LinkButtonViewCart" runat="server" PostBackUrl="~/Cart.aspx" ClientIDMode="Static" ValidationGroup="header" CssClass="w3view-cart">
                <i class="fa fa-cart-arrow-down" aria-hidden="true"></i>
                <span style="background-color: red" class="badge badge-notify my-cart-badge">
                    <asp:Label ID="LabelItemCount" runat="server" Text=""></asp:Label> 
                </span>
            </asp:LinkButton>
        </div>
        <div class="clearfix"></div>
    </div>
</div>

<div class="logo_products">
    <div class="container">
        <div class="w3ls_logo_products_left1">
            <ul class="phone_email">
                <li><i class="fa fa-phone" aria-hidden="true"></i>Order online or call us : (+0123) 234 567</li>

            </ul>
        </div>
        <div class="w3ls_logo_products_left">
            <h1><a href="Default.aspx">super Market</a></h1>
        </div>
        <div class="w3l_search">
            <asp:TextBox ID="TextBoxKeyword" runat="server" TextMode="Search" AutoPostBack="true" ClientIDMode="Static" ValidationGroup="search" placeholder="Search for a Product..." OnTextChanged="TextBoxKeyword_TextChanged"></asp:TextBox>
            <asp:LinkButton ID="LinkButtonSearch" runat="server" ClientIDMode="Static" ValidationGroup="search" CssClass="btn btn-default search" aria-label="Left Align" OnClick="LinkButtonSearch_Click">
                <i class="fa fa-search" aria-hidden="true"></i>
            </asp:LinkButton>
            <div class="clearfix"></div>
        </div>

        <div class="clearfix"></div>
    </div>
</div>
<!-- //header -->
