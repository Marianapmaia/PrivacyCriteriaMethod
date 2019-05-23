class PrivacyCriteriaController < ApplicationController
  before_action :set_privacy_criterium, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /privacy_criteria
  # GET /privacy_criteria.json
  def index
    @privacy_criteria = PrivacyCriterium.all
  end

  # GET /privacy_criteria/1
  # GET /privacy_criteria/1.json
  def show
    prepare_infos
  end

  # GET /privacy_criteria/new
  def new
    @privacy_criterium = PrivacyCriterium.new
    
    @new = true
    
    # Projeto Pai
    @project_id = params[:id]
    @project_name = Project.find(@project_id).name
    @privacy_criterium.project_id = params[:id]
  end

  # GET /privacy_criteria/1/edit
  def edit
    @new = false
    @project_name = Project.find(@privacy_criterium.project_id).name
    prepare_infos
  end

  # POST /privacy_criteria
  # POST /privacy_criteria.json
  def create
    @privacy_criterium = PrivacyCriterium.new(privacy_criterium_params)
    
    respond_to do |format|
      if @privacy_criterium.save
        #SAVE PERSONAL INFORMATIONS
        for i in 0..4
          rec_pip = params["pip"+i.to_s]
          rec_pipu = params["pipu"+i.to_s]
          rec_pis = params["pis"+i.to_s]
          if rec_pip["list"].to_s != "" then
            pip = PersonalInformation.new
            pip.privacy_criterium_id = @privacy_criterium.id
            pip.tipo = "PRIVATE"
            pip.list = rec_pip["list"]
            pip.desc = rec_pip["desc"]
            pip.save
          end
          if rec_pipu["list"].to_s != "" then
            pipu = PersonalInformation.new
            pipu.privacy_criterium_id = @privacy_criterium.id
            pipu.tipo = "PUBLIC"
            pipu.list = rec_pipu["list"]
            pipu.desc = rec_pipu["desc"]
            pipu.save
          end
          if rec_pis["list"].to_s != "" then
            pis = PersonalInformation.new
            pis.privacy_criterium_id = @privacy_criterium.id
            pis.tipo = "SEMI"
            pis.list = rec_pis["list"]
            pis.desc = rec_pis["desc"]
            pis.save
          end
        end
          
        #OUTROS CAMPOS
        for f in 0..9
          rec_risk = params["risk" + f.to_s]
          
          if rec_risk["vul"] != "" then
            risk = Risk.new
            risk.privacy_criterium_id = @privacy_criterium.id
            risk.vul = rec_risk["vul"]
            risk.thread = rec_risk["thread"]
            risk.harm = rec_risk["harm"]
            risk.save
          end
        end
        
        for j in 0..9
          rec_mec = params["mec" + j.to_s]
          if rec_mec != "" then
            mec = Mec.new
            mec.privacy_criterium_id = @privacy_criterium.id
            mec.mec = rec_mec
            mec.save
          else
            puts(j)
          end
        end
        format.html { redirect_to @privacy_criterium, notice: 'Privacy criterium was successfully created.' }
        format.json { render :show, status: :created, location: @privacy_criterium }
      else
        format.html { render :new }
        format.json { render json: @privacy_criterium.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def create_pi
    @personal_information.save
  end
  
  # PATCH/PUT /privacy_criteria/1
  # PATCH/PUT /privacy_criteria/1.json
  def update
    respond_to do |format|
      if @privacy_criterium.update(privacy_criterium_params)
        #SAVE PERSONAL INFORMATIONS
        for i in 0..4
          rec_pip = params["pip"+i.to_s]
          rec_pipu = params["pipu"+i.to_s]
          rec_pis = params["pis"+i.to_s]
          
          pip_edit = PersonalInformation.where(
            "(privacy_criterium_id = " + @privacy_criterium.id.to_s + ") AND " + 
            "(tipo = 'PRIVATE') AND " +
            "(list = '" + rec_pip["list"] + "')")
              
          pipu_edit = PersonalInformation.where(
            "(privacy_criterium_id = " + @privacy_criterium.id.to_s + ") AND " + 
            "(tipo = 'PUBLIC') AND " +
            "(list = '" + rec_pipu["list"] + "')")
            
          pis_edit = PersonalInformation.where(
            "(privacy_criterium_id = " + @privacy_criterium.id.to_s + ") AND " + 
            "(tipo = 'SEMI') AND " +
            "(list = '" + rec_pipu["list"] + "')")
            
          if rec_pip["list"].to_s != ""  && pip_edit.size <= 0 then
            pip = PersonalInformation.new
            pip.privacy_criterium_id = @privacy_criterium.id
            pip.tipo = "PRIVATE"
            pip.list = rec_pip["list"]
            pip.desc = rec_pip["desc"]
            pip.save
          elsif pip_edit.size > 0 then
            pip_edit = pip_edit.first
            if rec_pip["list"].to_s == "" then
              PersonalInformation.delete(pip_edit.id)
            else
              pip_edit.list = rec_pip["list"]
              pip_edit.desc = rec_pip["desc"]
              pip_edit.save
            end
          end

          if rec_pipu["list"].to_s != "" && pipu_edit.size <= 0 then 
            pipu = PersonalInformation.new
            pipu.privacy_criterium_id = @privacy_criterium.id
            pipu.tipo = "PUBLIC"
            pipu.list = rec_pipu["list"]
            pipu.desc = rec_pipu["desc"]
            pipu.save
          elsif pipu_edit.size > 0 then
            pipu_edit = pipu_edit.first
            if rec_pipu["list"].to_s == "" then
              PersonalInformation.delete(pipu_edit.id)
            else
              pipu_edit.list = rec_pipu["list"]
              pipu_edit.desc = rec_pipu["desc"]
              pipu_edit.save
            end
          end
          
          if rec_pis["list"].to_s != ""  && pis_edit.size <= 0 then 
            pis = PersonalInformation.new
            pis.privacy_criterium_id = @privacy_criterium.id
            pis.tipo = "SEMI"
            pis.list = rec_pis["list"]
            pis.desc = rec_pis["desc"]
            pis.save
          elsif pis_edit.size > 0 then
            pis_edit = pis_edit.first
            if rec_pis["list"].to_s == "" then
              PersonalInformation.delete(pis_edit.id)
            else
              pis_edit.list = rec_pis["list"]
              pis_edit.desc = rec_pis["desc"]
              pis_edit.save
            end
          end
        end
          
        #OUTROS CAMPOS
        for f in 0..9
          rec_risk = params["risk" + f.to_s]
          
          edit_risk = Risk.where(
            "privacy_criterium_id = " + @privacy_criterium.id.to_s + " AND " + 
            "vul = '" + rec_risk["vul"] + "' AND " + 
            "thread = '" + rec_risk["thread"] + "' AND " +
            "harm = '" + rec_risk["harm"] + "'")
          
          if edit_risk.size <= 0 && rec_risk["vul"] != "" then
            risk = Risk.new
            risk.privacy_criterium_id = @privacy_criterium.id
            risk.vul = rec_risk["vul"]
            risk.thread = rec_risk["thread"]
            risk.harm = rec_risk["harm"]
            risk.save
          elsif edit_risk.size > 0 then
            edit_risk = edit_risk.first
            if rec_risk["vul"] != "" then
              Risk.delete(edit_risk.id)
            else
              risk.vul = rec_risk["vul"]
              risk.thread = rec_risk["thread"]
              risk.harm = rec_risk["harm"]
              risk.save
            end
          end
        end
        
        for j in 0..9
          rec_mec = params["mec" + j.to_s]
          edit_mec = Mec.where(
            "privacy_criterium_id = " + @privacy_criterium.id.to_s + " AND " + 
            "mec = '" + rec_mec + "'")
          
          if edit_mec.size <= 0 && rec_mec != "" then
            mec = Mec.new
            mec.privacy_criterium_id = @privacy_criterium.id
            mec.mec = rec_mec
            mec.save
          elsif edit_mec.size > 0 then
            edit_mec = edit_mec.first
            if rec_mec != "" then
              Mec.delete(edit_mec.id)
            else
              mec.mec = rec_mec
              mec.save
            end
          end
        end
        format.html { redirect_to @privacy_criterium, notice: 'Privacy criterium was successfully updated.' }
        format.json { render :show, status: :ok, location: @privacy_criterium }
      else
        format.html { render :edit }
        format.json { render json: @privacy_criterium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /privacy_criteria/1
  # DELETE /privacy_criteria/1.json
  def destroy
    @privacy_criterium.destroy
    respond_to do |format|
      format.html { redirect_to privacy_criteria_url, notice: 'Privacy criterium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_privacy_criterium
      @privacy_criterium = PrivacyCriterium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def privacy_criterium_params
      params.require(:privacy_criterium).permit(:project_id, :name, :id_pc, :requirement, :description, :source, :owner, :rel_owner, :processor, :rel_processor, :third, :rel_third, :privacy_preference, :privacy_compliance, :priority)
    end
    
    def prepare_infos
      project = Project.where("id = " + @privacy_criterium.project_id.to_s)[0]
      shared = Share.where("user_id = " + current_user.id.to_s + "AND project_id = " + project.id.to_s)
      if (current_user.id != project.user_id) && (shared.size <= 0)  then
        redirect_to root_path
      end
      
      @list_pi = PersonalInformation.where("privacy_criterium_id = " + @privacy_criterium.id.to_s)
      @list_risk = Risk.where("privacy_criterium_id = " + @privacy_criterium.id.to_s)
      @list_mec = Mec.where("privacy_criterium_id = " + @privacy_criterium.id.to_s)
    end
end
