class AddNumberofMachines < ActiveRecord::Migration[6.1]
  def change
    add_column :machines, :number_of_machines, :integer
  end
end
