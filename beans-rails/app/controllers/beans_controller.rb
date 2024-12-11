class BeansController < ApplicationController
  def index
    @beans = Bean.all
  rescue => e
    flash.now[:error] = "Unable to fetch coffee beans at this time."
    @beans = []
  end
end
