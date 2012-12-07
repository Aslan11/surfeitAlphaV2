require 'openssl'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE


Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.env.production?
  provider :twitter, 'xogiGTZHrPs8AM86wCtHBQ', 'iIiM39fNGsC3vbGYJ9tqHT524m9OJWveeQFs5rd0'
end




