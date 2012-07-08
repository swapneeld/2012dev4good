<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

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
        <div id="indexContainer">
            <div id="col1">
                <h1>Latest Publications</h1>
                <div id="ticker">
                    <ul id="tickerItems">
                        <li class="tickerItem">
                            Matthew Arnold wrote a new story called <a href="#">The longest day</a>
                        </li>
                        <li class="tickerItem">
                            Matthew Arnold wrote a new story called <a href="#">Endless Issues</a>
                        </li>
                        <li class="tickerItem">
                            Matthew Arnold wrote a new story called <a href="#">Unproductive iterations</a>
                        </li>
                        <li class="tickerItem">
                            Matthew Arnold wrote a new story called <a href="#">Unagile response to change</a>
                        </li>
                        <li class="tickerItem">
                            Matthew Arnold wrote a new story called <a href="#">TInsufficient Planning</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div id="col2">
            <h1>Your Book</h1>
                <div id="siteText">
                    <p>
                        This is YOUR space to be creative and share your work with your friends, family and even the world! How you use it is entirely up to you, so don't hang around... get creative and start writing!
                    </p>
                </div>
            </div>
            <div id="col3">
            <h1>Top Items Today</h1>
                <div id="topStuff">
                    <div id="topItems">
                        <ul id="topItemList">
                            <li class="topItem">
                             <a href="#">The longest day</a> By Matthew Arnold
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

