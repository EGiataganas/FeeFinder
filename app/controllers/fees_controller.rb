class FeesController < ApplicationController


  # before_filter
  before_filter only: [:index]
  before_filter :authenticate_admin!, except: [:show, :index]

  def index
    @fees = Fee.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fees }
    end
  end

  def show
     @fee = Fee.find(params[:id])
     respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fee }
    end
  end

  def new
    @fee = Fee.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fee }
    end
  end

  def edit
    @fee = Fee.find(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fee }
    end
  end

  def create
    @fee = Fee.new(params[:fee])

    respond_to do |format|
      if @fee.save
        format.html { redirect_to @fee, notice: 'Fee was successfully created.' }
        format.json { render :show, status: :created, location: @fee }
      else
        format.html { render :new }
        format.json { render json: @fee.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @fee = Fee.find(params[:id])
    respond_to do |format|
      ap params[:fee]
      if @fee.update_attributes(params[:fee])
        format.html { redirect_to @fee, notice: 'Fee was successfully updated.' }
        format.json { render :show, status: :ok, location: @fee }
      else
        format.html { render :edit }
        format.json { render json: @fee.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @fee = Fee.find(params[:id])
    @fee.destroy
    respond_to do |format|
      format.html { redirect_to fees_url, notice: 'Fee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_fee
      @fee = Fee.find(params[:id])
    end

    def authenticate_admin!
      redirect_to fees_path, notice: "Must be admin" unless current_user.admin?
    end
    # def fee_params
    #   params.require(:fee).permit(:name, :amount)
    # end
end