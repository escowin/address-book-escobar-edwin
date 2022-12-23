require "test_helper"

class PhoneNumberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

    # testing against fixtures
    test "phone number count" do
      assert_equal 2, PhoneNumber.count
    end
  
    test "find one" do
      assert_equal 5121114000, phone_numbers(:one).phone
    end
  
    test "find all" do
      assert_equal 2, phone_numbers.length
    end

    test "null values" do
      assert_equal nil, phone_numbers(:one).comment
    end
end
