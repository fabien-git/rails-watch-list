class RemoveForeignkeyBookmarks < ActiveRecord::Migration[7.1]
  def change
    remove_reference :bookmarks, :reviews, foreign_key: true, index: false
  end
end
