module UsersHelper
  def users(users)
    content = users.any? && users.to_sentence || "(Nobody committed)"
    content_tag :span, content, class: "users"
  end
end
