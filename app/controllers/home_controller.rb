class HomeController < ApplicationController
  def top
    @products = Product.all
  end
end
