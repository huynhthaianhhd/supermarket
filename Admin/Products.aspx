<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="_1685009.Admin.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">Products</h4>
            </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                <ol class="breadcrumb">
                    <li><a href="#">Dashboard</a></li>
                    <li class="active">Products Management</li>
                </ol>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /row -->
        <div class="row">
            <div class="col-sm-12">
                <div class="white-box">
                    <h3 class="box-title">
                        Products
                        <asp:Button ID="ButtonAddProduct" runat="server" Text="Add New Product" OnClick="ButtonAddProduct_Click" CssClass="btn btn-sm btn-primary pull-right"/>
                    </h3>

                    <div id="table-users" class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Product Name</th>
                                    <th>Price</th>
                                    <th>Summary</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                                </tr>
                            </thead>
                            <tbody>

                                <asp:SqlDataSource ID="SqlDataSourceProducts" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>'
                                    SelectCommand="SELECT [Id], [Name], [Price], [Summary] FROM [Product] ORDER BY [Name]"></asp:SqlDataSource>
                                <asp:ListView ID="ListViewProducts" runat="server" DataSourceID="SqlDataSourceProducts" OnItemCommand="ListViewProducts_ItemCommand">
                                    <ItemTemplate>
                                        <tr>
                                            <td class="text-center"><%# (Container.DataItemIndex + 1) %></td>
                                            <td><%# Eval("Name") %></td>
                                            <td class="text-right"><%# ToCurrency(Eval("Price")) %></td>
                                            <td><%# Eval("Summary") %></td>
                                            <td class="text-center">
                                                <asp:LinkButton ID="LinkButtonEdit" runat="server" PostBackUrl='<%# "~/Admin/ProductForm.aspx?Id=" + Eval("Id") %>'><i class="fa fa-pencil" aria-hidden="true"></i></asp:LinkButton>
                                            </td>
                                            <td class="text-center">
                                                <asp:LinkButton ID="LinkButtonDelete" runat="server" CommandName="DeleteProduct" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-xs btn-danger" OnClientClick="return confirm('Are you sure to delete this product?');"><i class="fa fa-trash" aria-hidden="true"></i></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>

                            </tbody>
                        </table>

                        <nav class="numbering">
                            <asp:DataPager ID="DataPagerProducts" runat="server" PagedControlID="ListViewProducts" PageSize="5" ClientIDMode="Static"
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
