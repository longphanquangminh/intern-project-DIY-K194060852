class AddReferenceToTypesInJobs < ActiveRecord::Migration[7.0]
  def change
    add_reference :jobs, :type, index: true
  end
end
