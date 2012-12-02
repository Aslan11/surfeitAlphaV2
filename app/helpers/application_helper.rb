module ApplicationHelper

  def facebook_auth_url
    facebook_oauth = Koala::Facebook::OAuth.new(APP_ID, APP_SECRET, authorize_facebook_url)
   	facebook_oauth.url_for_oauth_code(:permissions=>"read_stream")
  end

end
