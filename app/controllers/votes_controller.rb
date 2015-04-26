require 'socket'
class VotesController < ApplicationController
	before_action :ip_detect
	def create
		@teacher = Teacher.find(params[:teacher_id])
		@vote = @teacher.votes.create(vote_params)
		@vote.ip = request.remote_ip
		# ip=Socket.ip_address_list.detect{|intf| intf.ipv4_private?}
		# @vote.ip = ip.ip_address if ip
		# @vote.ip = request.headers["x-forwarded-for"]

		if @vote.save
			flash[:danger] = "投票成功！" 
			@teacher.vote_num += 1
			@teacher.score_sum += @vote.score
			@teacher.average_score = @teacher.score_sum / @teacher.vote_num
			@teacher.save
		else
			flash[:danger] = "输入错误!"
		end

		redirect_to teacher_path(@teacher)
	end

	private 
	  def vote_params
	  	params.require(:vote).permit(:ip, :score)
	  end

	  def ip_detect
	  	if  Vote.exists?(ip: request.ip, teacher_id: params[:teacher_id]) 
	  		# and evercookie_is_set?(:teachers_rating_system)
	      flash[:danger] = "已经投过票了。"    
	      @teacher = Teacher.find(params[:teacher_id])
	      redirect_to teacher_path(@teacher)
	    end
	  end
end
