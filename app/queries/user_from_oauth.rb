class UserFromOauth
  attr_reader :oauth

  def initialize(oauth)
    @oauth = oauth
  end

  def user
    email = oauth["info"]["email"]
    @user ||= User.find_or_initialize_by(email: email).tap do |user|
                user.name = oauth["info"]["name"]
                user.image_url = oauth["info"]["image"]
                user.uid = oauth["uid"]
                user.token = oauth["credentials"]["token"]
                user.save!
              end
  end
end
