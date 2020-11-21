class Api::V1::RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    render json: @restaurants
  end
  
  def show
    @restaurant = Restaurant.find(params[:id])
    render json: @restaurant
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end      
end
