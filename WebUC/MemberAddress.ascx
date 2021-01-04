<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MemberAddress.ascx.cs" Inherits="_1685009.WebUC.MemberAddress" %>

<asp:HiddenField ID="HiddenFieldUserId" runat="server" />
<asp:SqlDataSource ID="SqlDataSourceUserAddress" runat="server" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' 
    OldValuesParameterFormatString="original_{0}" 
    SelectCommand="SELECT * FROM [UserAddress] WHERE ([UserId] = @UserId)" 
    UpdateCommand="UPDATE [UserAddress] SET [Fullname] = @Fullname, [PhoneNumber] = @PhoneNumber, [ShippingAddress] = @ShippingAddress, [ShippingCity] = @ShippingCity, [ImagePath] = @ImagePath WHERE [UserId] = @original_UserId AND (([Fullname] = @original_Fullname) OR ([Fullname] IS NULL AND @original_Fullname IS NULL)) AND (([PhoneNumber] = @original_PhoneNumber) OR ([PhoneNumber] IS NULL AND @original_PhoneNumber IS NULL)) AND (([ShippingAddress] = @original_ShippingAddress) OR ([ShippingAddress] IS NULL AND @original_ShippingAddress IS NULL)) AND (([ShippingCity] = @original_ShippingCity) OR ([ShippingCity] IS NULL AND @original_ShippingCity IS NULL)) AND (([ImagePath] = @original_ImagePath) OR ([ImagePath] IS NULL AND @original_ImagePath IS NULL))">
    <SelectParameters>
        <asp:ControlParameter ControlID="HiddenFieldUserId" PropertyName="Value" Name="UserId" Type="String"></asp:ControlParameter>
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="Fullname" Type="String"></asp:Parameter>
        <asp:Parameter Name="PhoneNumber" Type="String"></asp:Parameter>
        <asp:Parameter Name="ShippingAddress" Type="String"></asp:Parameter>
        <asp:Parameter Name="ShippingCity" Type="String"></asp:Parameter>
        <asp:Parameter Name="ImagePath" Type="String"></asp:Parameter>
        <asp:Parameter Name="original_UserId" Type="Object"></asp:Parameter>
        <asp:Parameter Name="original_Fullname" Type="String"></asp:Parameter>
        <asp:Parameter Name="original_PhoneNumber" Type="String"></asp:Parameter>
        <asp:Parameter Name="original_ShippingAddress" Type="String"></asp:Parameter>
        <asp:Parameter Name="original_ShippingCity" Type="String"></asp:Parameter>
        <asp:Parameter Name="original_ImagePath" Type="String"></asp:Parameter>
    </UpdateParameters>
</asp:SqlDataSource>

<asp:FormView ID="FormViewUserAddress" runat="server" DataKeyNames="UserId" DataSourceID="SqlDataSourceUserAddress" OnItemUpdated="FormViewUserAddress_ItemUpdated" ClientIDMode="Static" CssClass="col-sm-12 col-md-12">
    <ItemTemplate>
        <fieldset>
            <legend>Your shipping address</legend>

            <div class="form-group clearfix">
                <label class="col-sm-12 col-md-12 col-lg-3">Full Name</label>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Fullname") %>' CssClass="col-sm-12 col-md-12 col-lg-4" />
            </div>
            
            <div class="form-group clearfix">
                <label class="col-sm-12 col-md-12 col-lg-3">Phone Number</label>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("PhoneNumber") %>' CssClass="col-sm-12 col-md-12 col-lg-4" />
            </div>

            <div class="form-group clearfix">
                <label class="col-sm-12 col-md-12 col-lg-3">Shipping Address</label>
                <asp:Label ID="Label3" runat="server" Text='<%# Bind("ShippingAddress") %>' CssClass="col-sm-12 col-md-12 col-lg-4" />
            </div>

            <div class="form-group clearfix">
                <label class="col-sm-12 col-md-12 col-lg-3">Shipping City</label>
                <asp:Label ID="Label4" runat="server" Text='<%# Bind("ShippingCity") %>' CssClass="col-sm-12 col-md-12 col-lg-4" />
            </div>

            <div class="form-group clearfix text-center">
                <asp:Button ID="ButtonEdit" runat="server" Text="Edit" CommandName="Edit" CssClass="btn btn-sm btn-success"/>
            </div>
        </fieldset>
    </ItemTemplate>
    <EditItemTemplate>
        <fieldset>
            <legend>Update your shipping address</legend>

            <div class="form-group clearfix">
                <label class="col-md-4 control-label" for="textinput">Full Name</label>
                <div class="col-md-4">
                    <asp:TextBox ID="FullnameTextBox" runat="server" Text='<%# Bind("Fullname") %>' CssClass="form-control input-md"></asp:TextBox>
                </div>
            </div>

            <div class="form-group clearfix">
                <label class="col-md-4 control-label" for="textinput">Phone Number</label>
                <div class="col-md-4">
                    <asp:TextBox ID="PhoneNumberTextBox" runat="server" Text='<%# Bind("PhoneNumber") %>' CssClass="form-control input-md"></asp:TextBox>
                </div>
            </div>

            <div class="form-group clearfix">
                <label class="col-md-4 control-label" for="textinput">Shipping Address</label>
                <div class="col-md-4">
                    <asp:TextBox ID="ShippingAddressTextBox" runat="server" Text='<%# Bind("ShippingAddress") %>' CssClass="form-control input-md"></asp:TextBox>
                </div>
            </div

            <div class="form-group clearfix">
                <label class="col-md-4 control-label" for="textinput">Shipping City</label>
                <div class="col-md-4">
                    <asp:TextBox ID="ShippingCityTextBox" runat="server" Text='<%# Bind("ShippingCity") %>' CssClass="form-control input-md"></asp:TextBox>
                </div>
            </div>

            <div class="form-group action clearfix text-center col-md-12">
                <asp:Button ID="ButtonUpdate" runat="server" Text="Update" CommandName="Update" CssClass="btn btn-sm btn-success"/>
                <asp:Button ID="ButtonCancel" runat="server" Text="Cancel" CommandName="Cancel" CssClass="btn btn-sm"/>
            </div>
        </fieldset>
    </EditItemTemplate>
</asp:FormView>