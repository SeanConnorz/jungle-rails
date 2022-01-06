class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
    puts ENV['USERNAME']
    puts "HELOOOOOOOOOOOOOOOOOOOOOOOO"
  end

  def show
    @product = Product.find params[:id]
  end

end
