class AddVisitCountToShortLinks < ActiveRecord::Migration[5.2]
  def change
     add_column :short_links, :visit_count, :integer, null: false, default: 0
  end
end
