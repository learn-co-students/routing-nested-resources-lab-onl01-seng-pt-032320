class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  class ArtistNotFound < StandardError; end
  class SongNotFound < StandardError; end
  class ArtistSongNotFound < StandardError; end
  rescue_from ArtistNotFound, with: :artist_not_found
  rescue_from SongNotFound, with: :song_not_found
  rescue_from ArtistSongNotFound, with: :artist_song_not_found

  private
  def artist_song_not_found
    flash[:alert] = "Song not found for that artist"
    redirect_to artist_songs_path
  end
  def song_not_found
    flash[:alert] = "Song not found"
    redirect_to songs_path
  end
  def artist_not_found
    flash[:alert] = "Artist not found"
    redirect_to artists_path
  end
end
