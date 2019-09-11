class FloorsController < ApplicationController
  before_action :set_building, except: [:index]
  before_action :set_floor, only: [:show, :edit, :update, :destroy]

  # GET /floors
  # GET /floors.json
  def index
    @building = Building.includes(:floors).find(params[:building_id])
    @floors = @building.floors
  end

  # GET /floors/1
  # GET /floors/1.json
  def show
  end

  # GET /floors/new
  def new
    @floor = @builidng.floors.new
  end

  # GET /floors/1/edit
  def edit
  end

  # POST /floors
  # POST /floors.json
  def create
    @floor = @building.floors.new(floor_params)
    authorize @floor
    respond_to do |format|
      if @floor.save

        # format.html redirect_to :back, notice: 'Floor was successfully created.'
        format.html { redirect_to @building, notice: "Floor was successfully created." }
        format.json { render :show, status: :created, location: @floor }
      else
        format.html { redirect_to @building }
        format.json { render json: @floor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /floors/1
  # PATCH/PUT /floors/1.json
  def update
    respond_to do |format|
      if @floor.update(floor_params)
        format.html { redirect_to [@building, @floor], notice: "Floor was successfully updated." }
        format.json { render :show, status: :ok, location: @floor }
      else
        format.html { render :edit }
        format.json { render json: @floor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /floors/1
  # DELETE /floors/1.json
  def destroy
    @floor.destroy
    respond_to do |format|
      format.html { redirect_to [@building, @floor], notice: "Floor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_building
    @building = Building.find(params[:building_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_floor
    @floor = @building.floors.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def floor_params
    params.require(:floor).permit(:label, :building_id, :floor_image)
  end
end
