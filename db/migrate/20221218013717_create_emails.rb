class CreateEmails < ActiveRecord::Migration[7.0]
  def change
    create_table :emails do |t|
      t.string :email
      t.text :comment
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
