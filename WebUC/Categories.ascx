<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Categories.ascx.cs" Inherits="_1685009.WebUC.Categories" %>

<div class="categories">
    <h2>Categories</h2>
    <ul class="cate">
        <asp:SqlDataSource ID="MainMenuDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [Id], [Name] FROM [Category] WHERE ([ParentId] IS NULL) ORDER BY [Order]"></asp:SqlDataSource>
        <asp:Repeater ID="MainMenuRepeater" runat="server" DataSourceID="MainMenuDataSource">
            <ItemTemplate>
                <li>
                    <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl='<%# "~/Products.aspx?CatId=" + Eval("Id") %>'><i class="fa fa-arrow-right" aria-hidden="true"></i><%# Eval("Name") %></a></asp:LinkButton>
                </li>
                <ul>
                    <asp:HiddenField ID="ParentIdHiddenField" runat="server" value='<%# Eval("Id") %>'/>
                    <asp:SqlDataSource ID="SubMenuDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [Id], [Name] FROM [Category] WHERE ([ParentId] = @ParentId) ORDER BY [Order]">
                        <SelectParameters>
                            <asp:ControlParameter Name="ParentId" ControlID="ParentIdHiddenField" PropertyName="value" DbType="Int16"/>
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:Repeater ID="SubMenuRepeater" runat="server" DataSourceID="SubMenuDataSource">
                        <ItemTemplate>
                            <li>
                                <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl='<%# "~/Products.aspx?CatId=" + Eval("Id") %>'><i class="fa fa-arrow-right" aria-hidden="true"></i><%# Eval("Name") %></a></asp:LinkButton>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
</div>
