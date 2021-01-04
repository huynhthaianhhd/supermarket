<%@ Page Title="" Language="C#" MasterPageFile="~/GuestMasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="_1685009.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
                <li><a href="Default.aspx"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
                <li class="active">Login Page</li>
            </ol>
        </div>
    </div>
    <!-- //breadcrumbs -->
    <!-- login -->
    <div class="login">
        <div class="container">
            <h2>Login Form</h2>
            <div class="login-form-grids animated wow slideInUp" data-wow-delay=".5s">
                <asp:LoginView ID="LoginView1" runat="server">
                    <AnonymousTemplate>
                        <asp:Login ID="LoginMember" runat="server" ClientIDMode="Static">
                            <LayoutTemplate>           
                                <asp:TextBox ID="UserName" runat="server" placeholder="Username" required=" "></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
             
                                <asp:TextBox ID="Password" runat="server" TextMode="Password" placeholder="Password" required=" "></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                            
                                <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                        
                                <div class="forgot">
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/PasswordRecovery.aspx">Forgot Password?</asp:HyperLink>
                                </div>

                                <br />

                                <div class="text-danger">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                </div>
                                
                                <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1" />
                            </LayoutTemplate>
                        </asp:Login>

                        <h4>For New People</h4>
                        <p><a href="Register.aspx">Register Here</a> (Or) go back to <a href="Default.aspx">Home<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></a></p>
                    </AnonymousTemplate>
                    <LoggedInTemplate>
                        <h4>Welcome <asp:LoginName ID="LoginName1" runat="server" /></h4>
                        <p>
                            You have logged in! Please click <a href="Default.aspx">Here</a> to go home.
                        </p>
                    </LoggedInTemplate>
                </asp:LoginView>
            </div>
        </div>
    </div>
    <!-- //login -->
</asp:Content>
