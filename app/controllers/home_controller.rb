class HomeController < ApplicationController
  def index
  	#@users = User.all
  	if user_signed_in?
  		redirect_to :controller=>'fees_controller', :action=> 'index'
  	end
  
  end
end
