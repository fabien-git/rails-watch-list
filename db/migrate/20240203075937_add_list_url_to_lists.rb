class AddListUrlToLists < ActiveRecord::Migration[7.1]
  def change
    add_column :lists, :poster_url, :string
  end
end
