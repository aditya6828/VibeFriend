class MyprofileController < ApplicationController
    
  before_action :authenticate_user!, only: [:new, :create , :show]

  def new
    @my_profile = current_user.build_my_profile
  end

  def create
    @my_profile = current_user.build_my_profile(profile_params)

    if @my_profile.save
      flash[:success] = "Profile successfully created!"
      redirect_to show_my_profile_path
    else
      flash.now[:error] = "Error creating profile, Please check the form"
      render new
    end

  end

  def show
    @my_profile = current_user.my_profile
  end

  private

  def profile_params
    params.require(:my_profile).permit(:fname, :user_name , :age , :birthdate , :gender , :bio , :mobile , :address)
  end  
end
  