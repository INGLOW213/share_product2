class ProductsController < ApplicationController
  protect_from_forgery except: :create
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    # 3.times { @product.pictures.build }
    @product.pictures.build
  end

  def create
    # @product = Product.new(title: params[:title], content: params[:content],price: params[:price].to_i)
    @product = Product.new(product_params)
    # @product.save

    if @product.save
      flash[:success] = "投稿しました"
      redirect_to products_path
    else
      flash.now[:danger] = "投稿に失敗しました"
      render("/products/new")
    end
  end
  
  def edit
    @product = Product.find_by(id: params[:id])
  end
  
  def update
    @product = Product.find_by(id: params[:id])
    @product.title = params[:title]
    @product.content = params[:content]
    @product.price = params[:price].to_i
    @product.save
    if @product.save
      flash[:success] = "保存しました"
      redirect_to("/products/#{@product.id}")
    else
      flash.now[:danger] = "保存できませんでした"
      render("/product/#{@product.id}/edit")
    end
  end
  
  def show
    @product = Product.find_by(id: params[:id])
  end
  
  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    flash[:warning] = "削除しました"
    redirect_to("/products/index")
  end

  def all_destroy
    @products = Product.all
    @products.each do |product|
      product.destroy
    end
    flash[:warning] = "すべて削除しました"
    redirect_to("/products/index")
  end
  
  private
    
    def product_params
      params.require(:product).permit(:title, :content, :price, {image_url: []})
    end
  
  
end
