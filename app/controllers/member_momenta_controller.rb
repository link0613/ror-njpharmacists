class MemberMomentaController < ApplicationController
  before_action :set_member_momentum, only: [:show, :edit, :update, :destroy]

  # GET /member_momenta
  def index
    @member_momenta = MemberMomentum.all
  end

  # GET /member_momenta/1
  def show
  end

  # GET /member_momenta/new
  def new
    @member_momentum = MemberMomentum.new
  end

  # GET /member_momenta/1/edit
  def edit
  end

  # POST /member_momenta
  def create
    @member_momentum = MemberMomentum.new(member_momentum_params)
    if params[:member_momentum][:member_attachment].nil?
      @member_momentum.member_attachment = nil
      @member_momentum.save!
    end
    if @member_momentum.save
      redirect_to @member_momentum, notice: 'Member momentum was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /member_momenta/1
  def update
    @member_momentum = MemberMomentum.find(params[:id])
    if params[:member_momentum][:member_attachment].nil?
      @member_momentum.member_attachment = nil
      @member_momentum.save!
    end
    if @member_momentum.update(member_momentum_params)
      redirect_to @member_momentum, notice: 'Member momentum was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /member_momenta/1
  def destroy
    @member_momentum.destroy
    redirect_to member_momenta_url, notice: 'Member momentum was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member_momentum
      @member_momentum = MemberMomentum.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def member_momentum_params
      params.require(:member_momentum).permit(:name, :about_recognition, :momentum_date,:email,:member_attachment,:member_attachment_file_name)
    end
end
