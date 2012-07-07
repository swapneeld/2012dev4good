<%@ Import Namespace="_2012dev4good.Models" %>

<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<_2012dev4good.Models.CreativeDetailsViewModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Past..
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        $(window).ready(function () {
            $('#book').turn({
                display: 'single',
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

    <h2>
        History</h2>
    <div id="book">
        <%
            foreach (var item in Model)
            {
        %>
        <div>
            Added on
            <% if (item.UpdateDate.HasValue)
               {
            %>

            <%:  item.UpdateDate.Value.ToLocalTime()%>
            <%} %>
            <%: item.Title%>
            -
            <%= System.Web.HttpUtility.HtmlDecode(item.Body)%>
        </div>
        <%  }
        %>
    </div>
</asp:Content>
