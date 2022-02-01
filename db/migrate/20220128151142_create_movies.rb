class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :image
      t.string :name
      t.text :description
      t.integer :rating

      t.timestamps
    end
  end
end
