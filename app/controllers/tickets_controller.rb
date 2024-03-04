class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[ show edit update destroy ]

  # GET /tickets or /tickets.json
  def index
    @passengers = Passenger.all
    if current_user.is_admin == false
      @tickets = Ticket.all
    elsif current_user.is_admin == true
      # if current user is not null, assign all transactions
      @tickets = Ticket.all
    end
  end

  # GET /tickets/1 or /tickets/1.json
  def show
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
    if @train.nil?
      @train = Train.find(params[:train_id])
      # passing the necessary passenger list so that we can book ticket for other passenger as well
      @passengers = Passenger.all.select{|passenger| passenger.is_admin == false && passenger.id!=current_user.id}
    end
  end

  # GET /tickets/1/edit
  def edit

  end

  # POST /tickets or /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)
    # generate 10 digit confirmation number
    @ticket.confirm_num = Array.new(10){[*"0".."9"].sample}.join
    # find the train from train_id
    @train = Train.find(params[:ticket][:train_id])
    # if booking for other passenger set in variable
    other_passenger_id = params[:ticket][:other_passenger]
    # if booking for self then set current user as passenger and other user as nil
    if params[:ticket][:passenger_choice] == "self"
      puts params[:ticket][:passenger_choice]
      @ticket.passenger = current_user
      @ticket.other_id = nil
    else
      # else set other_id as passenger selected
      new_passenger = Passenger.find(other_passenger_id)
      @ticket.passenger = current_user
      @ticket.other_id = other_passenger_id
    end
    # seats left calculation
    @train.seats_left = @train.seats_left - @ticket.quantity
    # save train details recalculated
    @train.save
    respond_to do |format|
      # finally! save the ticket
      if @ticket.save
        format.html { redirect_to ticket_url(@ticket), notice: "Ticket was successfully created." }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1 or /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to ticket_url(@ticket), notice: "Ticket was successfully updated." }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1 or /tickets/1.json
  def destroy
    @ticket = Ticket.find(params[:id])
    @train = Train.find(@ticket.train_id)
    @train.seats_left = @train.seats_left + @ticket.quantity
    @train.save
    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to tickets_url, notice: "Ticket was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ticket_params
      params.require(:ticket).permit(:train_id, :quantity, :cost)
    end
end
