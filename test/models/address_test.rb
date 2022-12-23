require "test_helper"

class AddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # testing against fixtures
  test "address_count" do
    assert_equal 2, Address.count
  end

  test "find one" do
    assert_equal "51st St", addresses(:one).street
  end

  test "find all by street" do
    assert_equal 2, addresses.length
  end
  
end
