class AddFieldsToApplies < ActiveRecord::Migration[7.0]
  def change
    add_column :applies, :full_name, :string
    add_column :applies, :email, :string
    add_column :applies, :cv, :string
  end
end
