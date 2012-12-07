module ApplicationHelper

  def facebook_auth_url
    facebook_oauth = Koala::Facebook::OAuth.new('333831113381266', '43e26a8d150ba3db9a0308031fdbfd86', authorize_facebook_url) 
   	facebook_oauth.url_for_oauth_code(:permissions=>"read_stream,publish_stream")
  end

end
