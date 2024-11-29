class ExperiencesController < ApplicationController
  before_action :set_user

  def index
    @experiences = Experience.all
    # filter out the experiences that are full or owned but the user
    if params[:query].present?
      @experiences = @experiences.where("title ILIKE ?", "%#{params[:query]}%")
    end
  end

  def show
    @experience = Experience.find(params[:id])
    @markers = [{
      lat: @experience.latitude,
      lng: @experience.longitude,

      info_window_html: render_to_string(partial: "info_window", locals: {experience: @experience}),
      marker_html: render_to_string(partial: "marker", locals: {experience: @experience})
      }]
      @booking = Booking.new
      # trying to implement chat
      @bookings = @experience.bookings.where(user: current_user)
  end

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.new(experience_params)
     @experience.user = @user
    if @experience.save
      @self_book = Booking.new(user: @user, experience: @experience)
      @self_book.save
      redirect_to experience_path(@experience)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @experience = Experience.find(params[:id])
    if @experience.finished?
        redirect_to experience_path, alert: "The experience cannot be edited when finished"
    else
    redirect_to experiences_path(@experience)
    end
  end

  def update
      @experience = Experience.find(params[:id])
      @experience.update(experience_params)
      redirect_to experiences_path(@experience)
  end

  def destroy
      @experience = Experience.find(params[:id])
      if @experience.finished?
        redirect_to experience_path, alert: "The experience cannot be deleted when finished"
      else
        @experience.destroy
        redirect_to dashboard_path, status: :see_other, alert: "Experience deleted!"
      end
  end

  private

  def set_user
    @user = current_user
  end

  def experience_params
    params.require(:experience).permit(:exp_type, :max_participants, :min_participants, :date, :description, :location, :title, :photos => [] )
  end
end
