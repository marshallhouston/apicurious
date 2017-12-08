class Followed

  attr_reader :username,
              :picture,
              :html_url,
              :full_name,
              :description,
              :location

  def initialize(attrs = {})
    @username = attrs[:login]
    @picture = attrs[:avatar_url]
    @html_url = attrs[:html_url]
    @full_name = attrs[:name]
    @description = attrs[:bio]
    @location = attrs[:location]
  end

end
