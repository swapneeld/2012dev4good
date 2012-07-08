<%@ Import Namespace="_2012dev4good.Models" %>

<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<_2012dev4good.Models.CreativeDetailsViewModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Past..
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id="logo">
            <a href="Index"><img src="../../Content/my_book.png" /></a>
        </div>
        <div id="main">
    <script type="text/javascript">
        $(window).ready(function () {
            $('#book').turn({
                display: 'double',
                acceleration: true,
                gradients: !$.isTouch,
                elevation: 50,
                when: {
                    turned: function (e, page) {
                        /*console.log('Current view: ', $(this).turn('view'));*/
                    }
                }
            });
        });

    </script>
    <h2>Story Book</h2>
    <script type="text/javascript" src="//platform.twitter.com/widgets.js">
    </script>
    <div id="book">
        <%
            foreach (var item in Model)
            {
        %>
        <div>
            <center>
                <% if (item.UpdateDate.HasValue)
                   {
                %>
                <%:  item.UpdateDate.Value.ToLocalTime().DayOfWeek %>
                <%:  item.UpdateDate.Value.ToLocalTime().ToString("MMM dd yyyy")%>
                <%} %><br />
                <%: item.Title%>
                <a href="https://twitter.com/share" class="twitter-share-button" data-text="http://www.mybook.com/DisplayArticle?id=" <%: item.CDId %> <%: item.Title%>
                    text="Tweet">Tweet</a></center>
            <%= System.Web.HttpUtility.HtmlDecode(item.Body)%>
        </div>
        <%  }
        %>
    </div>
    </div>
</asp:Content>
