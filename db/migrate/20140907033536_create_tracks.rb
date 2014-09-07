class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name
      t.string :album
      t.string :artist
      t.string :youtube_url
      t.string :preview_url

      t.timestamps
    end
  end
end
