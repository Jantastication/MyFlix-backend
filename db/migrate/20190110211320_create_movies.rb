class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.string :rated
      t.string :released
      t.string :runtime
      t.string :genre
      t.string :director
      t.text :writer
      t.text :actors
      t.text :plot
      t.string :language
      t.text :awards
      t.string :poster
      t.string :metascore
      t.string :imdbRating
      t.string :imdbID
      t.string :production
      t.string :type
      t.string :website

      t.timestamps
    end
  end
end
