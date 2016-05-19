class AddUrlToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :url, :string, limit: 64, index: true
  end
end
