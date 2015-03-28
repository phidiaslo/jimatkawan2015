class ShiplocationsController < ApplicationController
  before_action :set_shiplocation, only: [:show, :edit, :update, :destroy]

  # GET /shiplocations
  # GET /shiplocations.json
  def index
    @shiplocations = Shiplocation.all
  end

  # GET /shiplocations/1
  # GET /shiplocations/1.json
  def show
  end

  # GET /shiplocations/new
  def new
    @shiplocation = Shiplocation.new
  end

  # GET /shiplocations/1/edit
  def edit
  end

  # POST /shiplocations
  # POST /shiplocations.json
  def create
    @shiplocation = Shiplocation.new(shiplocation_params)

    respond_to do |format|
      if @shiplocation.save
        format.html { redirect_to @shiplocation, notice: 'Shiplocation was successfully created.' }
        format.json { render :show, status: :created, location: @shiplocation }
      else
        format.html { render :new }
        format.json { render json: @shiplocation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shiplocations/1
  # PATCH/PUT /shiplocations/1.json
  def update
    respond_to do |format|
      if @shiplocation.update(shiplocation_params)
        format.html { redirect_to @shiplocation, notice: 'Shiplocation was successfully updated.' }
        format.json { render :show, status: :ok, location: @shiplocation }
      else
        format.html { render :edit }
        format.json { render json: @shiplocation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shiplocations/1
  # DELETE /shiplocations/1.json
  def destroy
    @shiplocation.destroy
    respond_to do |format|
      format.html { redirect_to shiplocations_url, notice: 'Shiplocation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shiplocation
      @shiplocation = Shiplocation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shiplocation_params
      params.require(:shiplocation).permit(:country, :price, :cost, :listing_id)
    end
end
