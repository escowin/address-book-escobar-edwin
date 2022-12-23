require "test_helper"

class PersonTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "should report error" do
    assert_raises(NameError) do
      some_undefined_variable
    end
  end

  test "do not save person without firstname" do
    person = Person.new
    assert_not person.save, "Saved the person without firstname"
  end

  test "do not save person without lastname" do
    person = Person.new
    assert_not person.save, "Saved the person without lastname"
  end

  # testing against fixtures
  test "person has null optional values" do
    assert_equal nil, people(:two).salutation
    assert_equal nil, people(:two).middlename
    assert_equal nil, people(:two).ssn
    assert_equal nil, people(:two).dob
    assert_equal nil, people(:two).comment
  end
end
