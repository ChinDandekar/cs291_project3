class AddAuthorToPosts < ActiveRecord::Migration[7.2]
  def change
    add_reference :posts, :author, null: false, foreign_key: true
  end
end
