class ExperiencesController < ApplicationController
  before_action :set_user

  def index
    @experiences = Experience.all
  end

  def show
    @experience = Experience.find(params[:id])
    @markers = [{
      lat: @experience.latitude,
      lng: @experience.longitude,

      info_window_html: render_to_string(partial: "info_window", locals: {experience: @experience}),
      marker_html: render_to_string(partial: "marker", locals: {experience: @experience})
      }]
  end

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.new(experience_params)
    @experience.user = @user
    if @experience.save
      @self_book = Booking.new(user: @user, experience: @experience)
      redirect_to experiences_path(@experience)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @experience = Experience.find(params[:id])
  end

  def update
      @experience = Experience.find(params[:id])
      @experience.update(experience_params)
      redirect_to dashboard_path
  end

  private

  def set_user
    @user = current_user
  end

  def experience_params
    params.require(:experience).permit(:exp_type, :max_participants, :min_participants, :date, :description, :location, :title )
  end
end
