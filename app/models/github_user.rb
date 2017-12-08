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

  def followers(current_user)
    followers = GithubService.new(current_user).detailed_follower_info
    followers.map do |follower|
      Follower.new(follower)
    end
  end

  def following(current_user)
    following = GithubService.new(current_user).detailed_following_info
    following.map do |followed_person|
      Followed.new(followed_person)
    end
  end

end
