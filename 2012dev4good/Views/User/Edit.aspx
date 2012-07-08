<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<_2012dev4good.User>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
   
<h2>Edit</h2>
    <p>
        Use the form below to Edit a new account. 
    </p>


    <% using (Html.BeginForm()) { %>

        <%: Html.ValidationSummary(true, "Account creation was unsuccessful. Please correct the errors and try again.") %>
        <div>
            <fieldset>
                <legend>Account Information</legend>
                <%: Html.HiddenFor(m=>m.UserId)%>
                <div class="editor-label">
                    <%: Html.LabelFor(m => m.LoginName,"User Name") %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.LoginName)%>
                    <%: Html.ValidationMessageFor(m => m.LoginName, "Cannot Be Empty")%>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(m => m.FirstName,"First Name") %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.FirstName) %>
                    <%: Html.ValidationMessageFor(m => m.FirstName, "Cannot Be Empty")%>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(m => m.LastName, "Last Name")%>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.LastName) %>
                    <%: Html.ValidationMessageFor(m => m.LastName, "Cannot Be Empty") %>
                </div>
                
                <div class="editor-label">
                    <%: Html.LabelFor(m => m.EmailID) %>
                  
                </div>
                <div class="editor-field">
                    <%: Html.DisplayFor(m => m.EmailID) %>    <%: Html.HiddenFor(m=>m.EmailID)%>
                </div>

                 <div class="editor-label">
                    <%: Html.LabelFor(m => m.Extra1,"PassWord")%>
                </div>
                <div class="editor-field">
                    <%: Html.PasswordFor(m => m.Extra1)%>
                    <%: Html.ValidationMessageFor(m => m.Extra1, "Cannot Be Empty")%>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(m => m.Extra1, "Conform PassWord")%>
                </div>
                <div class="editor-field">
                    <%: Html.PasswordFor(m => m.Extra1)%>
                    <%: Html.ValidationMessageFor(m => m.Extra1, "Cannot Be Empty")%>
                </div>
  
                <div class="editor-label">
                    <%: Html.LabelFor(m => m.Extra2,"Responsible Author") %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.Extra2) %>
                    <%: Html.ValidationMessageFor(m => m.Extra2, "Cannot Be Empty")%>
                </div>
                
                <div class="editor-label">
                    <%: Html.LabelFor(m => m.Extra3, "Responsible EmailId")%>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.Extra3)%>
                    <%: Html.ValidationMessageFor(m => m.Extra3, "Cannot Be Empty")%>
                </div>
                
                <p>
                    <input type="submit" value="Register" />
                </p>
            </fieldset>
        </div>
    <% } %>
</asp:Content>


