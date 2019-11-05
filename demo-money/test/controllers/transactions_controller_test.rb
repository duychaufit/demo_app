require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get transactions_home_url
    assert_response :success
  end

  test "should get deptor" do
    get transactions_deptor_url
    assert_response :success
  end

end
