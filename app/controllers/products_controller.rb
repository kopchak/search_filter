class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def filter
    @products = ProductsFilterService.new(params).filter

    render "index"
  end
end
