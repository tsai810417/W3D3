class ModifiedVisitsTable < ActiveRecord::Migration[5.1]
  def change
    add_column :visits, :shortened_url_id, :integer, null: false
    remove_column :visits, :short_url
  end
end
