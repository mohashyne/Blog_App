<h2>New Comment</h2>

<%= form_with(model: [@user, @post, Comment.new], url: user_post_comments_path([@user, @post]), class: 'comment-form') do |form| %>
  <div class="field">
    <%= form.label :text, "Comment" %>
    <%= form.text_area :text, rows: 4 %>
  </div>

  <div class="actions">
    <%= form.submit 'Create Comment', class: 'button' %>
  </div>
<% end %>

<%= link_to 'Back', user_post_path(@user, @post), class: 'button' %>
