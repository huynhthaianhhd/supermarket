<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Navigation.ascx.cs" Inherits="_1685009.WebUC.Navigation" %>

<!-- navigation -->
<div class="navigation-agileits">
    <div class="container">
        <nav class="navbar navbar-default">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header nav_2">
                <button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
                <ul class="nav navbar-nav">
                    <li class="active">
                        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Default.aspx" CssClass="act">Home</asp:HyperLink>
                    </li>

                    <!-- Mega Menu -->
                    <asp:SqlDataSource ID="MainMenuDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [Id], [Name] FROM [Category] WHERE ([ParentId] IS NULL) ORDER BY [Order]"></asp:SqlDataSource>
                    <asp:Repeater ID="MainMenuRepeater" runat="server" DataSourceID="MainMenuDataSource">
                        <ItemTemplate>
                            <li class="dropdown">
                                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="dropdown-toggle" data-toggle="dropdown"><%# Eval("Name") %><b class="caret"></b></asp:LinkButton>
                                <ul class="dropdown-menu multi-column columns-3">
                                    <div class="row">
                                        <div class="multi-gd-img">
                                            <ul class="multi-column-dropdown">
                                                <h6>
                                                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "~/Products.aspx?CatId=" + Eval("Id") %>'>All <%# Eval("Name") %></asp:HyperLink>
                                                </h6>

                                                <asp:HiddenField ID="ParentIdHiddenField" runat="server" value='<%# Eval("Id") %>'/>
                                                <asp:SqlDataSource ID="SubMenuDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [Id], [Name] FROM [Category] WHERE ([ParentId] = @ParentId) ORDER BY [Order]">
                                                    <SelectParameters>
                                                        <asp:ControlParameter Name="ParentId" ControlID="ParentIdHiddenField" PropertyName="value" DbType="Int16"/>
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                                <asp:Repeater ID="SubMenuRepeater" runat="server" DataSourceID="SubMenuDataSource">
                                                    <ItemTemplate>
                                                        <li>
                                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/Products.aspx?CatId=" + Eval("Id") %>'><%# Eval("Name") %></asp:HyperLink>
                                                        </li>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ul>
                                        </div>

                                    </div>
                                </ul>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                    <!-- /Mega Menu -->
                    
                    <li><a href="Offers.aspx">Offers</a></li>
                    <li><a href="Contact.aspx">Contact</a></li>
                </ul>
            </div>
        </nav>
    </div>
</div>
<!-- //navigation -->
