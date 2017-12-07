class GithubService

  def initialize(token, username)
    @username = username
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers['access_token'] = token
      faraday.adapter Faraday.default_adapter
    end
  end

  def user_profile
    get_json("/users/#{username}")
    # get_json("/user") will work if you have the access_token as parameters, but it doesn't work if you have the access token in the header
  end

  def user_starred_repos
    get_json("/users/#{username}/starred")
  end

  def user_repos
    get_json("/users/#{username}/repos")
  end

  def followers
    get_json("/users/#{username}/followers")
  end

  def following
    get_json("/users/#{username}/following")
  end

  private
    attr_reader :conn, :username

    def get_json(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end

end
