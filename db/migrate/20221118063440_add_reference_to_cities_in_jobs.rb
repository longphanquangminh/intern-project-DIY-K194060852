class AddReferenceToCitiesInJobs < ActiveRecord::Migration[7.0]
  def change
    add_reference :jobs, :city, index: true
  end
end
