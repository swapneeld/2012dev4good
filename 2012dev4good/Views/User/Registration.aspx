<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<_2012dev4good.User>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Registration
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Create a New Account</h2>
    <p>
        Use the form below to create a new account. 
    </p>
    <p>
        Passwords are required to be a minimum of 6 characters in length.
    </p>

    <% using (Html.BeginForm()) { %>

        <%: Html.ValidationSummary(true, "Account creation was unsuccessful. Please correct the errors and try again.") %>
        <div>
            <fieldset>
                <legend>Account Information</legend>
                
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
                    <%: Html.TextBoxFor(m => m.EmailID) %>
                    <%: Html.ValidationMessageFor(m => m.EmailID, "Cannot Be Empty") %>
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
