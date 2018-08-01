class PlantsController < ApplicationController
  def create
    @plant = Plant.new(plant_params)
    @plant.garden = Garden.find(params[:garden_id])
    @plant.save
    redirect_to garden_path(@plant.garden)
  end

  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy
    redirect_to garden_path(@plant.garden)
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :image_url)
  end
end
