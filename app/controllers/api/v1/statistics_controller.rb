class Api::V1::StatisticsController < ApplicationController
  attr_reader :statistics

  def gis
    latitude, longitude, radius = params[:latitude], params[:longitude], params[:radius]
    @neighbors = Restaurant.nearby(latitude, longitude, radius)
    @statistics = Restaurant.get_statistics(@neighbors)

    render json: @statistics
  end
end
