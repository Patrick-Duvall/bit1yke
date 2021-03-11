class ShortLinksController < ApplicationController

  before_action :set_short_link, only: [:show]

  def show
    redirect_to @short_link.full_url
  end

  private 
  
  def set_short_link
    @short_link = ShortLink.find_by_slug(params[:id])
    head :not_found unless @short_link
  end
end