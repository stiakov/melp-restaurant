class Api::V1::StatisticsController < ApplicationController
  attr_reader :statistics

  def gis
    latitude, longitude, radius = params[:latitude], params[:longitude], params[:radius]

    unless valid_params(latitude, longitude, radius)
      render json: { message: 'Malformed Query', status: :bad_request }
      return
    end

    @neighbors = Restaurant.nearby(latitude, longitude, radius)
    @statistics = Restaurant.get_statistics(@neighbors)

    render json: @statistics
  end
  
  private
  
  def valid_params(lat, long, rad)
    rx_float = /^\-?\d+[\.|\,]\d+/
    rx_int = /^\d+$/
    
    not_nil = lat && long && rad
    valid_ciphers = lat.match(rx_float) && long.match(rx_float) && rad.match(rx_int) if not_nil

    not_nil && valid_ciphers
  end
end
