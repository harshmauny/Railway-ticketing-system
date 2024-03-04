class PassengersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  before_action :set_passenger, only: %i[ show edit update destroy ]

  # GET /passengers or /passengers.json
  def index
    @passengers = Passenger.all
  end

  # GET /passengers/1 or /passengers/1.json
  def show
  end

  # GET /passengers/new
  def new
    @passenger = Passenger.new
  end

  # GET /passengers/1/edit
  def edit
  end

  # POST /passengers or /passengers.json
  def create
    # create new passenger using params
    @passenger = Passenger.new(passenger_params)
    # when new user is created we set the admin access as false since admin is added by default
    @passenger.is_admin = false
    respond_to do |format|
      # Save the passenger
      if @passenger.save
        format.html { redirect_to root_path, notice: "Passenger was successfully created." }
        format.json { render root_path, status: :created, location: @passenger }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @passenger.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /passengers/1 or /passengers/1.json
  def update
    # find the passenger from id
    @passenger = Passenger.find(params[:id])

    # Check if the current user is an admin and if a password is provided
    if  params[:passenger][:password].blank?
      # If the user is an admin and no new password is provided, retain the old password
      params[:passenger][:password_digest] = @passenger.password_digest
    end
    respond_to do |format|
      if @passenger.update(passenger_params)
        format.html { redirect_to passenger_url(@passenger), notice: "Passenger was successfully updated." }
        format.json { render :show, status: :ok, location: @passenger }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @passenger.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /passengers/1 or /passengers/1.json
  def destroy
    # check if user was admin in order to determine where to redirect after destroying the user
    was_admin = current_user.is_admin
    @passenger.destroy
    respond_to do |format|
      # proper redirection
      format.html { redirect_to was_admin ? passenger_path : root_path, notice: "Passenger was successfully destroyed." }
      if current_user.is_admin == false
        session.clear
      end
      format.json { head :no_content }
      end
    end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_passenger
      if current_user.is_admin == true || params[:id] == current_user.id.to_s
        @passenger = Passenger.find(params[:id])
      else
        redirect_to root_path
      end
    end

    # Only allow a list of trusted parameters through.
    def passenger_params
      params.require(:passenger).permit(:username, :name, :email, :password, :phone_num, :address, :card_num, :is_admin)
    end
end
