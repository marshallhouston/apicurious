class User < ApplicationRecord

  def self.from_omniauth(auth_info)
    user = where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.username           = auth_info.extra.raw_info.login
      new_user.picture            = auth_info.info.image
      new_user.token              = auth_info.credentials.token
      new_user.name               = auth_info.extra.raw_info.name
      new_user.bio                = auth_info.extra.raw_info.bio
      new_user.location           = auth_info.extra.raw_info.location
      new_user.email              = auth_info.extra.raw_info.email
    end
    verify_token(user, auth_info)
    unless updated_user(user)
      add_user_data(user, auth_info)
    end
    user
  end

  def self.verify_token(user, auth_info)
    if user.token != auth_info.credentials.token
      user.update(token: auth_info.credentials.token)
    end
  end

  def self.updated_user(user)
    user.name && user.bio && user.location && user.email
  end

  def self.add_user_data(user, auth_info)
    user.update(name: auth_info.extra.raw_info.name,
                bio: auth_info.extra.raw_info.bio,
                location: auth_info.extra.raw_info.location,
                email: auth_info.extra.raw_info.email)
  end
end
