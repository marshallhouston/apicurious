class GithubUser

  attr_reader :username,
              :picture,
              :repository_count,
              :number_of_followers,
              :following_other_users_count

  def initialize(attrs = {})
    @username = attrs[:login]
    @picture = attrs[:avatar_url]
    @repository_count = attrs[:public_repos]
    @number_of_followers = attrs[:followers]
    @following_other_users_count = attrs[:following]
  end

  def starred_repo_count
    
  end

end
# class Member
#   attr_reader :name, :role, :district, :party
#
#   def initialize(attrs = {})
#     @name = attrs[:name]
#     @role = attrs[:role]
#     @district = attrs[:district]
#     @party = attrs[:party]
#   end
# end
