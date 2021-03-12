class AnalyticsController < ApplicationController

  before_action :set_short_link, only: [:show]

  def show
      render json: ShortLinkSerializer.new(@short_link).to_json, status: :ok
  end
end