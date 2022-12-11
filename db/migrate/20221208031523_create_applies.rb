class CreateApplies < ActiveRecord::Migration[7.0]
  def change
    create_table :applies do |t|
      t.references :job
      t.references :user
      t.timestamps
    end
  end
end
