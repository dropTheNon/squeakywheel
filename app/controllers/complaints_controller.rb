class ComplaintsController < ApplicationController
  def new
  end

  def create
    if (params[:complaint][:screenshot])
      uploaded_file = params[:complaint][:screenshot].path
      cloudinary_file = Cloudinary::Uploader.upload(uploaded_file)
      params[:complaint][:screenshot] = cloudinary_file['public_id']
    end

    @complaint = Complaint.new(complaint_params)
    if @complaint.save
      @complaint.users << current_user
      redirect_to complaints_path
    else
      flash[:danger] = 'An error occurred. Please make sure you are logged in and that all fields have been filled out correctly.'
      redirect_to complaint_new_path
    end
  end

  def edit
  end

  def update

  end

  def index
    @complaints = Complaint.all
  end

  def show
  end

  def vote
  end

  private 

  def complaint_params
    params.require(:complaint).permit(:title, :description, :screenshot, :company_id, :user_id)
  end
end
