class GithubService

  def initialize(token)
    @token = token
  end

  def request_profile_information
    response = Faraday.get("https://api.github.com/user?access_token=#{@token}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def starred_repos
    response = Faraday.get("https://api.github.com/users/marshallhouston/starred?access_token=#{@token}")
    JSON.parse(response.body, symbolize_names: true)
  end
  
end
