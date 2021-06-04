class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :title
      t.text :description
      t.string :release_date
      t.integer :favorites_count

      t.timestamps
    end
  end
end
