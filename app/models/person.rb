class Person < ApplicationRecord
    # validates :salutation, presence: true
    validates :firstname, presence: true
    # validates :middlename, presence: true
    validates :lastname, presence: true
    # validates :ssn, presence: true
    # validates :dob, presence: true
    # validates :comment, presence: true
end
