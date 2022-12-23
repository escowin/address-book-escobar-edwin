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



end
