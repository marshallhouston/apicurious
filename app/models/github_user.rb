class GithubUser

  attr_reader :username,
              :picture,
              :repository_count,
              :number_of_followers,
              :following_other_users_count

  def initialize(attrs = {})
    @username = attrs[:login]
    @repository_count = attrs[:public_repos]
    @number_of_followers = attrs[:followers]
    @following_other_users_count = attrs[:following]
  end

  def followers
    #collection of github user objects that are based on this user

  end

  def following
    #collection of github user objects based on this specific user
  end

end
