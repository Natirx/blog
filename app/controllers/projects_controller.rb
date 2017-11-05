class ProjectsController < ApplicationController
  before_action :find_project , only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @projects = Project.all.order("created_at desc")
  end
  def show
  end

  def new
    @project = Project.new
  end

  def create 
  @project = Project.new project_params
  if @project.save
    redirect_to @project, notice: "Article Saved"
  else
    render 'new', notice: "Article not save"
  end
end

  def edit
  end

  def update
 if @project.update project_params
   redirect_to @project, notice: "Project update"
 else
   render 'edit'
 end
  end
  def destroy
@project.destroy
    redirect_to projects_path
  end

  private
  def find_project
    @project = Project.friendly.find(params[:id])
  end
  def project_params
    params.required(:project).permit(:title, :description, :link, :picture)
  end
end
