class GithubService

  def initialize(user)
    @username = user.username
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      # faraday.headers['access_token'] = user.token
      faraday.params[:access_token] = user.token
      faraday.adapter Faraday.default_adapter
    end
  end

  def user_profile
    # get_json("/users/#{username}") #access token in header
    get_json("/user") #access_token as params
  end

  def user_starred_repos
    # get_json("/users/#{username}/starred") #access token in header
    get_json("/user/starred") #access_token as params
  end

  def user_repos
    # get_json("/users/#{username}/repos") #access token in header
    get_json("/user/repos?per_page=100&affiliation=owner") #access token as params
    #params are hard coded in
    # params[:per_page] = 100
  end

  def followers
    # get_json("/users/#{username}/followers") #access token in headers
    get_json("/user/followers") #access token in params
  end

  def detailed_follower_info
    followers.map do |follower|
      get_json("/users/#{follower[:login]}")
    end
  end

  def following
    # get_json("/users/#{username}/following") #access token in headers
    get_json("/user/following") #access token in params
  end

  def detailed_following_info
    following.map do |followed_person|
      get_json("/users/#{followed_person[:login]}")
    end
  end

  private
    attr_reader :conn, :username

    def get_json(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end

end
