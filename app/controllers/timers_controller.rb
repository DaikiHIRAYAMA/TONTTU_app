class TimersController < ApplicationController
  before_action :set_timer, only: %i[ show edit update destroy ]

  # GET /timers or /timers.json
  def index
    @timers = Timer.all
  end

  # GET /timers/1 or /timers/1.json
  def show
  end

  # GET /timers/new
  def new
    @timer = Timer.new
    @timer.sauna_start_time = DateTime.now
  end

  def sauna_end
    @timer = Timer.final
    @timer.sauna_finish_time = DateTime.now
  end

  def water_start
    @timer = Timer.final
    @timer.water_start_time = DateTime.now
  end

  def water_end
    @timer = Timer.final
    @timer.water_finish_time = DateTime.now
  end

  def outside_start
    @timer = Timer.final
    @timer.outside_start_time = DateTime.now
  end

  def outside_end
    @timer = Timer.final
    @timer.outside_finish_time = DateTime.now

  end

  # GET /timers/1/edit
  def edit
  end

  # POST /timers or /timers.json
  def create
    @timer = Timer.new(timer_params)

      if @timer.save
        redirect_to(new_timer_path)
      else
        flash.now[:alert] = 'メッセージを入力してください。'
      end
    end

  # PATCH/PUT /timers/1 or /timers/1.json
  def update
    respond_to do |format|
      if @timer.update(timer_params)
        format.html { redirect_to timer_url(@timer), notice: "Timer was successfully updated." }
        format.json { render :show, status: :ok, location: @timer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @timer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timers/1 or /timers/1.json
  def destroy
    @timer.destroy

    respond_to do |format|
      format.html { redirect_to timers_url, notice: "Timer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timer
      @timer = Timer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def timer_params
      params.fetch(:timer, {})
    end
end
