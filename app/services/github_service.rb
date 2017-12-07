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
    get_json("/user/repos") #access token as params
  end

  def followers
    # get_json("/users/#{username}/followers") #access token in headers
    get_json("/user/followers") #access token in params
  end

  def following
    # get_json("/users/#{username}/following") #access token in headers
    get_json("/user/following") #access token in params
  end

  private
    attr_reader :conn, :username

    def get_json(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end

end
