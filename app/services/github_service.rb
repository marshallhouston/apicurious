class GithubService

  def initialize(token, username)
    @username = username
    @token = token
  end

  def user_profile
    response = Faraday.get("https://api.github.com/user?access_token=#{@token}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def user_starred_repos
    response = Faraday.get("https://api.github.com/users/#{@username}/starred?access_token=#{@token}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def user_repos
    response = Faraday.get("https://api.github.com/users/#{@username}/repos?access_token=#{@token}&type='all'")
    JSON.parse(response.body, symbolize_names: true)
  end

end
