class SpicesController < ApplicationController

# GET /spices
def index
  spices = Spice.all
  render json: spices
end

# POST /spices
def create
  spice = Spice.create(spices_params)
  render json: spice, status: :created
end

# PATCH
def update
  spice = Spice.find_by(id: params[:id])
  if spice
    spice.update(spices_params)
    render json: spice
  else
    render json: {error: 'spice not found'}, status: :not_found
  end
end

# DELETE /spices/:id
def destroy
  spice = Spice.find_by(id: params[:id])
  if spice
    spice.destroy
    head :no_content
  else
    render json:{error: "Spice not found"}, status: :not_found
  end

end

private

def spices_params
  params.permit(:title, :image, :description, :notes, :rating)
end

end
