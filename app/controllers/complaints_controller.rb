class ComplaintsController < ApplicationController
  def new
    @companies = Company.order(:name)
    puts @companies
  end

  def create
    if (params[:complaint][:screenshot])
      uploaded_file = params[:complaint][:screenshot].path
      cloudinary_file = Cloudinary::Uploader.upload(uploaded_file)
      params[:complaint][:screenshot] = cloudinary_file['public_id']
    end
    @complaint = Complaint.new(complaint_params)
    @complaint.vote_count = 1
    if @complaint.save
      @complaint.users << current_user
      UserMailer.send_mail_on_complaint_creation(@complaint).deliver_now
      flash[:success] = 'Complaint created!'
      redirect_to complaints_path
    else
      flash[:danger] = 'Please make sure you are logged in and that all fields have been filled out correctly.'
      redirect_to complaint_new_path
    end
  end

  def edit
    @complaint = Complaint.find(params[:id])
  end

  def update
    @complaint = Complaint.find(params[:id])
    if (params[:complaint][:screenshot])
      uploaded_file = params[:complaint][:screenshot].path
      cloudinary_file = Cloudinary::Uploader.upload(uploaded_file)
      params[:complaint][:screenshot] = cloudinary_file['public_id']
    end
    t = Complaint.find(params[:id])
    t.update(complaint_params)
    flash[:success] = 'Complaint updated!'
    redirect_to root_path
  end

  def data
    # @JSONcomplaints = JSON.parse(Complaint.all().to_json)
    # render @JSONcomplaints
    render :json => Complaint.all().limit(10)
  end

  def index
    @complaints = Complaint.all.order("vote_count DESC")
    @current_user = current_user
  end

  def upvote
    if current_user 
    complaint = Complaint.find(params[:complaint_id])
    complaint.update(vote_count: complaint.vote_count + 1)
    complaint.users << current_user
    redirect_to complaints_path
    end
  end

  def show
  end

  def vote
  end

  def destroy
    UsersComplaints.where(complaint_id: params[:complaint_id]).destroy_all
    Complaint.destroy(params[:complaint_id])
    redirect_to profile_path(@current_user.id)
  end

  private 

  def complaint_params
    params.require(:complaint).permit(:title, :description, :screenshot, :company_id, :user_id)
  end
end
