class NotesController < ApplicationController
  before_action :set_note, only: [:show, :update, :destroy]

  def index
    notes = current_user.notes.order(updated_at: :desc)

    render json: notes
  end

  def create
    note = current_user.notes.create!(note_params)

    render json: note, status: :created
  end

  def show
  	render json: @note
  end

  def update
    @note.update!(note_params)

    render json: @note
  end

  def destroy
    @note.destroy!

    head :no_content
  end

  private

  def set_note
    @note = current_user.notes.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :content)
  end
end
