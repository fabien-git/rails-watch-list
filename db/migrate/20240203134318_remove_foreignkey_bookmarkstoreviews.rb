class RemoveForeignkeyBookmarkstoreviews < ActiveRecord::Migration[7.1]
  def change
    remove_reference :reviews, :bookmarks, foreign_key: true, index: false
  end
end
