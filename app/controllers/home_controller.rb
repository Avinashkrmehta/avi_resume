class HomeController < ApplicationController
	
	layout 'resume'

  def index
  	@user = nil
  end

  def feedback
  	@feedback = Feedback.new(feedback_params)
  	if @feedback.save
  		flash[:notice] = 'Thanks For your feedback.'
  		redirect_to root_path
  	else
  		flash[:alert] = 'Feedback not submitted successfully'
  		redirect_to root_path
  	end
  end

  def create
    # @feedback = Feedback.new(feedback_params)

    # respond_to do |format|
    #   if @feedback.save
    #     format.html { redirect_to @feedback, notice: 'Feedback was successfully created.' }
    #     format.json { render :show, status: :created, location: @feedback }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @feedback.errors, status: :unprocessable_entity }
    #   end
    # end	
  end

	def feedback_params
      params.require(:feedback).permit(:name, :contact, :email, :message)
    end
end
