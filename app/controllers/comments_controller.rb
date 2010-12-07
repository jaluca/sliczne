class CommentsController < ApplicationController
  
  def new
    @comment = Note.find(params[:note_id]).comments.new
  end

   def create
     note = Note.find(params[:note_id])
     note.comments.create(params[:comment])
     redirect_to notes_path
   end

   def index
     @comments = Comment.all
   end

   def show
     @comment = Comment.find(params[:id])
   end
end