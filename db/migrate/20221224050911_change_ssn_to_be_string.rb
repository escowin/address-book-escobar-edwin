class ChangeSsnToBeString < ActiveRecord::Migration[7.0]
  def change
    change_column :people, :ssn, :string
  end
end
