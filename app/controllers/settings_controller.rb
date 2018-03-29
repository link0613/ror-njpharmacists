class SettingsController < ApplicationController
  
  def index
  end

  def edit
    @setting = Setting.find(settings_params[:id])
  end

  def update
    @setting = Setting.find(params[:id])
    if settings_params[:setting_attachment].nil?
      @setting.setting_attachment = nil
      @setting.save!
    end
    respond_to do |format|
      if @setting.update_attributes(settings_params)
        format.html { redirect_to settings_path, notice: 'Setting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def settings_params
    if(@_action_name != 'update' && @_action_name != 'create')
      params.permit!
    else
      params.require(:setting).permit(:setting_name, :setting_value, :setting_attachment_file_name, :setting_attachment, :requires_file)
    end
  end
end
