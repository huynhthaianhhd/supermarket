<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Contacts.ascx.cs" Inherits="_1685009.WebUC.Contacts" %>

<%@ Register Assembly="BotDetect" Namespace="BotDetect.Web.UI" TagPrefix="BotDetect" %>

<!-- contact -->
<div class="about">
    <div class="w3_agileits_contact_grids">
        <div class="col-md-6 w3_agileits_contact_grid_left">
            <div class="agile_map">
                <div id="googleMap" style="width: 100%; height: 580px;"></div>
            </div>
            <div class="agileits_w3layouts_map_pos">
                <div class="agileits_w3layouts_map_pos1">
                    <h3>Contact Info</h3>
                    <p>1234k Avenue, 4th block, New York City.</p>
                    <ul class="wthree_contact_info_address">
                        <li><i class="fa fa-envelope" aria-hidden="true"></i><a href="mailto:info@example.com">info@example.com</a></li>
                        <li><i class="fa fa-phone" aria-hidden="true"></i>+(0123) 232 232</li>
                    </ul>
                    <div class="w3_agile_social_icons w3_agile_social_icons_contact">
                        <ul>
                            <li><a href="#" class="icon icon-cube agile_facebook"></a></li>
                            <li><a href="#" class="icon icon-cube agile_rss"></a></li>
                            <li><a href="#" class="icon icon-cube agile_t"></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6 w3_agileits_contact_grid_right">
            <h2 class="w3_agile_header">Leave a<span> Message</span></h2>

            <span class="input input--ichiro">
                <asp:TextBox ID="TextBoxName" runat="server" ClientIDMode="Static" class="input__field input__field--ichiro" type="text" name="Name" placeholder=" " required=""></asp:TextBox>
                <label class="input__label input__label--ichiro" for="TextBoxName">
                    <span class="input__label-content input__label-content--ichiro">Your Name</span>
                </label>
            </span>
            <span class="input input--ichiro">
                <asp:TextBox ID="TextBoxEmail" runat="server" ClientIDMode="Static" class="input__field input__field--ichiro" type="email" name="Email" placeholder=" " required=""></asp:TextBox>
                <label class="input__label input__label--ichiro" for="TextBoxEmail">
                    <span class="input__label-content input__label-content--ichiro">Your Email</span>
                </label>
            </span>

            <asp:TextBox ID="TextBoxMessage" runat="server" ClientIDMode="Static" name="Message" placeholder="Your message here..." required="" TextMode="MultiLine"></asp:TextBox>

            <asp:Label ID="CaptchaLabel" runat="server" AssociatedControlID="CaptchaCode">
              Retype the characters from the picture:
            </asp:Label>
            <BotDetect:WebFormsCaptcha ID="ExampleCaptcha" runat="server" />
            <asp:TextBox ID="CaptchaCode" runat="server" />
            <asp:Label ID="CaptchaErrorLabel" runat="server"/>

            <asp:Label ID="LabelMessage" runat="server" Text="" ClientIDMode="Static"></asp:Label>

            <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" onclick="ButtonSubmit_Click"/>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!-- contact -->

<script>
    function myMap() {
        var mapProp = {
            center: new google.maps.LatLng(10.763135, 106.6842177),
            zoom: 17,
        };

        var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);

        var marker = new google.maps.Marker({position: new google.maps.LatLng(10.7628612, 106.68260280000004)});
        marker.setMap(map);
    }
</script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBeyZIqaAUeXn2DghMoBO22TnBcBNSpeno&callback=myMap"></script>