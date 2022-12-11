class CreateHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :histories do |t|
      t.references :job
      t.references :user
      t.timestamps
    end
  end
end
