class Api::V1::ResultsController < ApplicationController
  before_action :set_result, only: %i[ show update destroy ]

  # GET /results
  def index
    @results = Result.all

    render json: @results
  end

  # GET /results/1
  def show
    render json: @result
  end

  # POST /results
  def create
    @result = Result.new(result_params)
    @result.lives = 5
   
    if @result.save
      render status: :ok, json: { 'result' => @result }
    else
      render json: @result.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /results/1
  def update

    if result_params[:solution].eql?'a'
      return render status: :ok, json: { 'bien' => 'bien' }
    end

    if @result.lives > 0
      if !result_params[:solution].eql?'a'
        @result.lives -= 1
      end
    end
    
    if @result.update(result_params)
      render json: @result
    else
      render json: @result.errors, status: :unprocessable_entity
    end
    
  end

  # DELETE /results/1
  def destroy
    @result.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = Result.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def result_params
      params.require(:result).permit(:lives, :challenge_id, :solution)
    end
end
