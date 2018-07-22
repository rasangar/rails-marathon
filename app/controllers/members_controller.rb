class MembersController < ApplicationController

  def new
    @house = House.find(params[:house_id])
    @member = Member.new
  end

  def create
    @house = House.find(params[:house_id])
    @member = Member.new(member_params)
    @member.house = @house

    if @member.save
      flash[:notice] = "Member added successfully"
      redirect_to @member.house
    else
      flash[:notice] = @member.errors.full_messages.join(', ')
      render :new
    end
  end

  private
  def member_params
    params.require(:member).permit(:house, :first_name, :last_name)
  end
end
