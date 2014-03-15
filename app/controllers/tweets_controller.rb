class TweetsController < ApplicationController
  include TwitterOmniauthHelper

  def input
    if signed_in?
      client = create_client unless client.present?
      @timeline = client.home_timeline
    end
  end

  def update
    if signed_in?
      client = create_client unless client.present?
      client.update(params[:message])
      redirect_to root_url#, :notice => "success"
    else
      redirect_to root_url, :notice => "not signed_in"
    end
  end
end
