class AddAnotherFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :cv, :string
  end
end
