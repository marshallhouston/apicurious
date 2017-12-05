class UsersController < ApplicationController

  def show
    user_info_request = Faraday.get("https://api.github.com/user?access_token=#{current_user.token}")
    @parsed_user = JSON.parse(user_info_request.body)
  end

end
