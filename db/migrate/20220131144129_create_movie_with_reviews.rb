class CreateMovieWithReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :movie_with_reviews do |t|

      t.timestamps
    end
  end
end
