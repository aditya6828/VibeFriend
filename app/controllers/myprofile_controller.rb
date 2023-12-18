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

  def show
    @my_profile = current_user.my_profile
  end

  def upload_image
    @user = current_user
  end

  def create_image
    @user = current_user
    @post = @user.posts.build(post_params)
  
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
    params.require(:user).permit(:comment, images_attributes: [:image]) # Permit an array of images
  end
  

def feed
  @feed_posts = Post.includes([:user, { images_attachments: :blob }]).order(created_at: :desc)
end


  private

  def profile_params
    params.require(:my_profile).permit(:fname, :user_name , :age , :birthdate , :gender , :bio , :mobile , :address)
  end  

  def post_params
    params.require(:user).permit(:caption, images: [])
  end
end
  