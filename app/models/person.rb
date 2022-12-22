class Person < ApplicationRecord
    # relationship with secondary models
    has_many :addresses, dependent: :destroy
    has_many :emails, dependent: :destroy
    has_many :phone_numbers, dependent: :destroy

    # validates :salutation
    validates :firstname, presence: true
    # validates :middlename
    validates :lastname, presence: true
    # validates :ssn
    # validates :dob
    # validates :comment
end
