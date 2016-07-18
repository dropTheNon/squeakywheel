class ComplaintsController < ApplicationController
  def new
  end

  def create
    if (params[:complaint][:screenshot])
      uploaded_file = params[:complaint][:screenshot].path
      cloudinary_file = Cloudinary::Uploader.upload(uploaded_file)
      params[:complaint][:screenshot] = cloudinary_file['public_id']
    end

    Complaint.create(complaint_params)
    redirect_to root_path
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
    params.require(:complaint).permit(:title, :description, :screenshot, :company_id)
  end
end
