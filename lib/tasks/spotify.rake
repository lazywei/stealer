namespace :spotify do
  desc 'Get the tracks of a playlist'
  task :get_tracks => :environment do
    RSpotify.authenticate('56fe98aeca324abf81f11501c66e2844', '2b6d58e4926047bdbe90667bbc766e9e')

    playlist_id = '4hOKQuZbraPDIfaGbM3lKI'

    playlist = RSpotify::Playlist.find('spotify', playlist_id)

    pl = Playlist.where(spotify_id: playlist_id).first

    pl ||= Playlist.create do |x|
      x.name = playlist.name
      x.spotify_id = playlist_id
    end

    pl.tracks.destroy_all

    playlist.tracks.each do |track|
      pl.tracks << Track.create! do |x|
        x.name = track.name
        x.album = track.album.name
        x.artist = track.artists.first.name
        x.preview_url = track.preview_url
      end
    end
  end
end
