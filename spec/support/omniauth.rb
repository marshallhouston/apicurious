def stub_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
    provider: 'github',
    uid: '123545533',
    extra: { raw_info: { login: "marshallhouston" } },
    credentials: { token: "1325235abcdd", expires: false },
    })
end
