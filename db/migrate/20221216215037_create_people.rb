class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :salutation
      t.string :firstname
      t.string :middlename
      t.string :lastname
      t.string :ssn
      t.string :dob
      t.text :comment

      t.timestamps
    end
  end
end
