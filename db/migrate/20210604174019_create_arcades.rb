class CreateArcades < ActiveRecord::Migration[6.1]
  def change
    create_table :arcades do |t|
      t.string :name
      t.text :address
      t.integer :comments_count
      t.belongs_to :owner, null: false, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
  end
end
