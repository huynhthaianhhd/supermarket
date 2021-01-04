<%@ Page Title="" Language="C#" MasterPageFile="~/GuestMasterPage.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="_1685009.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <ol class="breadcrumb breadcrumb1">
                <li><a href="Default.aspx"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
                <li class="active">Checkout Page</li>
            </ol>
        </div>
    </div>
    <!-- //breadcrumbs -->
    <!-- checkout -->
    <div class="checkout">
        <div class="container">
            <h2>Your shopping cart contains: <span><asp:Label ID="LabelItemCount" runat="server" Text=""></asp:Label> Products</span></h2>
            <div class="checkout-right">
                <table class="timetable_sub cart_items">
                    <thead>
                        <tr>
                            <th>SL No.</th>
                            <th>Product Image</th>
                            <th>Product Name</th>
                            <th>Quality</th>
                            <th>Unit Price</th>
                            <th>Total Price</th>
                            <th>Action</th>
                        </tr>
                    </thead>

                    <asp:Repeater ID="RepeaterCartItems" runat="server" OnItemCommand="RepeaterCartItems_ItemCommand">
                        <ItemTemplate>
                            <tr class="rem1">
                        <td class="invert"><%# Container.ItemIndex + 1 %></td>
                        <td class="invert-image">
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/Single.aspx?Id=" + Eval("ProductId") %>'><asp:Image ID="ImageProduct" runat="server" ImageUrl='<%# "~/images/" + Eval("ImagePath") %>' alt=" " CssClass="img-responsive"/></asp:HyperLink>
                        </td>
                        <td class="invert"><asp:Label ID="LabelProductName" runat="server" Text='<%# Eval("Name") %>'></asp:Label></td>
                        <td class="invert">
                            <div class="quantity">
                                <div class="quantity-select">
                                    <div class="entry value-minus">&nbsp;</div>
                                    <div class="entry value">
                                        <asp:TextBox ID="TextBoxQuantity" runat="server" Text='<%# Eval("Quantity") %>' TextMode="Number"></asp:TextBox>
                                    </div>
                                    <div class="entry value-plus active">&nbsp;</div>
                                </div>
                            </div>
                        </td>
                        <td class="invert">$<asp:Label ID="LabelUnitPrice" runat="server" Text='<%# Eval("UnitPrice") %>'></asp:Label></td>
                        <td class="invert">$<asp:Label ID="LabelTotalPrice" runat="server" Text='<%# Eval("TotalPrice") %>'></asp:Label></td>
                        <td class="invert">
                            <asp:LinkButton ID="LinkButtonUpdate" runat="server" CssClass="btn btn_update_quantity"
                                CommandName="UpdateQuantity" CommandArgument='<%# Eval("ProductId") %>'>
                                <i class="fa fa-refresh" aria-hidden="true"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="LinkButtonRemove" runat="server" CssClass="btn btn_remove_item"
                                CommandName="RemoveItem" CommandArgument='<%# Eval("ProductId") %>'
                                OnClientClick="return confirm('Do you really want to remove this item?')">
                                <i class="fa fa-remove" aria-hidden="true"></i>
                            </asp:LinkButton>
                        </td>
                    </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>

                <!--quantity-->
                <script>
                    $('.value-plus').on('click', function () {
                        var inputQty = $(this).parent().find('.value').find('input')[0];
                        var newVal = parseInt(inputQty.value, 10) + 1;
                        inputQty.value = newVal;
                    });

                    $('.value-minus').on('click', function () {
                        var inputQty = $(this).parent().find('.value').find('input')[0];
                        var newVal = parseInt(inputQty.value, 10) - 1;
                        if (newVal >= 1) inputQty.value = newVal;
                    });
                </script>
                <!--quantity-->
            </div>
            <div class="checkout-left">
                <% if (canCheckout() == true) { %>
                    <div class="checkout-left-basket">
                        <asp:Button ID="ButtonCheckout" runat="server" Text="Checkout" OnClick="ButtonCheckout_Click" CssClass="btn btn-primary" style="padding: 10px; width: 283px"/>
                        <ul>
                            <li>Total <span>$<asp:Label ID="LabelTotalCost" runat="server" Text=""></asp:Label></span></li>
                        </ul>
                    </div>
                <% } %>
                <div class="checkout-right-basket">
                    <a href="Products.aspx"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>Continue Shopping</a>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <!-- //checkout -->
</asp:Content>
