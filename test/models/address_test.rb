require "test_helper"

class AddressTest < ActiveSupport::TestCase

  test "address count" do
    assert_equal 2, Address.count
  end

  # test "the truth" do
  #   assert true
  # end
end
