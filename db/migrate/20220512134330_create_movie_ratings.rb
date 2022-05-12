class CreateMovieRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :movie_ratings do |t|
      t.references :movie, null: false, foreign_key: true
      t.string :rating

      t.timestamps
    end
  end
end
