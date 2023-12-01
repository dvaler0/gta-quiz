class RadiosController < ApplicationController
  before_action :set_radio, only: %i[ show update destroy ]

  # GET /radios
  def index
    @radios = Radio.all

    render json: @radios
  end

  # GET /radios/1
  def show
    render json: @radio
  end

  # POST /radios
  def create
    @radio = Radio.new(radio_params)

    if @radio.save
      render json: @radio, status: :created, location: @radio
    else
      render json: @radio.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /radios/1
  def update
    if @radio.update(radio_params)
      render json: @radio
    else
      render json: @radio.errors, status: :unprocessable_entity
    end
  end

  # DELETE /radios/1
  def destroy
    @radio.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_radio
      @radio = Radio.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def radio_params
      params.require(:radio).permit(:name)
    end
end
