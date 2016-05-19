module UsersHelper
  def users(users)
    content = users.any? && users.to_sentence || "(Nobody committed)"
    content_tag :div, content, class: "users"
  end
end
