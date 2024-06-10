require "test_helper"

class Public::AddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get incex" do
    get public_addresses_incex_url
    assert_response :success
  end
end
