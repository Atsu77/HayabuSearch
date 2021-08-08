class CreateHistoryTags < ActiveRecord::Migration[6.1]
  def change
    create_table :history_tags do |t|
      t.references :history, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
