class AddReferenceToIndustriesInJobs < ActiveRecord::Migration[7.0]
  def change
    add_reference :jobs, :industry, index: true
  end
end
