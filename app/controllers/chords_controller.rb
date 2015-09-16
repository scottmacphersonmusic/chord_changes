class ChordsController < ApplicationController
  before_action :set_song
  before_action :set_chord, only: [:show, :edit]

  def show
  end

  def new
    @chord = Chord.new
  end

  def create
    @chord = @song.chords.build(chord_params)
    if @chord.save
      flash[:notice] = "Chord successfully created!"
      redirect_to song_chord_path(@song, @chord)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @chord = @song.chords.build(chord_params)
    if @chord.save
      flash[:notice] = "Chord successfully updated!"
      redirect_to song_chord_path(@song, @chord)
    else
      render 'edit'
    end
  end

  private

  def chord_params
    params.require(:chord).permit(:pitch, :quality, :measure, :sequence)
  end

  def set_song
    @song = Song.find(params[:song_id])
  end

  def set_chord
    @chord = Chord.find(params[:id])
  end
end
