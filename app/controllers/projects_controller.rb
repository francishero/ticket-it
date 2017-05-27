class ProjectsController < ApplicationController
	def index
	end

	def new
		@project=Project.new
	end

	def create
		@project=Project.new(project_params)

		if @project.save
			flash[:notice]="Project has been created."
			redirect_to @project
		else
			#code
		end
	end

	def show
		#if Active Record cant find a recording matching the ID raises ActiveRecord::RecordNotFound
		@project=Project.find(params[:id])
	end

	private

	def project_params
		params.require(:project).permit(:name,:description)
	end
end
