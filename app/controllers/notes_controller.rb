class NotesController < ApplicationController
  before_filter :authenticate_user!, except: :index
  before_filter :owner, only: [:edit, :update, :destroy]

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
    redirect_to checkpoint_path(@note.checkpoint)
  end

  private
  def owner
    if !user_signed_in? || current_user != Goal.find(params[:id]).user
      redirect_to goals_path, error: "Permission denied!"
    end
  end
end
