class ApplicationController < ActionController::API

  private 
  def set_short_link
    @short_link = ShortLink.find_by_slug(params[:id])
    render json: not_found, status: :not_found  unless @short_link
  end

  def render_error(resource, status = :unprocessable_entity)
    render json: { errors: resource.errors.full_messages } , status: status
  end

  def not_found
    {
      "message": "Not Found",
      "documentation_url": ENV["DOCUMENTATION_URL"]
    }.to_json
  end
end
