class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.belongs_to :goal, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps

      t.index [:goal_id, :user_id], unique: true
    end

    change_table :goals do |t|
      t.integer :likes_count, default: 0
    end
  end
end
