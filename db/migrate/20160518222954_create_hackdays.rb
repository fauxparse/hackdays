class CreateHackdays < ActiveRecord::Migration[5.0]
  def change
    create_table :hackdays do |t|
      t.date :start_date
      t.date :end_date

      t.timestamps

      t.index [:start_date, :end_date], unique: true
    end
  end
end
