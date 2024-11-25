class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @boooking = Booking.new
    @booking.user = @current_user
    @booking.exprience = @experience
    if @booking.save
      redirect_to bookings_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end
end
