<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Reviews.ascx.cs" Inherits="_1685009.WebUC.Reviews" %>

<div class="container">
    <h2>Review</h2>

    <asp:LoginView ID="LoginViewReview" runat="server">
        <AnonymousTemplate>
            <div>Please login to write your comment</div>
        </AnonymousTemplate>
        <LoggedInTemplate>
            <!-- Multiple Radios (inline) -->
            <div class="form-group clearfix">
                <label class="col-md-4 control-label text-right" for="radios">Rating</label>
                <div class="col-md-4">
                    <div class="rating1">
                        <asp:RadioButtonList ID="RadioButtonListRating" runat="server" CssClass="starRating"
                            EnableTheming="false" RepeatDirection="Horizontal" RepeatLayout="Flow">
                            <asp:ListItem Text="5" Value="5" Selected="True" />
                            <asp:ListItem Text="4" Value="4" />
                            <asp:ListItem Text="3" Value="3" />
                            <asp:ListItem Text="2" Value="2" />
                            <asp:ListItem Text="1" Value="1" />
                        </asp:RadioButtonList>
                    </div>
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group clearfix">
                <label class="col-md-4 control-label text-right" for="textinput">Subject</label>
                <div class="col-md-5">
                    <asp:TextBox ID="TextBoxSubject" runat="server" placeholder="Your subject" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorSubject" runat="server" ControlToValidate="TextBoxSubject" ErrorMessage="Subject is required" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>
            </div>

            <!-- Textarea -->
            <div class="form-group clearfix">
                <label class="col-md-4 control-label text-right" for="Comment">Comment</label>
                <div class="col-md-4">
                    <asp:TextBox ID="TextBoxComment" runat="server" TextMode="MultiLine" placeholder="Your comment" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorComment" runat="server" ControlToValidate="TextBoxComment" ErrorMessage="Comment is required" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>
            </div>

            <!-- Button -->
            <div class="form-group clearfix">
                <label class="col-md-4 control-label" for="Send"></label>
                <div class="col-md-4">
                    <asp:Button ID="ButtonSend" runat="server" Text="Send" CssClass="btn btn-primary" OnClick="ButtonSend_Click" />
                </div>
            </div>
        </LoggedInTemplate>
    </asp:LoginView>

    <div class="row">
        <div class="col-md-8">
            <h2 class="page-header">Comments</h2>
            <section class="comment-list">
                <asp:SqlDataSource ID="SqlDataSourceReviews" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Review] WHERE (([ProductId] = @ProductId) AND ([Approved] = @Approved))">
                    <SelectParameters>
                        <asp:QueryStringParameter QueryStringField="Id" Name="ProductId" Type="Int32"></asp:QueryStringParameter>
                        <asp:Parameter DefaultValue="True" Name="Approved" Type="Boolean"></asp:Parameter>
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:Repeater ID="RepeaterReviews" runat="server" DataSourceID="SqlDataSourceReviews">
                    <ItemTemplate>
                        <article class="row">
                            <div class="col-md-2 col-sm-2 hidden-xs">
                                <figure class="thumbnail">
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# getImagePath(Eval("Username")) %>' CssClass="img-responsive" />
                                    <figcaption class="text-center"></figcaption>
                                </figure>
                            </div>
                            <div class="col-md-10 col-sm-10">
                                <div class="panel panel-default arrow left">
                                    <div class="panel-body">
                                        <header>
                                            <div class="row">
                                                <div class="comment-user col-md-6"><i class="fa fa-user"></i>&nbsp;<%# Eval("Username") %></div>
                                                <div class="col-md-6 text-right">
                                                    <time class="comment-date" datetime="<%# Eval("PostedDatetime") %>"><i class="fa fa-clock-o"></i>&nbsp;<%# Eval("PostedDatetime") %></time>
                                                </div>
                                            </div>
                                        </header>
                                        <div class="row subject">
                                            <div class="col-md-8">
                                                <h4><%# Eval("Subject") %></h4>
                                            </div>
                                            <div class="col-md-4 text-right">
                                                <div class="rating">
                                                    <span class="starRating">
                                                        <input id="rating-5<%# Container.ItemIndex %>" type="radio" name="comment-rating<%# Container.ItemIndex %>" value="5" <%# isChecked(5, Eval("Rating")) %>>
                                                        <label for="rating-5<%# Container.ItemIndex %>">5</label>
                                                        <input id="rating-4<%# Container.ItemIndex %>" type="radio" name="comment-rating<%# Container.ItemIndex %>" value="4" <%# isChecked(4, Eval("Rating")) %>>
                                                        <label for="rating-4<%# Container.ItemIndex %>">4</label>
                                                        <input id="rating-3<%# Container.ItemIndex %>" type="radio" name="comment-rating<%# Container.ItemIndex %>" value="3" <%# isChecked(3, Eval("Rating")) %>>
                                                        <label for="rating-3<%# Container.ItemIndex %>">3</label>
                                                        <input id="rating-2<%# Container.ItemIndex %>" type="radio" name="comment-rating<%# Container.ItemIndex %>" value="2" <%# isChecked(2, Eval("Rating")) %>>
                                                        <label for="rating-2<%# Container.ItemIndex %>">2</label>
                                                        <input id="rating-1<%# Container.ItemIndex %>" type="radio" name="comment-rating<%# Container.ItemIndex %>" value="1" <%# isChecked(1, Eval("Rating")) %>>
                                                        <label for="rating-1<%# Container.ItemIndex %>">1</label>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="comment-post">
                                            <p><%# Eval("Comment") %></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </article>
                    </ItemTemplate>
                </asp:Repeater>
            </section>
        </div>
    </div>
</div>

<br />
