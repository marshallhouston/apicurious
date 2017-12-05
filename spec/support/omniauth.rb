# https://github.com/omniauth/omniauth/wiki/Integration-Testing

# OmniAuth.config.test_mode = true

# OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
#   :provider => 'github',
#   :uid => '123545'
#   # etc.
# })


# OmniAuth.config.add_mock(:github, {:uid => '12345'})

def stub_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
    provider: 'github',
    uid: '123545533',
    extra: { raw_info: { login: "marshallhouston" } },
    credentials: { token: "1325235abcdd", expires: false },
    })
end

# #In tests setup,
# before :each do
#   OmniAuth.config.mock_auth[:github] = nil
# end
#
# # will need to set environment variables
# before do
#   Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:github]
# end



# {"provider"=>"github",
#  "uid"=>"24700836",
#  "info"=>
#   {"nickname"=>"marshallhouston",
#    "email"=>"marshall.houston@gmail.com",
#    "name"=>"Marshall Houston",
#    "image"=>"https://avatars1.githubusercontent.com/u/24700836?v=4",
#    "urls"=>{"GitHub"=>"https://github.com/marshallhouston", "Blog"=>""}},
#  "credentials"=>{"token"=>"3d17534ec1cffd6a66832c50de7a76519e7b8a37", "expires"=>false},
#  "extra"=>
#   {"raw_info"=>
#     {"login"=>"marshallhouston",
#      "id"=>24700836,
#      "avatar_url"=>"https://avatars1.githubusercontent.com/u/24700836?v=4",
#      "gravatar_id"=>"",
#      "url"=>"https://api.github.com/users/marshallhouston",
#      "html_url"=>"https://github.com/marshallhouston",
#      "followers_url"=>"https://api.github.com/users/marshallhouston/followers",
#      "following_url"=>"https://api.github.com/users/marshallhouston/following{/other_user}",
#      "gists_url"=>"https://api.github.com/users/marshallhouston/gists{/gist_id}",
#      "starred_url"=>"https://api.github.com/users/marshallhouston/starred{/owner}{/repo}",
#      "subscriptions_url"=>"https://api.github.com/users/marshallhouston/subscriptions",
#      "organizations_url"=>"https://api.github.com/users/marshallhouston/orgs",
#      "repos_url"=>"https://api.github.com/users/marshallhouston/repos",
#      "events_url"=>"https://api.github.com/users/marshallhouston/events{/privacy}",
#      "received_events_url"=>"https://api.github.com/users/marshallhouston/received_events",
#      "type"=>"User",
#      "site_admin"=>false,
#      "name"=>"Marshall Houston",
#      "company"=>nil,
#      "blog"=>"",
#      "location"=>"Denver, CO",
#      "email"=>"marshall.houston@gmail.com",
#      "hireable"=>nil,
#      "bio"=>"I am a former middle school teacher with six years of experience in the K-12 education space finding my way in the world of development.",
#      "public_repos"=>42,
#      "public_gists"=>15,
#      "followers"=>2,
#      "following"=>6,
#      "created_at"=>"2016-12-21T15:50:25Z",
#      "updated_at"=>"2017-12-05T15:13:52Z",
#      "private_gists"=>2,
#      "total_private_repos"=>0,
#      "owned_private_repos"=>0,
#      "disk_usage"=>380,
#      "collaborators"=>0,
#      "two_factor_authentication"=>false,
#      "plan"=>{"name"=>"free", "space"=>976562499, "collaborators"=>0, "private_repos"=>0}},
#    "all_emails"=>[{"email"=>"marshall.houston@gmail.com", "primary"=>true, "verified"=>true, "visibility"=>"public"}]}}
