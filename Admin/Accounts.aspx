<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Accounts.aspx.cs" Inherits="_1685009.Admin.Accounts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">Accounts</h4>
            </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                <ol class="breadcrumb">
                    <li><a href="#">Dashboard</a></li>
                    <li class="active">Accounts Management</li>
                </ol>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /row -->
        <div class="row">
            <div class="col-sm-12">
                <div class="white-box">
                    <h3 class="box-title">Accounts</h3>

                    <div id="table-users" class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Username</th>
                                    <th>Email</th>
                                    <th>Last Login</th>
                                    <th>Disable</th>
                                    <th>Role</th>
                                    <th>Delete</th>
                                </tr>
                            </thead>
                            <tbody>

                                <asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' 
                                    SelectCommand="SELECT [UserId], [Email], [IsLockedOut], [LastLoginDate], [CreateDate], [UserName] FROM [vw_aspnet_MembershipUsers]"></asp:SqlDataSource>
                                <asp:ListView ID="ListViewUsers" runat="server" DataSourceID="SqlDataSourceUsers" OnItemCommand="ListViewUsers_ItemCommand">
                                    <ItemTemplate>
                                        <tr>
                                            <td class="text-center"><%# (Container.DataItemIndex + 1) %></td>
                                            <td><%# Eval("UserName") %></td>
                                            <td><%# Eval("Email") %></td>
                                            <td><%# Eval("LastLoginDate") %></td>
                                            <td class="text-center">
                                                <asp:LinkButton ID="LinkButtonEnable" runat="server" Visible='<%# !IsCurrentUser(Eval("UserId").ToString()) && (bool)Eval("IsLockedOut") %>' CommandName="UnlockUser" CommandArgument='<%# Eval("UserId") %>' CssClass="btn btn-xs btn-primary"><i class="fa fa-unlock" aria-hidden="true"></i> Enable</asp:LinkButton>
                                                <asp:LinkButton ID="LinkButtonDisable" runat="server" Visible='<%# !IsCurrentUser(Eval("UserId").ToString()) && !(bool)Eval("IsLockedOut") %>' CommandName="LockUser" CommandArgument='<%# Eval("UserId") %>' CssClass="btn btn-xs btn-danger" OnClientClick="return confirm('Are you sure to disable this user?');"><i class="fa fa-lock" aria-hidden="true"></i> Disable</asp:LinkButton>
                                            </td>
                                            <td class="text-center">
                                                <asp:LinkButton ID="LinkButtonMakeAdmin" runat="server" Visible='<%# !IsCurrentUser(Eval("UserId").ToString()) && !IsAdmin(Eval("UserName").ToString()) %>' CommandName="MakeAdmin" CommandArgument='<%# Eval("UserId") %>' CssClass="btn btn-xs btn-primary"><i class="fa fa-user" aria-hidden="true"></i> Make Admin</asp:LinkButton>
                                                <asp:LinkButton ID="LinkButtonRemoveAdmin" runat="server" Visible='<%# !IsCurrentUser(Eval("UserId").ToString()) && IsAdmin(Eval("UserName").ToString()) %>' CommandName="RemoveAdmin" CommandArgument='<%# Eval("UserId") %>' CssClass="btn btn-xs btn-danger" OnClientClick="return confirm('Are you sure to remove admin role from this user?');"><i class="fa fa-remove" aria-hidden="true"></i> Remove Admin</asp:LinkButton>
                                            </td>
                                            <td class="text-center">
                                                <asp:LinkButton ID="LinkButtonDelete" runat="server" Visible='<%# !IsCurrentUser(Eval("UserId").ToString()) %>' CommandName="DeleteUser" CommandArgument='<%# Eval("UserId") %>' CssClass="btn btn-xs btn-danger" OnClientClick="return confirm('Are you sure to delete this user?');"><i class="fa fa-trash" aria-hidden="true"></i></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>

                            </tbody>
                        </table>

                        <nav class="numbering">
                            <asp:DataPager ID="DataPagerUsers" runat="server" PagedControlID="ListViewUsers" PageSize="5" ClientIDMode="Static"
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
