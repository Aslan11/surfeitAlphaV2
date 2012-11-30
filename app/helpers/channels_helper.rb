module ChannelsHelper

	  def facebook_auth_url
    session[:oauth] = Koala::Facebook::OAuth.new(APP_ID, APP_SECRET, SITE_URL + '/current')
    @auth_url = session[:oauth].url_for_oauth_code(:permissions=>"read_stream")
  end
  
end
