class HomeController < ApplicationController
  def index
  	# @users = User.all #we dont want to list all the users.
  	if user_signed_in? #This method is used to gather the information that the user is signed in. 
  		redirect_to fees_path
  	end
  		 #This line of code tells us that if the user is signed in then it redirects them to the fee contorller. Where the index will show all user fees avliable. 
  end
end
