class AddForeignKeytoReviews < ActiveRecord::Migration[7.1]
  def change
    add_reference :reviews, :bookmarks, foreign_key: true
  end
end
