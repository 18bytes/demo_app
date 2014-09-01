class MicorpostsController < ApplicationController
  before_action :set_micorpost, only: [:show, :edit, :update, :destroy]

  # GET /micorposts
  # GET /micorposts.json
  def index
    @micorposts = Micorpost.all
  end

  # GET /micorposts/1
  # GET /micorposts/1.json
  def show
  end

  # GET /micorposts/new
  def new
    @micorpost = Micorpost.new
  end

  # GET /micorposts/1/edit
  def edit
  end

  # POST /micorposts
  # POST /micorposts.json
  def create
    @micorpost = Micorpost.new(micorpost_params)

    respond_to do |format|
      if @micorpost.save
        format.html { redirect_to @micorpost, notice: 'Micorpost was successfully created.' }
        format.json { render :show, status: :created, location: @micorpost }
      else
        format.html { render :new }
        format.json { render json: @micorpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /micorposts/1
  # PATCH/PUT /micorposts/1.json
  def update
    respond_to do |format|
      if @micorpost.update(micorpost_params)
        format.html { redirect_to @micorpost, notice: 'Micorpost was successfully updated.' }
        format.json { render :show, status: :ok, location: @micorpost }
      else
        format.html { render :edit }
        format.json { render json: @micorpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /micorposts/1
  # DELETE /micorposts/1.json
  def destroy
    @micorpost.destroy
    respond_to do |format|
      format.html { redirect_to micorposts_url, notice: 'Micorpost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_micorpost
      @micorpost = Micorpost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def micorpost_params
      params.require(:micorpost).permit(:content, :user_id)
    end
end
