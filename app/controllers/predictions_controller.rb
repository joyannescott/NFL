class PredictionsController < ApplicationController
  before_action :set_prediction, only: [:show, :edit, :update, :destroy]
  before_action :calculate_score, only: [:user, :index, :leaders]

  # GET /predictions
  # GET /predictions.json
  def index
    @current = current_week
    @predictions = Prediction.all
  end

  def leaders
    @predictions = Prediction.all
    @users = User.order(score: :desc)
  end

  def user
    @current = current_week
    @predictions = Prediction.where(user_id: current_user.id)
   end

  # GET /predictions/1
  # GET /predictions/1.json
  def show
  end

  # GET /predictions/new
  def new
    @current = current_week
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
    
    def current_week
      2
    end

     def calculate_score
      @users = User.all
      @users.each do |user|
        user.score = 0
        @predictions = Prediction.where(user_id: user.id)
        @predictions.each do |prediction|
          prediction.score = 0
          @schedules = Schedule.where(week: prediction.week, game: 1)
          @schedules.each do |schedule|
            if schedule.winner === prediction.game1
              prediction.score += schedule.value
            end
          end
          @schedules = Schedule.where(week: prediction.week, game: 2)
          @schedules.each do |schedule|
            if schedule.winner === prediction.game2
              prediction.score += schedule.value
            end
          end
          @schedules = Schedule.where(week: prediction.week, game: 3)
          @schedules.each do |schedule|
            if schedule.winner === prediction.game3
              prediction.score += schedule.value
            end
          end
          @schedules = Schedule.where(week: prediction.week, game: 4)
          @schedules.each do |schedule|
            if schedule.winner === prediction.game4
              prediction.score += schedule.value
            end
          end
          @schedules = Schedule.where(week: prediction.week, game: 5)
          @schedules.each do |schedule|
            if schedule.winner === prediction.game5
              prediction.score += schedule.value
            end
          end
          @schedules = Schedule.where(week: prediction.week, game: 6)
          @schedules.each do |schedule|
            if schedule.winner === prediction.game6
              prediction.score += schedule.value
            end
          end
          @schedules = Schedule.where(week: prediction.week, game: 7)
          @schedules.each do |schedule|
            if schedule.winner === prediction.game7
              prediction.score += schedule.value
            end
          end
          @schedules = Schedule.where(week: prediction.week, game: 8)
          @schedules.each do |schedule|
            if schedule.winner === prediction.game8
              prediction.score += schedule.value
            end
          end
          @schedules = Schedule.where(week: prediction.week, game: 9)
          @schedules.each do |schedule|
            if schedule.winner === prediction.game9
              prediction.score += schedule.value
            end
          end
          @schedules = Schedule.where(week: prediction.week, game: 10)
          @schedules.each do |schedule|
            if schedule.winner === prediction.game10
              prediction.score += schedule.value
            end
          end
          @schedules = Schedule.where(week: prediction.week, game: 11)
          @schedules.each do |schedule|
            if schedule.winner === prediction.game11
              prediction.score += schedule.value
            end
          end
          @schedules = Schedule.where(week: prediction.week, game: 12)
          @schedules.each do |schedule|
            if schedule.winner === prediction.game12
              prediction.score += schedule.value
            end
          end
          @schedules = Schedule.where(week: prediction.week, game: 13)
          @schedules.each do |schedule|
            if schedule.winner === prediction.game13
              prediction.score += schedule.value
            end
          end
          @schedules = Schedule.where(week: prediction.week, game: 14)
          @schedules.each do |schedule|
            if schedule.winner === prediction.game14
              prediction.score += schedule.value
            end
          end
          @schedules = Schedule.where(week: prediction.week, game: 15)
          @schedules.each do |schedule|
            if schedule.winner === prediction.game15
              prediction.score += schedule.value
            end
          end
          @schedules = Schedule.where(week: prediction.week, game: 16)
          @schedules.each do |schedule|
            if schedule.winner === prediction.game16
              prediction.score += schedule.value
            end
          end
          user.score += prediction.score
          prediction.save
        end
        user.save
      end
    end

end
