class HousesController < ApplicationController
  def index
    @houses = House.all
  end

  def new
    @house = House.new
  end

  def create
    @house = House.new(house_params)

    if @house.save
      flash[:notice] = "House added successfully"
      redirect_to @house
    else
      flash[:alert] = @house.errors.full_messages.join(', ')
      render 'new'
    end
  end

  def show
    @member = Member.new
    @house = House.find(params[:id])
    @members = @house.members
  end


  private
  def house_params
    params.require(:house).permit(:name, :author, :source, :motto)
  end
end
