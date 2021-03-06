class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
  end

  def show
    @chords = @song.chords
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    respond_to do |format|
      if @song.save
        format.html { redirect_to @song, notice: "New song created!" }
        format.js
      else
        format.html { render 'new' }
        format.js do
          unless @song.save
            render text: @song.errors.full_messages.join,
                   status: :unprocessable_entity
          end
        end
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to @song, notice: "Song successfully updated!" }
        format.js
      else
        format.html { render 'edit' }
        format.js do
          unless @song.save
            render text: @song.errors.full_messages.join,
                   status: :unprocessable_entity
          end
        end
      end
    end
  end

  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_url, notice: "Song successfully deleted!" }
      format.js
    end
  end

  private

  def song_params
    params.require(:song).permit(:title, :composer)
  end

  def set_song
    @song = Song.find(params[:id])
  end
end
