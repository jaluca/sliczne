class NotesController < ApplicationController
  before_filter :load_note, :except => [:new, :index, :create]
  attr_reader :per_page
  
  def new
    @note = Note.new
  end
  
  def create
    @note = Note.new(params[:note])
    if @note.save
      flash[:notice] = "Twoja notka została dodana pomyślnie"
      redirect_to notes_path
    else
      render :action => :new
    end
  end
  
  def index
    @search = Note.search(params[:search])
    @notes = @search.paginate(:page => params[:page], :per_page => 3)
  end
  
  def destroy
     @note.destroy
     redirect_to notes_path
  end
  
  private
    def load_note
  	  @note = Note.find(params[:id])
    end
end