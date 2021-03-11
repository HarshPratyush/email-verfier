class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def search
    @email = params[:email]
      response = Truemail.validate(@email)
    puts response.result
    if(response.result.success)
      redirect_to '/home#index', :notice => 'Email is valid'
    else
    redirect_to '/home#index', :alert => 'Email Not found'
    end
  end
end
