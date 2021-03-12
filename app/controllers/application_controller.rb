class ApplicationController < ActionController::API

  private 
  def set_short_link
    @short_link = ShortLink.find_by_slug(params[:id])
    head :not_found unless @short_link
  end

  def render_error(resource, status = :unprocessable_entity)
    render json: { errors: resource.errors.full_messages } , status: status
  end
end
