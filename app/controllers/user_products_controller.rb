class UserProductsController < ApplicationController
  
  def create

    @user_product = UserProduct.create(
      params[:user_product].delete_if do |k,v|
        not %w(product_id 
               template_id
               printable_area).include? k
      end
    )
    render :text => 'OK'
    
  end
  
end