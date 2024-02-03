class AddForeignKeyToBookmarks < ActiveRecord::Migration[7.1]
  def change
    add_reference :bookmarks, :reviews, foreign_key: true
  end
end
