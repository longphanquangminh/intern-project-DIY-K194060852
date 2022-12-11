class AddSlugToIndustries < ActiveRecord::Migration[7.0]
  def change
    add_column :industries, :slug, :string
    add_index :industries, :slug
  end
end
