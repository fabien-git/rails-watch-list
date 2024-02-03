class AddNewForeignKeytoReviews < ActiveRecord::Migration[7.1]
  def change
    add_reference :reviews, :bookmark, foreign_key: true
  end
end
