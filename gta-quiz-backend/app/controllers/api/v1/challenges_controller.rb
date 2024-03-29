class Api::V1::ChallengesController < ApplicationController
  before_action :set_challenge, only: %i[ show update destroy ]

  # GET /challenges
  def index
    @challenges = Challenge.all

    render json: @challenges
  end

  # GET /challenges/1
  def show
    render json: @challenge
  end

  # POST /challenges
  def create

    @challenge = Challenge.new(challenge_params)
    @challenge.date = DateTime.now

    if @challenge.save
      render status: :ok, json: { 'challenge' => @challenge }
    else
      render json: @challenge.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /challenges/1
  def update
    if @challenge.update(challenge_params)
      render json: @challenge
    else
      render json: @challenge.errors, status: :unprocessable_entity
    end
  end

  # DELETE /challenges/1
  def destroy
    @challenge.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_challenge
      @challenge = Challenge.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def challenge_params
      params.require(:challenge).permit(:date, :song_id)
    end
end
