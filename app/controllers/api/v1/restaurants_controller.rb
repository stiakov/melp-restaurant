class Api::V1::RestaurantsController < ApplicationController
  before_action :get_restaurant, only: %i[show update destroy]

  def index
    @restaurants = Restaurant.all
    render json: @restaurants
  end
  
  def show
    @restaurant = Restaurant.find(params[:id])
    render json: @restaurant
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      render json: @restaurant, status: :created
    else
      render json: @restaurant.errors, status: :unprocessable_entity
    end
  end

  def update
    if @restaurant.update(restaurant_params)
      render json: @restaurant
    else
      render json: @restaurant.errors, status: :unprocessable_entity
    end
  end

  def delete
    @restaurant.delete
  end

  private

  def get_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:id, :rating, :name, :site, :email, :phone, :street, :city, :state, :lat, :lng)
  end
end

