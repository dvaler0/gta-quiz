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

    return render status: :ok, json: { 'game over' => 'no tienes vidas' } if @result.lives === 0
    return render status: :ok, json: { 'victory' => 'ganaste' } if result_params[:solution].eql?'a'
    @result.lives -= 1 if !result_params[:solution].eql?'a'

    # if result_params[:solution].eql?'a'
    #   if @result.lives === 0
    #     return render status: :ok, json: { 'game over' => 'respuesta correcta pero no tienes vidas' }
    #   end
    #   return render status: :ok, json: { 'ganaste' => 'enhorabuena!' }
    # end

    # if !result_params[:solution].eql?'a'
    #   if @result.lives === 0
    #     return render status: :ok, json: { 'game over' => 'respuesta incorrecta, además no tienes vidas' }
    #   end

    #   if @result.lives > 0
    #     return render status: :ok, json: { 'mal' => 'respuesta' }
    #   end
    # end
    
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
