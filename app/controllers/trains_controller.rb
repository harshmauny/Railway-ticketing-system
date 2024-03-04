class TrainsController < ApplicationController
  before_action :set_train, only: %i[ show edit update destroy ], except: [:search_train]

  # GET /trains or /trains.json
  def index
    @trains = Train.all
      # get/calculate the train ratings
      @trains.each do |train|
        if Review.where(train_id: train.id).count > 0
          train.rating = Review.where(train_id: train.id).sum(:rating) / Review.where(train_id: train.id).count
          train.update_column(:rating, train.rating)
        end
      end
  end

  # GET /trains/1 or /trains/1.json
  def show
      end

  # GET /trains/new
  def new
        @train = Train.new
  end

  # GET /trains/1/edit
  def edit
      end

  # POST /trains or /trains.json
  def create
    @train = Train.new(train_params)
    
    respond_to do |format|
      if @train.save
        format.html { redirect_to train_url(@train), notice: "Train was successfully created." }
        format.json { render :show, status: :created, location: @train }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @train.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trains/1 or /trains/1.json
  def update
        respond_to do |format|
      if @train.update(train_params)
        format.html { redirect_to train_url(@train), notice: "Train was successfully updated." }
        format.json { render :show, status: :ok, location: @train }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @train.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trains/1 or /trains/1.json
  def destroy

    @train.destroy
    respond_to do |format|
      format.html { redirect_to trains_url, notice: "Train was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def filter
    # train filter
    departure_st = params[:departure_st]
    terminal_st = params[:terminal_st]
    rating = params[:rating]
    @trains = Train.all
    if departure_st.present?
      @trains = @trains.where(departure_st: departure_st)
    end
    if terminal_st.present?
      @trains = @trains.where(terminal_st: terminal_st)
    end
    if rating.present?
      @trains = @trains.where('rating >=?', rating)
    end
    render 'index'
  end

  def search_train
    # search booked passengers based on train number - only for admin
    train_num = params[:train_num]
    @train = Train.find_by_train_num(train_num)
    if @train.present?
      @tickets = Ticket.where(train_id: @train.id)
    else
      @tickets = []
    end
    render 'trains/search_train'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_train
      @train = Train.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def train_params
      params.require(:train).permit(:train_num, :departure_st, :terminal_st, :departure_date, :departure_time, :arrival_date, :arrival_time, :ticket_price, :train_capacity, :seats_left)
    end
end
