class Histories < ActiveRecord::Migration[6.1]
  def change
    create_table :histories do |t|
      t.references :user, null: false, foreign_key: true
      t.string :url, null: false
      t.string :title, null: false

      t.timestamps
    end
  end
end
