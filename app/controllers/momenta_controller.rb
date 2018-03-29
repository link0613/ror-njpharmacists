class MomentaController < ApplicationController
  before_action :set_momentum, only: [:show, :edit, :update, :destroy]

  # GET /momenta
  def index
    @momenta = Momentum.all
  end

  # GET /momenta/1
  def show
  end

  # GET /momenta/new
  def new
    @momentum = Momentum.new
  end

  # GET /momenta/1/edit
  def edit
  end

  # POST /momenta
  def create
    @momentum = Momentum.new(momentum_params)

    if @momentum.save
      redirect_to @momentum, notice: 'Momentum was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /momenta/1
  def update
    if @momentum.update(momentum_params)
      redirect_to @momentum, notice: 'Momentum was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /momenta/1
  def destroy
    @momentum.destroy
    redirect_to momenta_url, notice: 'Momentum was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_momentum
      @momentum = Momentum.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def momentum_params
      params.require(:momentum).permit(:name, :about_recognition, :momentum_date)
    end
end
