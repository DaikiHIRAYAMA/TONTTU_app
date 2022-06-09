class TimersController < ApplicationController
  before_action :set_timer, only: %i[ show edit update destroy sauna_end water_start water_end outside_start outside_end update2 update3 update4 update5]
  before_action :set_sauna, only: %i[ sauna_end water_start water_end outside_start]

  before_action :authenticate_user!

  # GET /timers or /timers.json
  def index
    @timers = Timer.all
  end

  # GET /timers/1 or /timers/1.json
  def show
    @sauna = Sauna.find(1)  ##絶対修正する‼！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！
  end

  # GET /timers/new
  def new
    @timer = Timer.new
  end
  
  # POST /timers or /timers.json
  def create
    @timer = Timer.new(timer_params0)

      if @timer.save!
        redirect_to sauna_end_timer_path(@timer)

      else
        flash.now[:alert] = 'メッセージを入力してください。'
      end
  end

  def sauna_end
  end

  # PATCH/PUT /timers/1 or /timers/1.json
  def update
    @timer.update(timer_params)
    redirect_to water_start_timer_path(@timer)
  end  
  

  def water_start
  end

  def update2
    @timer.update(timer_params)
    redirect_to water_end_timer_path(@timer)
  end

  def water_end
  end

  def update3
    @timer.update(timer_params)
    redirect_to outside_start_timer_path(@timer)
  end

  def outside_start
  end

  def update4
    @timer.update(timer_params)
    redirect_to outside_end_timer_path(@timer)
  end


  def outside_end
  end

  def update5
    @timer.update(timer_params)
    redirect_to timers_path(@timer)
  end



  # GET /timers/1/edit
  def edit
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

    def set_sauna
      @sauna = Sauna.find(1)
    end

    # Only allow a list of trusted parameters through.
    def timer_params
      params.permit(:sauna_id, :sauna_start_time, :sauna_finish_time, :water_start_time, :water_finish_time, :outside_start_time, :outside_finish_time)
    end

    def timer_params0
      params.require(:timer).permit(:sauna_start_time, :sauna_id)
    end
end
