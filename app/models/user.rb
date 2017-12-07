class User < ApplicationRecord

  def self.from_omniauth(auth_info)
    user = where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.username           = auth_info.extra.raw_info.login
      new_user.picture            = auth_info.info.image
      new_user.token              = auth_info.credentials.token
    end
    verify_token(user, auth_info)
    user
  end

  def self.verify_token(user, auth_info)
    if user.token != auth_info.credentials.token
      user.update(token: auth_info.credentials.token)
    end
  end
end

# def self.from_omniauth(auth_info)
#   find_or_create_by(uid: auth_info[:uid]) do |new_user|
#     new_user.uid                = auth_info.uid
#     new_user.username           = auth_info.extra.raw_info.login
#     new_user.token              = auth_info.credentials.token
#   end
# end

# if user.token != auth_info.credentials.token
#   user.token = auth_info.credentials.token
#   user.save
# end
# user
