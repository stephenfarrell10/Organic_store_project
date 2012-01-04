class AdminController < ApplicationController
  #@reference  sam ruby, dave thomas, david heinemeier hanson, agile web development,page197, chapter 14 , fourth edition

  def index
  @total_orders = Order.count
  end

end
