class RemoveAgainForeignKeyToReviews < ActiveRecord::Migration[7.1]
  def change
    remove_reference :reviews, :bookmark, foreign_key: true, index: false
  end
end
