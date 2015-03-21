class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]


  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.all
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    #@user = User.find(params[:id])
  end

  # GET /locations/new
  def new
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
  end
  

  # POST /locations
  # POST /locations.json
  def create
    puts params
    puts current_user
    @location = Location.new(location_params)
    @location.users << current_user
   
  
      if @location.save
        redirect_to(:action => 'index')
      else
         redirect_to(:action => 'new')
      end
  end


  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy

    @location = Location.find(params[:id])
    @location.destroy
   
   redirect_to(:action => 'index')
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:address, :latitude, :longitude, :user_id)
    end
end
