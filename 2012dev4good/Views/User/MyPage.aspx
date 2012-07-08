<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<_2012dev4good.CreativeDetail>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    MyPage
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>MyPage</h2>
<% using(Html.BeginForm()){%>

<div>
</div>

<% foreach(var r in Model) {%>
<div>
<%: Html.ActionLink(r.Title, "View","Home", new { id = r.CDid },null)%>

<%: Html.ActionLink("Edit", "View","Home", new { id = r.CDid },null)%>

<%: Html.ActionLink("Delete", "View","Home", new { id = r.CDid },null)%>

<%: Html.ActionLink("PDF Download", "PDFDownload", new { id = r.CDid}, null)%>
</div>
<%} %>



<%} %>
</asp:Content>
