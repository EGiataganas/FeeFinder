class FeesController < ApplicationController

  # before_filter :authenticate_admin!
  # before_filter only: [:show, :edit, :update, :destroty]
  before_filter :authenticate_user!
  # before_action only: [:show, :edit, :update, :destroty]
  before_filter only: [:show]

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
      format.json { render json: @fees }
    end
  end

  def new
    @fee = Fee.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fees }
    end
  end

  def edit
    @fee = Fee.find(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fees }
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

    # def fee_params
    #   params.require(:fee).permit(:name, :amount)
    # end
end