<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<_2012dev4good.Models.SearchData>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Search Deatils</h2>
<% using(Html.BeginForm()){%>

<div>
</div>

<% foreach(var r in Model) {%>
<div>
<%: Html.ActionLink(r.Title, "View","Home", new { id = r.cdID },null)%>

<%: Html.ActionLink(r.UserName, "search", new { id = r.userId }, null)%>

<%: Html.Display(r.PublishedDate)%>

</div>
<%} %>



<%} %>
</asp:Content>
