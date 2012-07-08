<%@ Page Title="Create New" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<_2012dev4good.Models.CreativeDetailsViewModel>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    CreateNew.aspx
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id="logo">
            <a href="Index"><img src="../../Content/my_book.png" /></a>
        </div>
        <div id="main">
    <% using (Html.BeginForm())
       {
     %>
     <%: Html.LabelFor(model => model.Title)%>
            <%: Html.TextBoxFor(model => model.Title)%>
     <input type="submit" id="contentSubmit" value="Sumbit" />
		<!-- Some integration calls -->
<%--		<a href="javascript:;" onclick="tinyMCE.get('elm1').show();return false;">[Show]</a>
		<a href="javascript:;" onclick="tinyMCE.get('elm1').hide();return false;">[Hide]</a>
		<a href="javascript:;" onclick="tinyMCE.get('elm1').execCommand('Bold');return false;">[Bold]</a>
		<a href="javascript:;" onclick="alert(tinyMCE.get('elm1').getContent());return false;">[Get contents]</a>
		<a href="javascript:;" onclick="alert(tinyMCE.get('elm1').selection.getContent());return false;">[Get selected HTML]</a>
		<a href="javascript:;" onclick="alert(tinyMCE.get('elm1').selection.getContent({format : 'text'}));return false;">[Get selected text]</a>
		<a href="javascript:;" onclick="alert(tinyMCE.get('elm1').selection.getNode().nodeName);return false;">[Get selected element]</a>
		<a href="javascript:;" onclick="tinyMCE.execCommand('mceInsertContent',false,'<b>Hello world!!</b>');return false;">[Insert HTML]</a>
		<a href="javascript:;" onclick="tinyMCE.execCommand('mceReplaceContent',false,'<b>{$selection}</b>');return false;">[Replace selection]</a>--%>

<%--		<p>
			This page shows all available buttons and plugins that are included in the TinyMCE core package.
			There are more examples on how to use TinyMCE in the <a href="http://tinymce.moxiecode.com/examples/">Wiki</a>.
		</p>--%>

	
        <div>
        <%: Html.TextAreaFor(model => model.Body,new {rows="15", cols="80", style="width: 80%"})%>
<%--			<textarea id="elm1" name="elm1" rows="15" cols="80" style="width: 80%">
				&lt;p&gt;
					This is some example text that you can edit inside the &lt;strong&gt;TinyMCE editor&lt;/strong&gt;.
				&lt;/p&gt;
				&lt;p&gt;
				Nam nisi elit, cursus in rhoncus sit amet, pulvinar laoreet leo. Nam sed lectus quam, ut sagittis tellus. Quisque dignissim mauris a augue rutrum tempor. Donec vitae purus nec massa vestibulum ornare sit amet id tellus. Nunc quam mauris, fermentum nec lacinia eget, sollicitudin nec ante. Aliquam molestie volutpat dapibus. Nunc interdum viverra sodales. Morbi laoreet pulvinar gravida. Quisque ut turpis sagittis nunc accumsan vehicula. Duis elementum congue ultrices. Cras faucibus feugiat arcu quis lacinia. In hac habitasse platea dictumst. Pellentesque fermentum magna sit amet tellus varius ullamcorper. Vestibulum at urna augue, eget varius neque. Fusce facilisis venenatis dapibus. Integer non sem at arcu euismod tempor nec sed nisl. Morbi ultricies, mauris ut ultricies adipiscing, felis odio condimentum massa, et luctus est nunc nec eros.
				&lt;/p&gt;
			</textarea>
--%>
            

		</div>
    <%       
       }
     %>
     </div>
</asp:Content>
