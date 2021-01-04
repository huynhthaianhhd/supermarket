<%@ Page Title="" Language="C#" MasterPageFile="~/GuestMasterPage.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="_1685009.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
                <li><a href="Default.aspx"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
                <li class="active">Register Page</li>
            </ol>
        </div>
    </div>
    <!-- //breadcrumbs -->
    <!-- register -->
    <div class="register">
        <div class="container">
            <h2>Register Here</h2>
            <div class="login-form-grids">
               
                <asp:CreateUserWizard ID="CreateUserWizardMember" runat="server" ClientIDMode="Static" OnCreatedUser="CreateUserWizardMember_CreatedUser">
                    <WizardSteps>
                        <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                            <ContentTemplate>
                                <h5>Profile information</h5>
                                <asp:TextBox ID="FullName" runat="server" placeholder="Full Name..." required=" "></asp:TextBox>
                                <asp:TextBox ID="Email" runat="server" TextMode="Email" Visible="true" placeholder="Email Address" required=" "></asp:TextBox>

                                <h6>Login information</h6>
                                <asp:TextBox ID="UserName" runat="server" placeholder="Username" required=" "></asp:TextBox>
                                <asp:TextBox ID="Password" runat="server" TextMode="Password" placeholder="Password" required=" "></asp:TextBox>
                                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" placeholder="Password Confirmation" required=" "></asp:TextBox>

                                <h6>Login information</h6>
                                <asp:DropDownList ID="Question" runat="server" style="width: 100%; display: block">
                                    <asp:ListItem>What is your favorite colors?</asp:ListItem>
                                    <asp:ListItem>What is your father's nickname?</asp:ListItem>
                                </asp:DropDownList>
                                <br />
                                <asp:TextBox ID="Answer" runat="server" placeholder="Security Answer" required=" "></asp:TextBox>

                                <div class="register-check-box">
                                    <div class="check">
                                        <label class="checkbox">
                                            <input type="checkbox" id="agreement" name="agreement" required=" "><i> </i>I accept the terms and conditions</label>
                                    </div>
                                </div>

                                <br />

                                <div class="text-danger">
                                    <asp:CompareValidator ID="CompareValidatorPassword" runat="server" ErrorMessage="The password and confirmation password must match."
                                        ControlToValidate="Password" ControlToCompare="ConfirmPassword" Display="Dynamic" ValidationGroup="CreateUserWizard1">
                                    </asp:CompareValidator>
                                    <asp:Literal ID="ErrorMessage" runat="server"></asp:Literal>
                                </div>
                                <asp:Button ID="StepNextButton" runat="server" Text="Register" CommandName="MoveNext" ValidationGroup="CreateUserWizard1" OnClientClick="return checkForm();"/>
                            </ContentTemplate>

                            <CustomNavigationTemplate>

                            </CustomNavigationTemplate>
                        </asp:CreateUserWizardStep>

                        <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                            <ContentTemplate>
                                <h4>Your account has been created.</h4>
                            </ContentTemplate>
                        </asp:CompleteWizardStep>
                    </WizardSteps>
                </asp:CreateUserWizard>

            </div>
            <div class="register-home">
                <a href="Default.aspx">Home</a>
            </div>
        </div>
    </div>
    <!-- //register -->

    <script>
        function checkForm() {
            if ($('#agreement').is(':checked')) {
                return true;
            }
            else {
                alert('Please accept our terms and conditions!');
                return false;
            }
        }
    </script>
</asp:Content>
