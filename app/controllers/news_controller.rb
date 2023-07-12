class NewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_new, only: %i[ show edit update destroy ]
  before_action only: [:new, :create, :edit, :update] do
    authorize_request(["author", "admin"])
   end
   before_action only: [ :destroy] do
    authorize_request(["admin"])
   end
  # GET /news or /news.json
  def index
    @news = New.all
  end

  # GET /news/1 or /news/1.json
  def show
  end

  # GET /news/new
  def new
    @new = New.new
    #@new.comments.build
  end

  # GET /news/1/edit
  def edit
  end

  # POST /news or /news.json
  def create
    @new = New.new(new_params)
    @new.user = current_user #o @new.user_id = current_user.id
    respond_to do |format|
      if @new.save
        format.html { redirect_to new_url(@new), notice: "New was successfully created." }
        format.json { render :show, status: :created, location: @new }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @new.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /news/1 or /news/1.json
  def update
    respond_to do |format|
      if @new.update(new_params)
        format.html { redirect_to new_url(@new), notice: "New was successfully updated." }
        format.json { render :show, status: :ok, location: @new }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @new.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news/1 or /news/1.json
  def destroy
    @new.destroy

    respond_to do |format|
      format.html { redirect_to news_url, notice: "New was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_new
      @new = New.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def new_params
      params.require(:new).permit(:tittle, :description,comments_attributes: [:id, :content, :created_at, :_destroy])
    end
end
