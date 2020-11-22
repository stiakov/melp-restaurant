class Restaurant < ApplicationRecord
  scope :nearby, -> (latitude, longitude, radius) { 
    where(
      "ST_DWithin(
        ST_SetSrID(ST_MakePoint(lat, lng), 4326),
        ST_SetSrID(ST_MakePoint(?, ?), 4326),
        ?
      )", latitude, longitude, radius
    )
  }

  def self.get_statistics(neighbors)
    ratings = neighbors.map { |item| item.rating }
    average = calculate_avg(ratings)
    
    statistics ={
      count: neighbors.size,
      avg: average,
      std: calculate_std_deviation(ratings, average)
    }

    statistics
  end

  private

  def self.calculate_avg(values)
    sum = 0
    values.each do |item|
      sum = sum + item
    end

    sum.to_f / values.size
  end

  def self.calculate_std_deviation(values, average)
    squared_sum = 0
    values.each do |item|
      squared_sum = (item - average) ** 2 
    end

    squared_sum.to_f / values.size
  end
end