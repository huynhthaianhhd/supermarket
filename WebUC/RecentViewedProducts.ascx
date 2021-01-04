<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RecentViewedProducts.ascx.cs" Inherits="_1685009.WebUC.RecentViewedProducts" %>

<div class="container" style="margin: 20px auto;">
    <h2>Recently Reviewed Products</h2>

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div id="Carousel" class="carousel slide">
                    <div class="carousel-inner">
                        <asp:ListView ID="ListViewProducts" runat="server" GroupItemCount="4"
                            GroupPlaceholderID="GroupPlaceHolder" ItemPlaceholderID="ProductPlaceHolder" OnItemCommand="ListViewProducts_ItemCommand">
                            <ItemTemplate>
                                <div class="col-md-3">
                                    <div class="product">
                                        <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl='<%# "~/images/" + Eval("ImagePath") %>' NavigateUrl='<%# "~/Single.aspx?Id=" + Eval("Id") %>'></asp:HyperLink>
                                        <p><%# Eval("Name") %></p>
                                        <h4>$<%# Eval("Price") %> <span>$<%# Eval("OldPrice") %></span></h4>
                                        <div class="snipcart-details top_brand_home_details">
                                            <asp:Button ID="ButtonAddToCart" runat="server" Text="Add To Cart" CssClass="button"
                                                ValidationGroup="RecentlyReviewProducts" CommandName="AddToCart" CommandArgument='<%# Eval("Id") %>'/>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                            <GroupTemplate>
                                <div class="item">
                                    <div class="row">
                                        <asp:PlaceHolder ID="ProductPlaceHolder" runat="server"></asp:PlaceHolder>
                                    </div>
                                </div>
                            </GroupTemplate>
                            <LayoutTemplate>
                                <asp:PlaceHolder ID="GroupPlaceHolder" runat="server"></asp:PlaceHolder>
                            </LayoutTemplate>
                        </asp:ListView>
                    </div>

                    <a data-slide="prev" href="#Carousel" class="left carousel-control">‹</a>
                    <a data-slide="next" href="#Carousel" class="right carousel-control">›</a>
                </div>
            </div>
        </div>
    </div>
    <!--.container-->

    <script>
        // Init carousel
        $('#Carousel').find('.item:first').addClass('active');
    </script>
</div>
