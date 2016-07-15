class ComplaintsController < ApplicationController
  def new
  end

  def create
    complaint = Complaint.new(complaint_params)
    puts complaint.inspect
    complaint.save
    # render complaint.errors.messages
    if complaint.save
      redirect_to root_path
    else
      redirect_to complaint_new_path
    end
  end

  def edit
  end

  def update
  end

  def index
  end

  def show
  end

  def vote
  end

  private 

  def complaint_params
    params.require(:complaint).permit(:title, :description, :screenshot, :company_id)
  end
end
