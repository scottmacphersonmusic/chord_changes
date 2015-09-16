class ChordsController < ApplicationController
  def show
    @chord = Chord.find(params[:id])
  end

  def new
    @chord = Chord.new
    @song = Song.find(params[:song_id])
  end

  def create
    @song = Song.find(params[:song_id])
    @chord = @song.chords.build(chord_params)
    if @chord.save
      flash[:notice] = "Chord successfully created!"
      redirect_to @song
    else
      render 'new'
    end
  end

  def edit
  end

  private

  def chord_params
    params.require(:chord).permit(:pitch, :quality, :measure, :sequence)
  end
end
