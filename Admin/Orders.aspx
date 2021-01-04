<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="_1685009.Admin.Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">Orders</h4>
            </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                <ol class="breadcrumb">
                    <li><a href="#">Dashboard</a></li>
                    <li class="active">Orders Management</li>
                </ol>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /row -->
        <div class="row">
            <div class="col-sm-12">
                <div class="white-box">
                    <h3 class="box-title">Orders</h3>

                    <div id="table-orders" class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Order ID</th>
                                    <th>Customer</th>
                                    <th>Order Datetime</th>
                                    <th>Total Cost</th>
                                    <th>View Details</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>

                                <asp:SqlDataSource ID="SqlDataSourceOrders" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' 
                                    SelectCommand="SELECT O.Id, U.UserName, O.OrderDatetime, O.OrderTotal, S.Name AS Status FROM [Order] AS O
                                        INNER JOIN [aspnet_Users] AS U ON (O.UserId = U.UserId)
                                        INNER JOIN [OrderStatus] AS S ON (O.StatusId = S.Id)
                                        ORDER BY O.OrderDatetime DESC">
                                </asp:SqlDataSource>
                                <asp:ListView ID="ListViewOrders" runat="server" DataSourceID="SqlDataSourceOrders">
                                    <ItemTemplate>
                                        <tr>
                                            <td class="text-center"><%# (Container.DataItemIndex + 1) %></td>
                                            <td class="text-center"><%# Eval("Id") %></td>
                                            <td><%# Eval("UserName") %></td>
                                            <td><%# Eval("OrderDatetime") %></td>
                                            <td class="text-right text-bold"><%# ToCurrency(Eval("OrderTotal")) %></td>
                                            <td class="text-center">
                                                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse<%# Container.DataItemIndex %>" aria-expanded="true" aria-controls="collapse<%# Container.DataItemIndex %>"><i class="fa fa-eye" aria-hidden="true"></i></a>
                                            </td>
                                            <td class="text-center">
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-xs <%# GetStatusClass(Eval("Status")) %>"><%# Eval("Status") %></button>
                                                    <button type="button" class="btn btn-xs <%# GetStatusClass(Eval("Status")) %> dropdown-toggle" data-toggle="dropdown">
                                                        <span class="caret"></span>
                                                    </button>
                                                    <ul class="dropdown-menu" role="menu">
                                                        <asp:SqlDataSource ID="DataSourceOrderStatuses" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT S.[Id] AS StatusId, S.[Name] AS StatusName FROM [OrderStatus] S"></asp:SqlDataSource>
                                                        <asp:Repeater ID="RepeaterOrderStatuses" runat="server" DataSourceID="DataSourceOrderStatuses" OnItemCommand="RepeaterOrderStatuses_ItemCommand">
                                                            <ItemTemplate>
                                                                <li>
                                                                    <asp:LinkButton ID="LinkButtonStatus" runat="server" CommandName="UpdateStatus" CommandArgument='<%# DataBinder.Eval(Container.Parent.Parent, "DataItem.Id") + "|" + Eval("StatusId") %>'><%# Eval("StatusName") %></asp:LinkButton>
                                                                </li>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="7" class="padding-fix text-center">
                                                <div id="collapse<%# Container.DataItemIndex %>" class="order-details panel-collapse collapse out" role="tabpanel" aria-labelledby="heading<%# Container.DataItemIndex %>">
                                                    <div class="panel-body">
                                                        <asp:HiddenField ID="HiddenFieldOrderId" runat="server" Value='<%# Eval("Id") %>' />

                                                        <div class="items">
                                                            <div>
                                                                <table class="table table-striped">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>No.</th>
                                                                            <th>Product</th>
                                                                            <th>Unit Price</th>
                                                                            <th>Quantity</th>
                                                                            <th>Total Price</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <asp:SqlDataSource ID="SqlDataSourceOrderDetail" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT p.[Id], p.[Name], d.[UnitPrice], d.[Quantity], d.[TotalPrice] FROM [OrderDetail] d, [Product] p WHERE (d.[OrderId] = @OrderId AND d.[ProductId] = p.[Id])">
                                                                            <SelectParameters>
                                                                                <asp:ControlParameter ControlID="HiddenFieldOrderId" PropertyName="Value" Name="OrderId" Type="Int32"></asp:ControlParameter>
                                                                            </SelectParameters>
                                                                        </asp:SqlDataSource>
                                                                        <asp:Repeater ID="RepeaterOrderDetail" runat="server" DataSourceID="SqlDataSourceOrderDetail">
                                                                            <ItemTemplate>
                                                                                <tr>
                                                                                    <td class="text-center"><%# Container.ItemIndex + 1 %></td>
                                                                                    <td>
                                                                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/Single.aspx?Id=" + Eval("Id") %>'><%# Eval("Name") %></asp:HyperLink>
                                                                                    </td>
                                                                                    <td class="text-right"><%# ToCurrency(Eval("UnitPrice")) %></td>
                                                                                    <td class="text-center"><%# Eval("Quantity") %></td>
                                                                                    <td class="text-right text-bold"><%# ToCurrency(Eval("TotalPrice")) %></td>
                                                                                </tr>
                                                                            </ItemTemplate>
                                                                        </asp:Repeater>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>

                            </tbody>
                        </table>

                        <nav class="numbering">
                            <asp:DataPager ID="DataPagerOrders" runat="server" PagedControlID="ListViewOrders" PageSize="5" ClientIDMode="Static"
                                class="pagination btn-group">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Link" RenderNonBreakingSpacesBetweenControls="false" ButtonCssClass="btn"
                                        ShowFirstPageButton="true" ShowPreviousPageButton="true" FirstPageText="&lt;&lt;" PreviousPageText="&lt;"
                                        ShowNextPageButton="false" ShowLastPageButton="false" />
                                    <asp:NumericPagerField ButtonType="Link" ButtonCount="5" RenderNonBreakingSpacesBetweenControls="false"
                                        NumericButtonCssClass="btn" CurrentPageLabelCssClass="btn active" />
                                    <asp:NextPreviousPagerField ButtonType="Link" RenderNonBreakingSpacesBetweenControls="false" ButtonCssClass="btn"
                                        ShowFirstPageButton="false" ShowPreviousPageButton="false"
                                        ShowNextPageButton="true" ShowLastPageButton="true" NextPageText="&gt;" LastPageText="&gt;&gt;" />
                                </Fields>
                            </asp:DataPager>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.row -->
    </div>
</asp:Content>
