class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      flash[:success] = "New song created!"
      redirect_to @song
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @song.update(song_params)
      redirect_to @song, notice: "Song successfully updated!"
    else
      render 'edit'
    end
  end

  def destroy
    @song.destroy
    redirect_to songs_url, notice: "Song successfully deleted!"
  end

  private

  def song_params
    params.require(:song).permit(:title, :composer)
  end

  def set_song
    @song = Song.find(params[:id])
  end
end
