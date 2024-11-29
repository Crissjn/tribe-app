class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new
    @booking.user = current_user
    @experience = Experience.find(params[:experience_id])
    @booking.experience = @experience

    if @booking.save
      redirect_to experience_path(@experience)
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
