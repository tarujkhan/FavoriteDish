Rails.application.config.middleware.use OmniAuth::Builder do
    provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
    {:scope => "user.email",}
  end


  OmniAuth.config do |config|
    # Disable the redirect to /auth/failure and always raise
    config.failure_raise_out_environments = ['test', 'development', 'staging', 'production']
  end