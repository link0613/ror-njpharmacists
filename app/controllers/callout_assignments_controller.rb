class CalloutAssignmentsController < ApplicationController
  before_action :set_callout_assignment, only: [:show, :edit, :update, :destroy]


  def index
    @page = Page.find(params[:page_id])
    @order_num = @page.callouts.count+1
    @callout_assignment = CalloutAssignment.new({page_id: @page.id, order_num: @order_num})
    @callout_assignments = CalloutAssignment.where(page_id: @page.id).all
  end

  def show
  end

  def new
    @callout_assignment = Callout.new
  end

  def edit
  end

  def create
    @callout_assignment = CalloutAssignment.new(callout_assignment_params)
    if @callout_assignment.save
      redirect_to page_callout_assignments_path(params[:page_id]), notice: 'Callout Assignment was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /callouts/1
  def update
    if @callout_assignment.update(callout_assignment_params)
      redirect_to page_callout_assignments_path(params[:page_id]), notice: 'Callout Assignment was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /callouts/1
  def destroy
    @callout_assignment.destroy
    redirect_to page_callout_assignments_path(params[:page_id]), notice: 'Callout Assignment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_callout_assignment
      @callout_assignment = CalloutAssignment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def callout_assignment_params
      params.require(:callout_assignment).permit(:order_num, :page_id, :callout_id)
    end
end
