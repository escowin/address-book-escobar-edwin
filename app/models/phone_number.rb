class PhoneNumber < ApplicationRecord
  belongs_to :person

  validates :phone, presence: true
end
