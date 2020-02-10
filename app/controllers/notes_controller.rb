class NotesController < ApplicationController
  before_action :set_book, only: [:edit, :update, :destroy]
  before_action :set_note, only: [:edit, :update, :destroy]

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = @book.notes.new(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Set Book for the current user
    def set_book
      @book ||= Books.find_by(id: params[:book_id])
    end

    # Set Note for the current user and book_id
    def set_note
      @note ||= @book.notes.find_by(id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.fetch(:note, {}).permit(:title, :note)
    end
end
