<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Reviews.aspx.cs" Inherits="_1685009.Admin.Reviews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">Reviews</h4>
            </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                <ol class="breadcrumb">
                    <li><a href="#">Dashboard</a></li>
                    <li class="active">Reviews Management</li>
                </ol>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /row -->
        <div class="row">
            <div class="col-sm-12">
                <div class="white-box">
                    <h3 class="box-title">Reviews</h3>

                    <div id="table-users" class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Product Name</th>
                                    <th>Username</th>
                                    <th>Rating</th>
                                    <th>Subject</th>
                                    <th>Comment</th>
                                    <th>Datetime</th>
                                    <th>Approve</th>
                                    <th>Delete</th>
                                </tr>
                            </thead>
                            <tbody>

                                <asp:SqlDataSource ID="SqlDataSourceReviews" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' 
                                    SelectCommand="SELECT R.Id, P.Name AS ProductName, R.Username, R.Rating, R.Subject, R.Comment, R.PostedDatetime, R.Approved 
                                        FROM [Review] AS R
                                        INNER JOIN [Product] AS P ON (R.ProductId = P.Id)
                                        ORDER BY R.PostedDatetime DESC">
                                </asp:SqlDataSource>
                                <asp:ListView ID="ListViewReviews" runat="server" DataSourceID="SqlDataSourceReviews" OnItemCommand="ListViewReviews_ItemCommand">
                                    <ItemTemplate>
                                        <tr>
                                            <td class="text-center"><%# (Container.DataItemIndex + 1) %></td>
                                            <td><%# Eval("ProductName") %></td>
                                            <td><%# Eval("UserName") %></td>
                                            <td><%# Eval("Rating") %></td>
                                            <td><%# Eval("Subject") %></td>
                                            <td><%# Eval("Comment") %></td>
                                            <td><%# Eval("PostedDatetime") %></td>
                                            <td class="text-center">
                                                <asp:LinkButton ID="LinkButtonApprove" runat="server" Visible='<%# !(bool)Eval("Approved") %>' CommandName="Approve" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-xs btn-primary"><i class="fa fa-unlock" aria-hidden="true"></i> Approve</asp:LinkButton>
                                                <asp:LinkButton ID="LinkButtonUnapprove" runat="server" Visible='<%# (bool)Eval("Approved") %>' CommandName="Unapprove" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-xs btn-danger"><i class="fa fa-lock" aria-hidden="true"></i> Unpprove</asp:LinkButton>
                                            </td>
                                            <td class="text-center">
                                                <asp:LinkButton ID="LinkButtonDelete" runat="server" CommandName="DeleteReview" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-xs btn-danger" OnClientClick="return confirm('Are you sure to delete this review?');"><i class="fa fa-trash" aria-hidden="true"></i></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>

                            </tbody>
                        </table>

                        <nav class="numbering">
                            <asp:DataPager ID="DataPagerReviews" runat="server" PagedControlID="ListViewReviews" PageSize="5" ClientIDMode="Static"
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
