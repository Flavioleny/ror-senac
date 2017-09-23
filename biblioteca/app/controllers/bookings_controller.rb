class BookingsController < ApplicationController
  def index
    # if params[:search].present?
    #   @bookings = Booking.where("name like '%#{params[:search]}%'").paginate(page: params[:page], per_page: 3)
    # else
    #   @bookings = current_user.bookings.paginate(page: params[:page], per_page: 3)
    # end

    if current_user.admin?
      @bookings = Booking.all.paginate(page: params[:page], per_page: 2)
    else
      @bookings = current_user.bookings.paginate(page: params[:page], per_page: 2)
    end

  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id ||= current_user.id
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :book_id, :reserved_to)
  end

end
