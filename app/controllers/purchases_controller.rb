class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_purchase, only: %i[show edit update destroy]
  before_action :set_category, only: %i[new create show]

  # GET /purchases or /purchases.json
  def index
    @purchases = Purchase.all
  end

  # GET /purchases/1 or /purchases/1.json
  def show; end

  # GET /purchases/new
  def new
    @purchase = Purchase.new
    @categories = Category.all
  end

  # GET /purchases/1/edit
  def edit; end

  # POST /purchases or /purchases.json
  def create
    @purchase = Purchase.new(purchase_params)

    @purchase.author = current_user

    @purchase.categories << Category.find(params[:category_ids]) if params[:category_ids].present?

    respond_to do |format|
      if @purchase.save
        format.html { redirect_to category_url(@category), notice: 'Purchase was successfully created.' }
        format.json { render :show, status: :created, location: @purchase }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchases/1 or /purchases/1.json
  def update
    respond_to do |format|
      if @purchase.update(purchase_params)
        format.html { redirect_to purchase_url(@purchase), notice: 'Purchase was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchases/1 or /purchases/1.json
  def destroy
    @purchase.destroy

    respond_to do |format|
      format.html { redirect_to purchases_url, notice: 'Purchase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_purchase
    @purchase = Purchase.find(params[:id])
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  # Only allow a list of trusted parameters through.
  def purchase_params
    params.require(:purchase).permit(:name, :amount, category_ids: [])
  end
end
