class ShortLinksController < ApplicationController

  before_action :set_short_link, only: [:show]

  def show
    redirect_to @short_link.full_url
  end

  def create
    short_link =ShortLink.create(short_link_params)
    return render_error(short_link) if short_link.invalid?
    render json: ShortLinkSerializer.new(short_link).to_json, status: :created
  end

  private 
  
  def set_short_link
    @short_link = ShortLink.find_by_slug(params[:id])
    head :not_found unless @short_link
  end

  def short_link_params 
    params.permit(:full_url, :user_id)
  end

  def render_error(resource, status = :unprocessable_entity)
    render json: { errors: resource.errors.full_messages } , status: status
  end
end
