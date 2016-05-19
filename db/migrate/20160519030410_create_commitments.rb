class CreateCommitments < ActiveRecord::Migration[5.0]
  def change
    create_table :commitments do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :goal, foreign_key: true

      t.timestamps
      t.index [:goal_id, :user_id], unique: true
    end
  end
end
