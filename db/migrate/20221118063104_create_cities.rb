class CreateCities < ActiveRecord::Migration[7.0]
  def change
    create_table :cities do |t|
      t.string :name, index: {unique: true}
      t.string :country
      t.integer :job_count
      t.timestamps
    end
  end
end
