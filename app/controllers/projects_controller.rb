class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.where("user_id = " + current_user.id.to_s)
    shareds = Share.where("user_id = " + current_user.id.to_s)
    
    @shareds = []
    shareds.each do |shar|
      @shareds.push(Project.where("id = " + shar.project_id.to_s)[0])
    end
    
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @privacy_criteria = PrivacyCriterium.where("project_id =" + @project.id.to_s)
    @shareds = Share.where("project_id = " + @project.id.to_s)
    prepare_infos
  end

  # GET /projects/new
  def new
    @project = Project.new
    @project.user_id = current_user.id
  end

  # GET /projects/1/edit
  def edit
    prepare_infos
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      @project.user_id = current_user.id
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:user_id, :name, :description)
    end
    
    def prepare_infos
      shared = Share.where("user_id = " + current_user.id.to_s + "AND project_id = " + @project.id.to_s)
      if (current_user.id != @project.user_id) && (shared.size <= 0) then
        redirect_to root_path
      end
    end
end
