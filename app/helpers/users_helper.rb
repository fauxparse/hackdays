module UsersHelper
  def users(users)
    content = if users.any?
      users.map { |user| link_to(user, user).html_safe }.to_sentence.html_safe
    else
      "(Nobody committed)"
    end
    content_tag :span, content, class: "users"
  end

  def user_ids_for_select
    User.order(name: :asc).pluck(:name, :id)
  end
end
