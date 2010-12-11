class ImagesController < ApplicationController

  # see ApplicationController#authenticate
  before_filter :authenticate

  layout false

  # GET /public/images/myfile.jpg
  def show
    @user_image = UserImage.find_by_name("#{params[:name]}")
    send_file(@user_image.image.path, :stream => false, :disposition => "inline", :type => "image/#{params[:format]}")
  end

end
