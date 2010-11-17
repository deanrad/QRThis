class SlogansController < ApplicationController
  def index
    @slogans = Slogan.all
  end

  def show
    @slogan = Slogan.find(params[:id])
  end

  def new
    @slogan = Slogan.new
  end

  def edit
    @slogan = Slogan.find(params[:id])
  end

  def create
    @slogan = Slogan.new(params[:slogan])

    if @slogan.save
      flash[:notice] = 'Slogan was successfully created.'
      redirect_to new_slogan_qrcode_path(@slogan)
    end
  end

  def update
    @slogan = Slogan.find(params[:id])

    if @slogan.update_attributes(params[:slogan])
      flash[:notice] = 'Slogan was successfully updated.'
    end
  end
  
  def destroy
    @slogan = Slogan.find(params[:id])
    @slogan.qrcodes.each(&:destroy)
    @slogan.renderings.each(&:destroy)
    @slogan.destroy
    redirect_to slogans_path
  end

end
