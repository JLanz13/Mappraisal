class CreateMovieWithReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :movie_with_reviews do |t|
      t.belong_to :movie, null: false, foreign_key: true
      t.belong_to :review, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
