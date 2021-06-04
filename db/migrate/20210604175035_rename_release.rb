class RenameRelease < ActiveRecord::Migration[6.1]
  def change
    rename_column :games, :release_year, :release_date
  end
end
