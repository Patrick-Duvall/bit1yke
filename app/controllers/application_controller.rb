class ApplicationController < ActionController::API
  def set_short_link
    @short_link = ShortLink.find_by_slug(params[:id])
    head :not_found unless @short_link
  end
end
