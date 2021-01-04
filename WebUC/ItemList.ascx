<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ItemList.ascx.cs" Inherits="_1685009.WebUC.ItemList" %>

<div class="col-md-8 products-right">
    <div class="products-right-grid">
        <div class="products-right-grids">
            <div class="sorting">
                <asp:DropDownList ID="country" runat="server" ClientIDMode="Static" CssClass="frm-field required sect" AutoPostBack="true" OnSelectedIndexChanged="country_SelectedIndexChanged">
                    <asp:ListItem Value="Default">Default sorting</asp:ListItem>
                    <asp:ListItem Value="Popularity">Sort by popularity</asp:ListItem>
                    <asp:ListItem Value="AverageRating">Sort by average rating</asp:ListItem>
                    <asp:ListItem Value="Price">Sort by price</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="sorting-left">
                <asp:DropDownList ID="country1" runat="server" ClientIDMode="Static" CssClass="frm-field required sect" AutoPostBack="true" OnSelectedIndexChanged="country1_SelectedIndexChanged">
                    <asp:ListItem Value="9">Item on page 9</asp:ListItem>
                    <asp:ListItem Value="18">Item on page 18</asp:ListItem>
                    <asp:ListItem Value="32">Item on page 32</asp:ListItem>
                    <asp:ListItem Value="All">All</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>

    <asp:SqlDataSource ID="ProductsDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' 
        SelectCommand="SELECT P.[Id], P.[Name], P.[Price], P.[OldPrice], P.[ImagePath], P.[AverageRating], P.[TotalReviews], P.[EndOfferDatetime], P.[StartOfferDatetime] FROM [Product] P INNER JOIN [Category] C ON (P.[CategoryId] = C.ID) 
        WHERE (P.[Name] LIKE '%' + @Keyword + '%')
        AND (((@CategoryId > 0) AND ((P.[CategoryId] = @CategoryId)) OR (C.[ParentId] = @CategoryId)) OR (@CategoryId = 0))
        ORDER BY PRICE">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="CatId" DefaultValue="0" Name="CategoryId" Type="Int32"></asp:QueryStringParameter>
            <asp:QueryStringParameter QueryStringField="Keyword" DefaultValue="%" Name="Keyword" Type="String"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:ListView ID="ProductsListView" runat="server" DataSourceID="ProductsDataSource" GroupPlaceholderID="GroupPlaceHolder" ItemPlaceholderID="ProductPlaceHolder" GroupItemCount="3" OnItemCommand="ProductsListView_ItemCommand">
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
                                        <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl='<%# "~/images/" + Eval("ImagePath") %>' NavigateUrl='<%# "~/Single.aspx?Id=" + Eval("Id") %>'></asp:HyperLink>
                                        <p><%# Eval("Name") %></p>
                                        <h4>$<%# Eval("Price") %> <span>$<%# Eval("OldPrice") %></span></h4>
                                    </div>
                                    <div class="snipcart-details top_brand_home_details">
                                        <asp:Button ID="ButtonAddToCart" runat="server" Text="Add To Cart" CssClass="button"
                                            CommandName="AddToCart" CommandArgument='<%# Eval("Id") %>'/>
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

    <nav class="numbering">
        <asp:DataPager ID="ProductsDataPager" runat="server" PagedControlID="ProductsListView" PageSize="9" ClientIDMode="Static" 
            class="pagination btn-group">
            <Fields>
                <asp:NextPreviousPagerField ButtonType="Link" RenderNonBreakingSpacesBetweenControls="false" ButtonCssClass="btn"
                    ShowFirstPageButton="true" ShowPreviousPageButton="true" FirstPageText="&lt;&lt;" PreviousPageText="&lt;"
                    ShowNextPageButton="false" ShowLastPageButton="false"/>
                <asp:NumericPagerField ButtonType="Link" ButtonCount="5" RenderNonBreakingSpacesBetweenControls="false" 
                    NumericButtonCssClass="btn" CurrentPageLabelCssClass="btn active"/>
                <asp:NextPreviousPagerField ButtonType="Link" RenderNonBreakingSpacesBetweenControls="false" ButtonCssClass="btn"
                    ShowFirstPageButton="false" ShowPreviousPageButton="false"
                    ShowNextPageButton="true" ShowLastPageButton="true" NextPageText="&gt;" LastPageText="&gt;&gt;"/>
            </Fields>
        </asp:DataPager>
    </nav>
</div>
