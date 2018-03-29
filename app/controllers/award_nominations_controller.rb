class AwardNominationsController < ApplicationController
  before_action :set_nomination, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @nomination = AwardNomination.new
  end

  def create
  	@nomination = AwardNomination.new(nomination_params)
    @verified_recaptcha = verify_recaptcha(model:@nomination) 
    @mailing = true
    if @verified_recaptcha
      if @nomination.save
        begin
          AwardNominationsMailer.award_nomination_confirmation(@nomination).deliver
          respond_to do |format|
            format.html { redirect_to @nomination, notice: 'Nomination was successfully created.' }
            format.js
          end 
        rescue
          @mailing = false
          respond_to do |format|
            format.html { render action: 'new' }
            format.js
          end 
        end
        
      else
        respond_to do |format|
          format.html { render action: 'new' }
          format.js
        end 
      end
    end
  end

  def index
  end

  def destroy
    @nomination.destroy!
    redirect_to award_nominations_path
  end

  def update
  	if @nomination.update(nomination_params)
      redirect_to @callout, notice: 'Callout was successfully updated.'
    else
      render action: 'edit'
    end
  end

private
	# Use callbacks to share common setup or constraints between actions.
	def set_nomination
	  @nomination = AwardNomination.find(params[:id])
	end

	# Only allow a trusted parameter "white list" through.
	def nomination_params
	  params.require(:award_nomination).permit(:nominator_name, :nominator_phone, :nominator_email, :award_name, :nominee_name, :nominee_address, :nominee_phone, :nominee_email, :nominee_title, :supporting_material, :reason_for_nomination)
	end

end
