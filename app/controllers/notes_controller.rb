class NotesController < ApplicationController
  def index
    @notes = Note.all
  end

  def new
    @checkpoint = Checkpoint.find(params[:checkpoint_id])
    @note = Note.new
  end

  def create
    @checkpoint = Checkpoint.find(params[:checkpoint_id])
    @note = @checkpoint.notes.new(params[:note])

    if @note.save
      redirect_to checkpoint_path(@checkpoint)
    else
      render action: "edit"
    end
  end

  def show
    @note = Note.find(params[:id])
  end

  def edit
    @checkpoint = Checkpoint.find(params[:checkpoint_id])
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    @checkpoint = @note.checkpoint

    if @note.update_attributes(params[:note])
      redirect_to checkpoint_note_path(@note)
    else
      render action: "edit"
    end
  end

  def destroy
    @note = Note.find(parmas[:id])
    @note.destroy
    if @note.destroy
      redirect_to checkpoint_notes_path(@note.checkpoint, note)
    else
      redirect_to :back
    end
  end
end
