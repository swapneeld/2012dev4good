<%@ Import Namespace="_2012dev4good.Models" %>

<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<_2012dev4good.Models.CreativeDetailsViewModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<%--<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: ViewBag.Message %></h2>
    <p>
        display History here    
    </p>
</asp:Content>
--%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="main">
        <div id="logo">
            <img src="../../Content/my_book.png" />
        </div>
        <div id="genreSelection">
            <h2>
                Genre Selection</h2>
            <ul id="genreIcons">
                <li class="icon">
                <img class="iconImage" src="../../Content/diary.png" />
                    <%: Html.ActionLink("History", "MyHistory", "Home")%></li>
                <li class="icon">
                <img class="iconImage" src="../../Content/diary.png" />
                    <%: Html.ActionLink("Be Creative", "CreateNew", "Home")%></li>
                <li class="icon">
                    <img class="iconImage" src="../../Content/Wand.png" />
                    <a href="#">Fairy Tale</a> </li>
                <li class="icon">
                    <img class="iconImage" src="../../Content/Skull.png" />
                    <a href="#">Horror</a> </li>
                <li class="icon">
                    <img class="iconImage" src="../../Content/heart.png" />
                    <a href="#">Romantic</a> </li>
                <li class="icon">
                    <img class="iconImage" src="../../Content/football.png" />
                    <a href="#">Sport</a> </li>
                <li class="icon">
                    <img class="iconImage" src="../../Content/diary.png" />
                    <a href="#">Diary</a> </li>
            </ul>
        </div>
        <%--        <div id="editor">
        </div>
        <div id="editorControls">
        </div>   
        --%>
    </div>
</asp:Content>
