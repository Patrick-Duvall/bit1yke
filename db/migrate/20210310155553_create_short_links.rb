class CreateShortLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :short_links do |t|
      t.string :full_url, null: false
      t.integer :user_id, null: false

      t.timestamps
    end

    add_index :short_links, [:user_id, :full_url], unique: true
  end
end
