class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new
    @booking.user = current_user

    @booking.experience = Experience.find(params[:experience_id])

    if @booking.save
      redirect_to bookings_path(@booking)
    else
      puts "not good"
      # render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @message = Message.new
  end
end
