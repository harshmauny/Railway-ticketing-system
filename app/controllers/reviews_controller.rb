class ReviewsController < ApplicationController
  before_action :set_review, only: %i[ show edit update destroy ]

  # GET /reviews or /reviews.json
  def index
    @reviews = Review.all

  end

  # GET /reviews/1 or /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews or /reviews.json
  def create
    @review = Review.new(review_params)
    # setting the passenger who has written the review
    @review.passenger = current_user
    respond_to do |format|
      if @review.save
        format.html { redirect_to review_url(@review), notice: "Review was successfully created." }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to review_url(@review), notice: "Review was successfully updated." }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1 or /reviews/1.json
  def destroy
    @review.destroy

    respond_to do |format|
      format.html { redirect_to reviews_url, notice: "Review was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def filter
    # review filtering
    passenger_name = params[:name]
    train_num = params[:train_num]
    @reviews = Review.all
    if passenger_name.present? || train_num.present?
      # Apply filtering logic only if filtering parameters are present
      @reviews = Review.all
      if passenger_name.present?
        # filtering by passenger name
        @reviews = @reviews.joins(:passenger).where('passengers.name LIKE ?', "%#{passenger_name}%")
      end
      if train_num.present?
        # filtering by train number
        @reviews = @reviews.joins(:train).where('trains.train_num = ?', train_num)
      end
    end
    # re-rendering the index page
    render 'index'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
        @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:rating, :feedback, :train_id, :name, :train_num)
    end
end
