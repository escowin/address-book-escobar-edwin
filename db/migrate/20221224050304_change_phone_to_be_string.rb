class ChangePhoneToBeString < ActiveRecord::Migration[7.0]
  def change
    change_column :phone_numbers, :phone, :string
  end
end
