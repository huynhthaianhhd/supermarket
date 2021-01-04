<%@ Page Title="" Language="C#" MasterPageFile="~/Member/MemberMasterPage.master" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="_1685009.Member.Account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MemberContent" runat="server">
    <asp:ChangePassword ID="ChangePasswordMember" runat="server" ClientIDMode="Static">
        <ChangePasswordTemplate>
            <fieldset>
                <legend>Change your password</legend>

                <div class="form-group clearfix">
                    <label class="col-md-4 control-label" for="textinput">Current Password</label>
                    <div class="col-md-4">
                        <asp:TextBox runat="server" TextMode="Password" ID="CurrentPassword" CssClass="form-control input-md"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group clearfix">
                    <label class="col-md-4 control-label" for="textinput">New Password</label>
                    <div class="col-md-4">
                        <asp:TextBox runat="server" TextMode="Password" ID="NewPassword" CssClass="form-control input-md"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group clearfix">
                    <label class="col-md-4 control-label" for="textinput">Confirm New Password</label>
                    <div class="col-md-4">
                        <asp:TextBox runat="server" TextMode="Password" ID="ConfirmNewPassword" CssClass="form-control input-md"></asp:TextBox>
                    </div>
                </div>

                <div class="text-danger clearfix">
                    <asp:Literal runat="server" ID="FailureText" EnableViewState="False"></asp:Literal>
                </div>

                <div class="form-group clearfix">
                    <div class="col-md-12">
                        <asp:Button runat="server" CommandName="ChangePassword" Text="Change Password" ValidationGroup="ChangePassword1" ID="ChangePasswordPushButton" CssClass="btn btn-danger btn-sm"></asp:Button>
                    </div>
                </div>

            </fieldset>
        </ChangePasswordTemplate>
        <SuccessTemplate>
            <h4>Your new password has been updated successfully!</h4>
            <p>Click <a href="Account.aspx">here</a> to continue.</p>
        </SuccessTemplate>
    </asp:ChangePassword>
</asp:Content>
