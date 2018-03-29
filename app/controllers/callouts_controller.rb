class CalloutsController < ApplicationController
  before_action :set_callout, only: [:show, :edit, :update, :destroy]

  # GET /callouts
  def index
    @callouts = Callout.all
  end

  # GET /callouts/1
  def show
  end

  # GET /callouts/new
  def new
    @callout = Callout.new
  end

  # GET /callouts/1/edit
  def edit
  end

  # POST /callouts
  def create
    @callout = Callout.new(callout_params)

    if @callout.save
      redirect_to @callout, notice: 'Callout was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /callouts/1
  def update
    if @callout.update(callout_params)
      redirect_to @callout, notice: 'Callout was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /callouts/1
  def destroy
    @callout.destroy
    redirect_to callouts_url, notice: 'Callout was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_callout
      @callout = Callout.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def callout_params
      params.require(:callout).permit(:callout_title, :callout_content)
    end
end
