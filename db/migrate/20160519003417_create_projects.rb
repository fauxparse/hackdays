class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name, limit: 128, required: true
      t.string :url, limit: 64, required: true
      t.string :repository_url
      t.text :description

      t.index :url
    end
  end
end
