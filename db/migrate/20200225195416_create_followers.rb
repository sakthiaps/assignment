class CreateFollowers < ActiveRecord::Migration[6.0]
  def change
    create_table :followers do |t|
      t.references :user, null: false
      t.integer :associated_id, null: false

      t.timestamps
    end
  end
end
