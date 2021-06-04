class CreateMachines < ActiveRecord::Migration[6.1]
  def change
    create_table :machines do |t|
      t.references :arcade, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.integer :number_of_machines

      t.timestamps
    end
  end
end
