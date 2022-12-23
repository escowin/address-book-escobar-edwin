require "test_helper"

class EmailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # testing against fixtures
  test "email count" do
    assert_equal 2, Address.count
  end

  test "find one" do
    assert_equal "user@test.com", emails(:one).email
  end

  test "find all" do
    assert_equal 2, emails.length
  end
end
