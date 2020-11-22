require 'test_helper'

class Api::V1::StatisticsControllerTest < ActionDispatch::IntegrationTest
  test "should get gis" do
    get api_v1_statistics_gis_url
    assert_response :success
  end
end
