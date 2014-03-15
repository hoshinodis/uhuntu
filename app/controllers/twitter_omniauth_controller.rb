class TwitterOmniauthController < ApplicationController
  include TwitterOmniauthHelper

  def create
    auth = request.env["omniauth.auth"]
    set_auth_session(auth)
    redirect_to root_url, :notice => "Signed in!"
  end

  def destroy
    set_auth_session(nil)
    redirect_to root_url, :notice => "Signed out!"
  end
end
