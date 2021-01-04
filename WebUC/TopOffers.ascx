<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TopOffers.ascx.cs" Inherits="_1685009.WebUC.TopOffers" %>

<!-- top-brands -->
<div class="top-brands">
    <div class="container">
        <h2>Top selling offers</h2>
        <div class="grid_3 grid_5">
            <div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
                <ul id="myTab" class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#expeditions" id="expeditions-tab" role="tab" data-toggle="tab" aria-controls="expeditions" aria-expanded="true">Advertised offers</a></li>
                    <li role="presentation"><a href="#tours" role="tab" id="tours-tab" data-toggle="tab" aria-controls="tours">Today Offers</a></li>
                </ul>

                <div id="myTabContent" class="tab-content">
                    <div role="tabpanel" class="tab-pane fade in active" id="expeditions" aria-labelledby="expeditions-tab">
                        <div class="agile-tp">
                            <h5>Advertised this week</h5>
                            <p class="w3l-ad">We've pulled together all our advertised offers into one place, so you won't miss out on a great deal.</p>
                        </div>

                        <asp:SqlDataSource ID="AllOfferProductsSqlDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [Id], [Name], [Price], [OldPrice], [AverageRating], [ImagePath] FROM [Product] WHERE GETDATE() BETWEEN [StartOfferDatetime] AND [EndOfferDatetime] ORDER BY [StartOfferDatetime] DESC"></asp:SqlDataSource>
                        <asp:ListView ID="AllOfferProductsListView" runat="server" DataSourceID="AllOfferProductsSqlDataSource" GroupPlaceholderID="GroupPlaceHolder" ItemPlaceholderID="ProductPlaceHolder" GroupItemCount="3">
                            <ItemTemplate>
                                <div class="col-md-4 top_brand_left">
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

                                    <div class="clearfix"></div>
                                </div>
                            </GroupTemplate>
                            <LayoutTemplate>
                                <asp:PlaceHolder ID="GroupPlaceHolder" runat="server"></asp:PlaceHolder>
                            </LayoutTemplate>
                        </asp:ListView>
                    </div>

                    <div role="tabpanel" class="tab-pane fade" id="tours" aria-labelledby="tours-tab">
                        <div class="agile-tp">
                            <h5>This week</h5>
                            <p class="w3l-ad">We've pulled together all our advertised offers into one place, so you won't miss out on a great deal.</p>
                        </div>
                        
                        <asp:SqlDataSource ID="TodayOfferProductsSqlDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [Id], [Name], [Price], [OldPrice], [AverageRating], [ImagePath] FROM [Product] WHERE CONVERT(char(10), GetDate(), 126) = CONVERT(char(10), [EndOfferDatetime], 126) ORDER BY [StartOfferDatetime] DESC"></asp:SqlDataSource>
                        <asp:ListView ID="TodayOfferProductsListView" runat="server" DataSourceID="TodayOfferProductsSqlDataSource" GroupPlaceholderID="GroupPlaceHolder" ItemPlaceholderID="ProductPlaceHolder" GroupItemCount="3">
                            <ItemTemplate>
                                <div class="col-md-4 top_brand_left">
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
                                    
                                    <div class="clearfix"></div>
                                </div>
                            </GroupTemplate>
                            <LayoutTemplate>
                                <asp:PlaceHolder ID="GroupPlaceHolder" runat="server"></asp:PlaceHolder>
                            </LayoutTemplate>
                        </asp:ListView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- //top-brands -->
