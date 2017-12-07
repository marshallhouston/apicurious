class Follower

  attr_reader :username, :picture, :html_url

  def initialize(attrs = {})
    @username = attrs[:login]
    @picture = attrs[:avatar_url]
    @html_url = attrs[:html_url]
  end

  def full_name
    #still will need to pass in the current_user becasue we have to send that info to use the token
    # accept collection of other users?
    # go to the actual user profile to get this info
  end

  def description
    # go to the actual user profile to get this info
  end

  def location
    # go to the actual user profile to get this info
  end
end
