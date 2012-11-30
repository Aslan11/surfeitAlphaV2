module ApplicationHelper

  def facebook_auth_url
    oauth = Koala::Facebook::OAuth.new(APP_ID, APP_SECRET, SITE_URL + '/current')
    oauth.url_for_oauth_code(:permissions=>"read_stream")
  end

end
