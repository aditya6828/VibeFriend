class MyprofileController < ApplicationController
    
  before_action :authenticate_user!, only: [:new, :create , :show, :upload_image , :feed]

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

  def feed
    @feed_posts = Post.includes(user: [:my_profile], images: [file_attachment: :blob]).order(created_at: :desc)
   

  end
  def show
    @my_profile = current_user.my_profile
  end

  def upload_image
    @user = current_user
  end

  def create_image
    puts "inside create function image"
    @user = current_user
    @post = @user.build(post_params)
    puts "this is file #{@post}"
    @post.images.file = @post.file
  
    if @post.save
      flash[:success] = "Image uploaded successfully"
      redirect_to feed_path
    else
      flash.now[:error] = "Error uploading image, please check the form"
      render :upload_image
    end
  end
  
  private
  
  def post_params
    params.require(:user).permit(:caption, :file)
  end
  
  


  def profile_params
    params.require(:my_profile).permit(:fname, :user_name , :age , :birthdate , :gender , :bio , :mobile , :address)
  end  

  
end
  