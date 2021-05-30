class NotesController < ApplicationController
  def index
    render json: Note.all.order(:created_at)
  end

  def create
    note = Note.new(
      body: params[:body]
    )
    note.save
    render json: note
  end

  def show
    render json: Note.find(params[:id])
  end

  def update
    note = Note.find_by(index: params[:index])
    note.body = params[:body] || note.body
    note.save
    render json: { message: "Note updated successfully", body: note }
  end

  def update_index
    notes = Note.all.order(:created_at)
    i = 1
    notes.each do |note|
      note.index = i
      note.save
      i += 1
    end
  end

  
  def destroy
    note = Note.find_by(index: params[:index])
    note.destroy
    render json: { message: "Note destroyed successfully!"}
  end
end
