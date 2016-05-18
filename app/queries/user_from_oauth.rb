class UserFromOauth
  attr_reader :oauth

  def initialize(oauth)
    @oauth = oauth
  end

  def user
    @user ||= User.find_or_initialize_by(uid: oauth["uid"]).tap do |user|
                user.name = oauth["info"]["name"]
                user.email = oauth["info"]["email"]
                user.image_url = oauth["info"]["image"]
                user.save!
              end
  end
end
