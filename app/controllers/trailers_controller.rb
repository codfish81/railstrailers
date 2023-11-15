class TrailersController < ApplicationController
  before_action :set_trailer, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, exept: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /trailers or /trailers.json
  def index
    @trailers = Trailer.all
  end

  # GET /trailers/1 or /trailers/1.json
  def show
  end

  # GET /trailers/new
  def new
    @trailer = Trailer.new
    #@trailer = current_user.trailer.build
  end

  # GET /trailers/1/edit
  def edit
  end

  # POST /trailers or /trailers.json
  def create
    @trailer = Trailer.new(trailer_params)
    #@trailer = current_user.trailer.build(trailer_params)
    respond_to do |format|
      if @trailer.save
        format.html { redirect_to trailer_url(@trailer), notice: "Trailer was successfully created." }
        format.json { render :show, status: :created, location: @trailer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @trailer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trailers/1 or /trailers/1.json
  def update
    respond_to do |format|
      if @trailer.update(trailer_params)
        format.html { redirect_to trailer_url(@trailer), notice: "Trailer was successfully updated." }
        format.json { render :show, status: :ok, location: @trailer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @trailer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trailers/1 or /trailers/1.json
  def destroy
    @trailer.destroy

    respond_to do |format|
      format.html { redirect_to trailers_url, notice: "Trailer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    #@trailer = current_user.trailer.find_by(id: params[:id])
    @trailer = Trailer.find_by(id: params[:id])
    redirect_to trailer_path, notice: "Not Authorized to Edit" if @trailer.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trailer
      @trailer = Trailer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trailer_params
      params.require(:trailer).permit(:trailer_number, :order_number, :trucking_company, :truck_number, :trailer_location, :dock_number, :live_load, :timer, :user_id)
    end
end
