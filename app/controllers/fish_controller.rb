class FishController < ApplicationController
  before_action :set_fish, only: %i[show edit update destroy]

  # GET /fish or /fish.json
  def index
    @fish = Fish.all
    # Search by Name
    @fish = @fish.where('name LIKE ?', "%#{params[:query]}%") if params[:query].present?
    # Filter by Water Type
    @fish = @fish.where(water_type: params[:water_type]) if params[:water_type].present?
    # Sort by Price
    sort_order = params[:sort_order] || "asc"
    @fish = @fish.order(price: sort_order)
  end

  # GET /fish/1 or /fish/1.json
  def show
  end

  # GET /fish/new
  def new
    @fish = Fish.new
  end

  # GET /fish/1/edit
  def edit
  end

  # POST /fish or /fish.json
  def create
    @fish = Fish.new(fish_params)

    Rails.logger.debug "Creating fish: Image attached? #{@fish.image.attached?}"

    respond_to do |format|
      if @fish.save
        Rails.logger.debug("Attached image successfully: #{@fish.image.attached?}")
        Rails.logger.debug("Image blob: #{@fish.image.blob.inspect if @fish.image.attached?}")
        format.html { redirect_to fish_url(@fish), notice: "Fish was successfully created." }
        format.json { render :show, status: :created, location: @fish }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fish.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fish/1 or /fish/1.json
  def update
    Rails.logger.debug "Updating fish: Image attached? Before update: #{@fish.image.attached?}"
  
    respond_to do |format|
      if fish_params[:image].present?
        Rails.logger.debug "New image detected: #{fish_params[:image].original_filename}"
      end
  
      if @fish.update(fish_params)
        Rails.logger.debug "Update successful. Image attached after update? #{@fish.image.attached?}"
        format.html { redirect_to fish_url(@fish), notice: "Fish was successfully updated." }
        format.json { render :show, status: :ok, location: @fish }
      else
        Rails.logger.debug "Update failed: #{@fish.errors.full_messages.join(', ')}"
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fish/1 or /fish/1.json
  def destroy
    Rails.logger.debug("Destroying fish: #{@fish.id}")
    @fish.destroy
    respond_to do |format|
      format.html { redirect_to fish_index_url, notice: "Fish was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_fish
    @fish = Fish.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def fish_params
    params.require(:fish).permit(:name, :price, :species, :size, :water_type, :quantity, :description, :image)
  end
end
