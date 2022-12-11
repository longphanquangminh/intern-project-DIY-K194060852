class CreateIndustries < ActiveRecord::Migration[7.0]
  def change
    create_table :industries do |t|
      t.string :name, index: {unique: true}
      t.integer :job_count
      t.timestamps
    end
  end
end
