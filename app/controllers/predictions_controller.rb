class PredictionsController < ApplicationController
  before_action :set_prediction, only: [:show, :edit, :update, :destroy]

  # GET /predictions
  # GET /predictions.json
  def index
    @current = 1
    @predictions = Prediction.all
  end

  def user
    @predictions = Prediction.where(user_id: current_user.id)
    @predictions.each do |prediction|
      prediction.score = 0;
      @schedules = Schedule.where(week: prediction.week, game: 1)
      @schedules.each do |schedule|
        if schedule.winner === prediction.game1
          prediction.score += 1
        end
      end
      @schedules = Schedule.where(week: prediction.week, game: 2)
      @schedules.each do |schedule|
        if schedule.winner === prediction.game2
          prediction.score += 1
        end
      end
      @schedules = Schedule.where(week: prediction.week, game: 3)
      @schedules.each do |schedule|
        if schedule.winner === prediction.game2
          prediction.score += 1
        end
      end
    end
  end

  # GET /predictions/1
  # GET /predictions/1.json
  def show
  end

  # GET /predictions/new
  def new
    @current = 1
    @prediction = Prediction.new
  end

  # GET /predictions/1/edit
  def edit
    @current = @prediction.week
  end

  # POST /predictions
  # POST /predictions.json
  def create
    @prediction = Prediction.new(prediction_params)

    respond_to do |format|
      if @prediction.save
        format.html { redirect_to user_predictions_url, notice: 'Prediction was successfully created.' }
        format.json { render action: 'show', status: :created, location: @prediction }
      else
        format.html { render action: 'new' }
        format.json { render json: @prediction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /predictions/1
  # PATCH/PUT /predictions/1.json
  def update
    respond_to do |format|
      if @prediction.update(prediction_params)
        format.html { redirect_to user_predictions_url, notice: 'Prediction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @prediction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /predictions/1
  # DELETE /predictions/1.json
  def destroy
    @prediction.destroy
    respond_to do |format|
      format.html { redirect_to user_predictions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prediction
      @prediction = Prediction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prediction_params
      params.require(:prediction).permit(:week, :week_score, :user_id, :score, :game1, :game2, :game3, :game4, :game5, :game6, :game7, :game8, :game9, :game10, :game11, :game12, :game13, :game14, :game15, :game16)
    end
end
