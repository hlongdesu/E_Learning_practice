class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.references :user, foreign_key: true
      t.string :action_type, null: false, default: 0
      t.integer :target_id

      t.timestamps
    end
  end
end
