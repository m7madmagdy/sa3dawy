class ProductsController < ApplicationController
  CACHE_KEY = 'products#index'
  before_action :set_product, only: %i[show edit update destroy]

  before_action :check_cached, only: :index
  after_action :cache_response, only: :index

  # GET /products or /products.json
  def index
    if @cache_response
      render html: @cached_response.html_safe
    else
      @products = Product.all.order('RANDOM()')
    end
  end

  # GET /products/1 or /products/1.json
  def show; end

  # GET /products/1/edit
  def edit; end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:name, :price, :url, :image_url, :description, :source_page_id)
  end

  def check_cached
    @cached_response = REDIS_CLIENT.get(CACHE_KEY)
  end

  def cache_response
    REDIS_CLIENT.setex(CACHE_KEY, 3.houres, response.body)
  end
end
