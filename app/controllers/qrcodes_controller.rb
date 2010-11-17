class QrcodesController < ApplicationController

  def index
    @qrcodes = Qrcode.all #scoped by user
    render :partial => 'qrcode', :collection => @qrcodes
  end
  def show
    @qrcode = Qrcode.find(params[:id])
    send_data @qrcode.contents, :type => :png # @qrcode.mime_type
  end
  def new
    @slogan = Slogan.find(params[:slogan_id]) if params[:slogan_id]
    @qrcode = @slogan.qrcodes.build
  end
  def create
    @slogan = Slogan.find(params[:slogan_id]) if params[:slogan_id]
    @qrcode = Qrcode.new()
    text = params[:qrcode][:slogan_text]
    @generator = RQRCode::QRCode.new( text, :size => params[:qrcode][:version].to_i, :level => params[:qrcode][:ecc].to_sym)
    @qrcode.contents = @generator.to_s
    @qrcode.save!
    
    @slogan.qrcodes << @qrcode
    
    redirect_to slogan_path(@slogan)
  end
end
