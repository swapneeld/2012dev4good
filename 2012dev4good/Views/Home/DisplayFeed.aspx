<%@ Import Namespace="_2012dev4good.Models" %>
<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<_2012dev4good.Models.CreativeDetailsViewModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    DisplayFeed
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>DisplayFeed</h2>

<%
    foreach (var item in Model)
  {
    %>
    <div style ="border-width ="5">
  Added on <% if (item.UpdateDate.HasValue)
              {
                  %>   
                  <%:  item.UpdateDate.Value.ToLocalTime()%>                       <%} %>
                  
                  
  <I><%: item.Title%>    - <%= System.Web.HttpUtility.HtmlDecode(item.Body)%></I>
  </div> 
  <br />
  <br />

<%  }
     %>
</asp:Content>
