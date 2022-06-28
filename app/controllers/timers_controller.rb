class TimersController < ApplicationController
  before_action :set_timer, only: %i[ show edit update destroy sauna_end water_start water_end outside_start outside_end update2 update3 update4 update5]
  before_action :set_sauna, only: %i[ new create sauna_end water_start water_end outside_start]
  before_action :set_user, only: %i[ new create sauna_end water_start water_end outside_start]

  before_action :authenticate_user!

  # GET /timers or /timers.json
  def index
     @timers = Timer.where(user_id: current_user.id)
   # @timers = Timer.all
  end

  # GET /timers/1 or /timers/1.json
  def show
    @sauna = Sauna.find(@timer.sauna_id) 
  end

  # GET /timers/new
  def new
    @timer = Timer.new
    render :layout => false

  end
  
  # POST /timers or /timers.json
  def create
    @timer = Timer.new(timer_params)

      if @timer.save!

        redirect_to sauna_end_timer_path(@timer)

      else
        flash.now[:alert] = 'メッセージを入力してください。'
      end
  end

  def sauna_end
    render :layout => false
  end

  # PATCH/PUT /timers/1 or /timers/1.json
  def update
    @timer.update(timer_params)
    redirect_to water_start_timer_path(@timer)
  end  
  

  def water_start
    render :layout => false
  end

  def update2
    @timer.update(timer_params)
    redirect_to water_end_timer_path(@timer)
  end

  def water_end
    render :layout => false
  end

  def update3
    @timer.update(timer_params)
    redirect_to outside_start_timer_path(@timer)
  end

  def outside_start
    render :layout => false
  end

  def update4
    @timer.update(timer_params)
    redirect_to outside_end_timer_path(@timer)
  end


  def outside_end
    render :layout => false
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
      @sauna = Sauna.where(user_id: current_user.id).last
    end
    
    def set_user
      @user = current_user
    end

    # Only allow a list of trusted parameters through.

    def timer_params
      params.require(:timer).permit(:sauna_start_time, :sauna_id, :id , :user_id, :sauna_finish_time, :water_start_time, :water_finish_time, :outside_start_time, :outside_finish_time)
    end
    

    def sauna_params
      params.permit(:sauna_id)
    end


end