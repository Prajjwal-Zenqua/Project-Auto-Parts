class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  
    # Filtering by name with case-insensitive search
    if params[:name].present?
      # For SQLite, use LIKE with LOWER() for case-insensitivity
      @products = @products.where("LOWER(name) LIKE ?", "%#{params[:name].downcase}%")
    end
  
    # Filtering by part number
    if params[:part_number].present?
      # Ensure consistent case handling, depending on how you store your part numbers
      @products = @products.where("LOWER(part_number) = ?", params[:part_number].downcase)
    end
  
    # Filtering by price range
    if params[:min_price].present? && params[:max_price].present?
      @products = @products.where(price: params[:min_price]..params[:max_price])
    end
  
    # Filter by stock quantity
    if params[:min_stock].present?
      @products = @products.where("stock_quantity >= ?", params[:min_stock])
    end
  end  

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :part_number, :stock_quantity, images: [])
    # params.require(:product).permit(:name, :description, :price, :part_number, :stock_quantity, :image)
  end

  def set_product
    @product = Product.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to products_path, alert: "Product not found."
  end
end
