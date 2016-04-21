class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :mentor_id
      t.integer :mentee_id
      t.integer :rating
      t.text :body

      t.timestamps null: false
    end
  end
end
