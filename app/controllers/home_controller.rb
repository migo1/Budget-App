class HomeController < ApplicationController
  def index
    resource_name = User.new
    render :index, locals: { resource_name: resource_name }
  end
end
