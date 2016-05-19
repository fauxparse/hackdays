class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.belongs_to :hackday, foreign_key: true
      t.belongs_to :project, foreign_key: true
      t.text :aim
      t.text :help_required

      t.timestamps
    end
  end
end
