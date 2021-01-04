<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewOffers.ascx.cs" Inherits="_1685009.WebUC.NewOffers" %>

<!-- new -->
<asp:SqlDataSource ID="OfferProductsSqlDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT TOP 4 [Id], [Name], [Price], [OldPrice], [AverageRating], [ImagePath] FROM [Product] WHERE GETDATE() BETWEEN [StartOfferDatetime] AND [EndOfferDatetime] ORDER BY [StartOfferDatetime] DESC"></asp:SqlDataSource>
<asp:ListView ID="OfferProductsListView" runat="server" DataSourceID="OfferProductsSqlDataSource" GroupPlaceholderID="GroupPlaceHolder" ItemPlaceholderID="ProductPlaceHolder" GroupItemCount="4">
    <ItemTemplate>
        <div class="col-md-3 top_brand_left-1">
            <div class="hover14 column">
                <div class="agile_top_brand_left_grid">
                    <div class="agile_top_brand_left_grid_pos">
                        <img src="images/offer.png" alt=" " class="img-responsive">
                    </div>
                    <div class="agile_top_brand_left_grid1">
                        <figure>
                            <div class="snipcart-item block">
                                <div class="snipcart-thumb">
                                    <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl='<%# "~/images/" + Eval("ImagePath") %>' NavigateUrl='<%# "~/Single.aspx?Id=" + Eval("Id") %>' />
                                    <p><%# Eval("Name") %></p>
                                    <div class="stars">
                                        <i class="fa fa-star blue-star" aria-hidden="true"></i>
                                        <i class="fa fa-star blue-star" aria-hidden="true"></i>
                                        <i class="fa fa-star blue-star" aria-hidden="true"></i>
                                        <i class="fa fa-star blue-star" aria-hidden="true"></i>
                                        <i class="fa fa-star gray-star" aria-hidden="true"></i>
                                    </div>
                                    <h4>$<%# Eval("Price") %> <span>$<%# Eval("OldPrice") %></span></h4>
                                </div>
                                <div class="snipcart-details top_brand_home_details">
                                    <form action="#" method="post">
                                        <fieldset>
                                            <input type="hidden" name="cmd" value="_cart">
                                            <input type="hidden" name="add" value="1">
                                            <input type="hidden" name="business" value=" ">
                                            <input type="hidden" name="item_name" value="Fortune Sunflower Oil">
                                            <input type="hidden" name="amount" value="35.99">
                                            <input type="hidden" name="discount_amount" value="1.00">
                                            <input type="hidden" name="currency_code" value="USD">
                                            <input type="hidden" name="return" value=" ">
                                            <input type="hidden" name="cancel_return" value=" ">
                                            <input type="submit" name="submit" value="Add to cart" class="button">
                                        </fieldset>
                                    </form>
                                </div>
                            </div>
                        </figure>
                    </div>
                </div>
            </div>
        </div>
    </ItemTemplate>
    <GroupTemplate>
        <div class="agile_top_brands_grids">
            <asp:PlaceHolder ID="ProductPlaceHolder" runat="server"></asp:PlaceHolder>
        </div>
    </GroupTemplate>
    <LayoutTemplate>
        <div class="newproducts-w3agile">
            <div class="container">
                <h3>New offers</h3>
                <asp:PlaceHolder ID="GroupPlaceHolder" runat="server"></asp:PlaceHolder>
                <div class="clearfix"></div>
            </div>
        </div>
    </LayoutTemplate>
</asp:ListView>
<!-- //new -->
