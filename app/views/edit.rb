<h1>Edit an Article</h1>

<form action="/articles/<%= @article.id %>" method="POST">
  <input id="hidden" type="hidden" name="_method" value="PATCH">
    <p>Title: <input type="text" name="title" value="<%= @article.title %>"></p>
    <p>Content: <textarea name="content"><%= @article.content %></textarea></p>
    <input type="submit" id="submit"/>
</form>