class MyprofileController < ApplicationController
    def new
      @my_profile = MyProfile.new
    end
  
    def create
        @my_profile = current_user.build_my_profile(profile_params)
      
        if @my_profile.save
          flash[:success] = "Profile successfully created!"
          redirect_to my_profile_path(@my_profile)
        else
          flash.now[:error] = "Error creating profile. Please check the form and try again."
          render :new
        end
      end
      
  
    private
  
    def profile_params
        params.require(:my_profile).permit(:fname, :user_name, :age, :birthdate, :gender, :bio, :mobile, :address)
    end
      
  end
  