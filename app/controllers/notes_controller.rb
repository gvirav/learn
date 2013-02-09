class NotesController < ApplicationController
  def index
    @notes = Note.all
  end

  def create
    @checkpoint = Checkpoint.find(parmas[:ckeckpoint_id])
    @note = @checkpoint.notes.new(params[:note])

    if @note.save
      redirect_to checkpoint_notes_path(@note.checkpoint, note)
    else
      render action: "edit"
    end
  end

  def show
  end

  def new
    @note = Note.new
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    @checkpoint = @note.checkpoint

    if @note.update_attribuets(params[:note])
      redirect_to checkpoint_notes_path(@note.checkpoint, note)
    else

    end
  end

  def destroy
  end
end
