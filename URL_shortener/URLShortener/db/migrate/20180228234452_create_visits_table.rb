class CreateVisitsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :visits do |t|
      t.integer :user_id
      t.string :short_url
      t.timestamps
    end
  end
end
