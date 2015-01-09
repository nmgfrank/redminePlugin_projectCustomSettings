<% if @result.blank? %>
    $("#exists_users_list").html("");
    $("#added_users_list").html("");
     $("#invalid_user_list").html("");
    <% if !@users_exists_list.blank? %>
        $("#exists_users_list").html("<%=   @users_exists_list.join('<br>').to_s.html_safe   %>");
    <% end %>
    <% if !@users_add_list.blank? %>
        $("#added_users_list").html("<%=    @users_add_list.join('<br>').to_s.html_safe  %>");
    <% end %>
    <% if !@users_invalid_list.blank? %>
        $("#invalid_user_list").html("<%=   @users_invalid_list.join('<br>').to_s.html_safe   %>");
    <% end %>
<% else %>
    alert("<%= @result %>");
<% end %>
