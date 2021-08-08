class CreateHistoryFolders < ActiveRecord::Migration[6.1]
  def change
    create_table :history_folders do |t|
      t.references :history, null: false, foreign_key: true
      t.references :folder, null: false, foreign_key: true

      t.timestamps
    end
  end
end
