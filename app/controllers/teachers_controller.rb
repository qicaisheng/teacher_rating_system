class TeachersController < ApplicationController
	before_action :admin_user, only: [:admin, :new, :create, :edit, :update, :destroy]

	def admin
		@teachers = Teacher.all
	end

	def index
		@teachers = Teacher.all
	end

	def new
		@teacher = Teacher.new(params[:id])
	end

	def create
		@teacher = Teacher.new(teacher_params)
		if @teacher.save
			redirect_to admin_path
		else
			render 'new'
		end
	end

	def show
		@teacher = Teacher.find(params[:id])
	end

	def edit
		@teacher = Teacher.find(params[:id])
	end

	def update
		@teacher = Teacher.find(params[:id])
		if @teacher.update_attributes(teacher_params)
			redirect_to @teacher
		else
			render 'edit'
		end
	end

	def destroy
		@teacher = Teacher.find(params[:id]).destroy
		redirect_to teachers_url
	end

	private
	  def teacher_params
	  	params.require(:teacher).permit(:teacher_id, :picture, :name, :remote_picture_url, :remove_picture)
	  end

	  def admin_user
	  	if user_signed_in? 
	      unless current_user.admin
	        flash[:danger] = "You have no permission."    
	        redirect_to root_url
	      end
	  	else
          flash[:danger] = "Please log in."
          redirect_to new_user_session_url
	  	end
	  end

end
