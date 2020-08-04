class SongsController < ApplicationController
  def index #conditional for whether user navigates to /aritsts/:id/songs or /songs 
    if params[:artist_id] #rails provides the artist_id param through the nested route by appending _id to the parent resources' name 
      @songs = Artist.find(params[:artist_id]).songs
    else 
      @songs = Song.all
    end
  end

  def show
    #unlinke index that will render different sets of songs based on the path, this one stays the same. 
    @song = Song.find(params[:id])
    if @song.nil?
      redirect_to artist_songs_path(@song.artist)
    end 
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name)
  end
end

