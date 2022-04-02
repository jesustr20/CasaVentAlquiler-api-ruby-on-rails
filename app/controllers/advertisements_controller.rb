class AdvertisementsController < ApplicationController
  before_action :require_login!

  #GET/advertisment
  def index
    @advertisments = Advertisement.all
    render json: @advertisments
  end

  def show
    @advertisment = Advertisment.find(params[:id])
    render json: @advertisment
  end

  def create
    @advertisment = current_user.advertisments.new(advertisment_params)

    if @advertisment.save
      render json: @advertisment, status: :created
    else
      render json: {errors: @advertisment.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    if @advertisment.update(advertisment_params)
      render json: @advertisment
    else
      render json: {errors: @advertisment.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @advertisment = current_user.advertisment.find(params[:id])
    @advertisment.destroy
  end

  def advertisment_params
    params.require(:advertisment).permit(:operation_type, :usd_price, :pen_price, :maintenance, :photos, :videos, :views_counter, :favorites_counter)
  end
end
