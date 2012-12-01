class PagesController < ApplicationController

  before_filter :check_for_authorizations

  def current 
    client = Instagram.client(:access_token => instagram_authorization)
    @mediafeed = client.user_media_feed

    # if params[:code]
    #   session[:access_token] = session[:oauth].get_access_token(params[:code])
    # end

    # @api = Koala::Facebook::API.new(session[:access_token])
    # @graph_data = @api.get_object("/me/home")
  end

private

  def check_for_authorizations
     redirect_to new_authorizations_path unless has_authorizations?
  end

end
