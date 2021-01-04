<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ProductForm.aspx.cs" Inherits="_1685009.Admin.ProductForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <script>
        function ValidateDatetime(e, args) {
            args.IsValid = false;

            if (new Date(args.Value) != 'Invalid Date') {
                args.IsValid = true;
            }
        }

        function ValidateFileUpload(e, args) {
            args.IsValid = true;

            if (HiddenFieldCurrentImage.value == "" && FileUploadImage.value == "") {
                args.IsValid = false;
            }
        }
    </script>
    
    <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">Product</h4>
            </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                <ol class="breadcrumb">
                    <li><a href="#">Dashboard</a></li>
                    <li class="active">Product</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->
        <!-- .row -->
        <div class="row">
            <asp:HiddenField ID="HiddenFieldId" runat="server" />

            <div class="col-md-4 col-xs-12">
                <div class="white-box">
                    <div class="row text-center">
                        <asp:HiddenField ID="HiddenFieldCurrentImage" runat="server" ClientIDMode="Static"/>
                        <asp:Image ID="ImageProduct" runat="server" CssClass="visible-lg-inline img-responsive"/>
                    </div>
                    <br />
                    <div class="row text-bold">Upload new image</div>
                    <div class="row">
                        <asp:FileUpload ID="FileUploadImage" runat="server" ClientIDMode="Static" CausesValidation="true"/>
                        <asp:CustomValidator ID="CustomValidatorFileUploadImage" runat="server" ControlToValidate="FileUploadImage" ValidateEmptyText="true" ErrorMessage="Product Image is required!" CssClass="error" Display="Dynamic" ClientValidationFunction="ValidateFileUpload"></asp:CustomValidator>
                    </div>
                </div>
            </div>
            <div class="col-md-8 col-xs-12">
                <div class="white-box">
                    <div class="form-horizontal form-material">
                        <div class="form-group">
                            <label class="col-md-12">Name</label>
                            <div class="col-md-12">
                                <asp:TextBox ID="TextBoxName" runat="server" CssClass="form-control form-control-line"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorTextBoxName" runat="server" ControlToValidate="TextBoxName" ErrorMessage="Product Name is required!" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="example-email" class="col-md-12">Category</label>
                            <div class="col-md-12">
                                <asp:SqlDataSource ID="SqlDataSourceCategory" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [Id], [Name] FROM [Category]"></asp:SqlDataSource>
                                <asp:DropDownList ID="DropDownListCategory" runat="server" DataSourceID="SqlDataSourceCategory" DataTextField="Name" DataValueField="Id" CssClass="form-control form-control-line"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-12">Brand</label>
                            <div class="col-md-12">
                                <asp:SqlDataSource ID="SqlDataSourceBrand" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [Id], [Name] FROM [Brand]"></asp:SqlDataSource>
                                <asp:DropDownList ID="DropDownListBrand" runat="server" DataSourceID="SqlDataSourceBrand" DataTextField="Name" DataValueField="Id" CssClass="form-control form-control-line"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-12">Summary</label>
                            <div class="col-md-12">
                                <asp:TextBox ID="TextBoxSummary" runat="server" CssClass="form-control form-control-line"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-12">Description</label>
                            <div class="col-md-12">
                                <asp:TextBox ID="TextBoxDescription" runat="server" TextMode="MultiLine" CssClass="form-control form-control-line"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorTextBoxDescription" runat="server" ControlToValidate="TextBoxDescription" ErrorMessage="Product Description is required!" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-12">Price</label>
                            <div class="col-md-12">
                                <asp:TextBox ID="TextBoxPrice" runat="server" CssClass="form-control form-control-line"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorTextBoxPrice" runat="server" ControlToValidate="TextBoxPrice" ErrorMessage="Product Price is required!" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidatorTextBoxPrice" runat="server" ControlToValidate="TextBoxPrice" Type="Double" MinimumValue="0" ErrorMessage="Product Price must be a double value and min is 0!" CssClass="error" Display="Dynamic"></asp:RangeValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-12">Old Price</label>
                            <div class="col-md-12">
                                <asp:TextBox ID="TextBoxOldPrice" runat="server" CssClass="form-control form-control-line"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorTextBoxOldPrice" runat="server" ControlToValidate="TextBoxOldPrice" ErrorMessage="Product Old Price is required!" CssClass="error" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidatorTextBoxOldPrice" runat="server" ControlToValidate="TextBoxOldPrice" Type="Double" MinimumValue="0" ErrorMessage="Product Old Price must be a double value and min is 0!" CssClass="error" Display="Dynamic"></asp:RangeValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-12">Start Offer Datetime</label>
                            <div class="col-md-12">
                                <asp:TextBox ID="TextBoxStartOfferDatetime" runat="server" TextMode="DateTime" CssClass="form-control form-control-line"></asp:TextBox>
                                <asp:CustomValidator ID="CustomValidatorTextBoxStartOfferDatetime" runat="server" ControlToValidate="TextBoxStartOfferDatetime" ClientValidationFunction="ValidateDatetime" ErrorMessage="Date time format should be YYYY-MM-DD HH:MM:SS" CssClass="error" Display="Dynamic"></asp:CustomValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-12">End Offer Datetime</label>
                            <div class="col-md-12">
                                <asp:TextBox ID="TextBoxEndOfferDatetime" runat="server" TextMode="DateTime" CssClass="form-control form-control-line"></asp:TextBox>
                                <asp:CustomValidator ID="CustomValidatorTextBoxEndOfferDatetime" runat="server" ControlToValidate="TextBoxEndOfferDatetime" ClientValidationFunction="ValidateDatetime" ErrorMessage="Date time format should be YYYY-MM-DD HH:MM:SS" CssClass="error" Display="Dynamic"></asp:CustomValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <asp:Button ID="ButtonSave" runat="server" Text="" OnClick="ButtonSave_Click" CssClass="btn btn-success"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.row -->
    </div>
</asp:Content>
