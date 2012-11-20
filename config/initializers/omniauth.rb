require 'openssl'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.env.production?
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_KEY_SECRET']
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET']
end



