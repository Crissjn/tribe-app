class ExperiencesController < ApplicationController
  before_action :set_user

  def index
    @experiences = Experience.all
  end

  def show
    @experience = Experience.find(params[:id])
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

  private

  def set_user
    @user = current_user
  end

  def experience_params
    params.require(:experience).permit(:exp_type, :max_participants, :min_participants, :date, :description)
  end
end
