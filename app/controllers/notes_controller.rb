class NotesController < ApplicationController
  def index
    @notes = Note.all
  end

  def new
    @checkpoint = Checkpoint.find(params[:checkpoint_id])
    @note = Note.new
  end

  def edit
    @checkpoint = Checkpoint.find(params[:checkpoint_id])
    @note = Note.find(params[:id])
  end

  def create
    @checkpoint = Checkpoint.find(params[:checkpoint_id])
    @note = @checkpoint.notes.new(params[:note])

    if @note.save
      redirect_to checkpoint_note_path(@checkpoint, @note)
    else
      render action: "index", notice: "Could not create."
    end
  end

  def show
    @checkpoint = Checkpoint.find(params[:checkpoint_id])
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    @checkpoint = @note.checkpoint

    if @note.update_attributes(params[:note])
      redirect_to checkpoint_note_path(@note.checkpoint, @note)
    else
      render action: "edit"
    end
  end

  def destroy
    @checkpoint = Checkpoint.find(params[:checkpoint_id])
    @note = Note.find(params[:id])
    @note.destroy
    # after note deletion, redirect to checkpoint
    # to which note belonged
    redirect_to checkpoint_path(@note.checkpoint)
  end
end
