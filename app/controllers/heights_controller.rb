class HeightsController < ApplicationController
  layout 'internal'

  before_action :authenticate_user!
  before_action :block_crossprofile_access
  before_action :recover_profile

  def index
    @heights = @profile.heights
  end

  def new; end

  def edit
    @height = Height.find(params[:id])
  end

  def create
    @height = Height.new(height_params)

    @height.profile = @profile

    if @height.save
      flash[:success] = 'Height registered sucessfully'
      redirect_to profile_heights_path(profile_email: @profile.email)
    else
      render 'new'
    end
  end

  def update
    @height = Height.find(params[:id])

    if @height.update(height_params)
      flash[:success] = 'Height updated sucessfully'
      redirect_to profile_heights_path(profile_email: @height.profile.email)
    else
      render 'edit'
    end
  end

  def destroy
    @height = Height.find(params[:id])

    profile_email = @height.profile.email

    @height.destroy

    redirect_to profile_heights_path(profile_email: profile_email)
  end

  private

  def height_params
    params.require(:height).permit(:value, :date)
  end
end
