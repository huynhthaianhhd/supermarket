<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Detail.ascx.cs" Inherits="_1685009.WebUC.Detail" %>

<div class="products">
    <div class="container">
        <div class="agileinfo_single">

            <asp:SqlDataSource ID="ProductSqlDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [Id], [Name], [Price], [OldPrice], [Description], [ImagePath], [AverageRating] FROM [Product] WHERE ([Id] = @Id)">
                <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="Id" DefaultValue="1" Name="Id" Type="Int32"></asp:QueryStringParameter>
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:FormView ID="FormViewProduct" runat="server" DataKeyNames="Id" DataSourceID="ProductSqlDataSource" OnItemCommand="FormViewProduct_ItemCommand">
                <ItemTemplate>
                    <div class="col-md-4 agileinfo_single_left">
                        <img id="example" src='<%# "images/" + Eval("ImagePath") %>' alt=" " class="img-responsive">
                    </div>
                    <div class="col-md-8 agileinfo_single_right">
                        <h2><%# Eval("Name") %></h2>
                        <div class="rating1">
                            <span class="starRating">
                                <input id="rating5" type="radio" name="rating" value="5" <%# isChecked(5, Eval("AverageRating")) %>>
                                <label for="rating5">5</label>
                                <input id="rating4" type="radio" name="rating" value="4" <%# isChecked(4, Eval("AverageRating")) %>>
                                <label for="rating4">4</label>
                                <input id="rating3" type="radio" name="rating" value="3" <%# isChecked(3, Eval("AverageRating")) %>>
                                <label for="rating3">3</label>
                                <input id="rating2" type="radio" name="rating" value="2" <%# isChecked(2, Eval("AverageRating")) %>>
                                <label for="rating2">2</label>
                                <input id="rating1" type="radio" name="rating" value="1" <%# isChecked(1, Eval("AverageRating")) %>>
                                <label for="rating1">1</label>
                            </span>
                        &nbsp;&nbsp;</div>
                        <div class="w3agile_description">
                            <h4>Description :</h4>
                            <p><%# Eval("Description") %></p>
                        </div>
                        <div class="snipcart-item block">
                            <div class="snipcart-thumb agileinfo_single_right_snipcart">
                                <h4 class="m-sing">$<%# Eval("Price") %><span>$<%# Eval("OldPrice") %></span></h4>
                            </div>
                            <div class="snipcart-details agileinfo_single_right_details">
                                <asp:Button ID="ButtonAddToCart" runat="server" Text="Add To Cart" ValidationGroup="detail"
                                    CssClass="button" CommandName="AddToCart" CommandArgument='<%# Eval("Id") %>'/>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </ItemTemplate>
            </asp:FormView>
                
        </div>
    </div>
</div>