class FacultyProposalsController < ApplicationController
  before_action :set_faculty_propsel, only: [:show, :edit, :update, :destroy]
  def index
    @faculty_proposals = FacultyPropsel.all
  end

  def show
  end


  def new
    @faculty_propsel = FacultyPropsel.new
    @faculty_propsel.proposel_documents.build
  end


  def edit
    # @faculty_propsel.proposel_documents.build
  end

  def create     
    @faculty_propsel = FacultyPropsel.new(faculty_propsel_params)
    @verified_recaptcha = verify_recaptcha(model:@faculty_propsel) 
    if @verified_recaptcha
      if @faculty_propsel.save   
        respond_to do |format|
          format.html { redirect_to faculty_proposal_path(@faculty_propsel), notice: 'Faculty propsel was successfully created.' }
          format.js
        end 
      else
        respond_to do |format|
          format.html { render action: 'new' }
          format.js  
        end  
      end
    end
  end

  # PATCH/PUT /faculty_proposals/1
  def update
    if @faculty_propsel.update(faculty_propsel_params)
      redirect_to faculty_proposal_path(@faculty_propsel), notice: 'Faculty propsel was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /faculty_proposals/1
  def destroy
    @faculty_propsel.destroy
    redirect_to faculty_proposals_url, notice: 'Faculty propsel was successfully destroyed.'
  end
  
  def create_proposel
    @faculty_propsel = FacultyPropsel.new(faculty_propsel_params)
    @faculty_propsel.save   
  end  


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_faculty_propsel
      @faculty_propsel = FacultyPropsel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def faculty_propsel_params
      params.require(:faculty_propsel).permit(:name, :address, :city, :intrested_memeber, :office_phone,:state,:city,:zip,:mobile_phone,:area_of_expertise ,:limitations,:program_title,:area,:program_length,:activity_based,:brief_summary,:avatar, :evidence, proposel_documents_attributes: [:id, :document, :document_file_name,:document_content_type,:document_file_size,:document_updated_at,:faculty_propsel_id, :_destroy])
    end
end
