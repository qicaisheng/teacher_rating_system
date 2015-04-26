class VotesController < ApplicationController
	# before_action :ip_detect
	def create
		@teacher = Teacher.find(params[:teacher_id])
		@vote = @teacher.votes.create(vote_params)
		@vote.ip = request.remote_ip

		if @vote.save
			flash[:danger] = "vote success" 
			@teacher.vote_num += 1
			@teacher.score_sum += @vote.score
			@teacher.average_score = @teacher.score_sum / @teacher.vote_num
			@teacher.save
		else
			flash[:danger] = "input error"
		end

		redirect_to teacher_path(@teacher)
	end

	private 
	  def vote_params
	  	params.require(:vote).permit(:ip, :score)
	  end

	  def ip_detect
	  	if  Vote.exists?(ip: request.ip, teacher_id: params[:teacher_id])
	      flash[:danger] = "IP exists."    
	      @teacher = Teacher.find(params[:teacher_id])
	      redirect_to teacher_path(@teacher)
	    end
	  end
end
