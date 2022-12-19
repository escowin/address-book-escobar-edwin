class Person < ApplicationRecord
    # relationship with secondary models
    has_many :addresses, dependent: :destroy
    has_many :emails, dependent: :destroy
    has_many :phone_numbers, dependent: :destroy

    # validates :salutation, presence: true
    validates :firstname, presence: true
    # validates :middlename, presence: true
    validates :lastname, presence: true
    validates :ssn, length: { maximum: 9 }
    validates :dob, length: { maximum: 8 }
    # validates :comment, presence: true
end
