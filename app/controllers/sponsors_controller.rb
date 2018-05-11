class SponsorsController < ApplicationController

  before_action :authenticate_admin!

  def new
    @sponsor = Sponsor.new
  end

  def create
    @sponsor = Sponsor.new(sponsor_params)
    if @sponsor.save
      flash[:success] = "Sponsor Created Successfully!"
      redirect_to sponsors_path
    else
      flash[:error] = @sponsor.errors.full_messages.join(',')
      render :new
    end
  end

  def index
    @sponsors = Sponsor.all
  end

  private

  def sponsor_params
    params.require(:sponsor).permit(:name, :start_date, :end_date, :is_individual)
  end
end
