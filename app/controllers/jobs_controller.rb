class JobsController < ApplicationController

  def home
    @companies = Company.all
    @jobs = Job.all
    @category = Category.all
  end

  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
    @contact = Contact.new
    @contact.company_id = @company.id
  end

  def new
    @category = Category.all
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end


  def create
    @category = Category.all
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)

    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @company = Company.find(params[:company_id])
    @job     = Job.find(params[:id])
    @comment = Comment.new
    @comment.job_id = @job.id
  end

  def edit
    @company = Company.find(params[:company_id])
    @job     = Job.find(params[:id])
  end

  def update
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])

    if @job.update(job_params)
      flash[:success] = "You updated #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :edit
    end
  end


  def destroy
    @company = Company.find(params[:company_id])
    @job = @company.jobs.find(params[:id])

    flash[:success] = "#{@job.title} was successfully deleted!"
    @job.destroy

    redirect_to company_jobs_path
  end

  def sort
    if params[:sort]    == 'location'
      @jobs_by_location  = Job.order(:city)
      render :location
    elsif params[:sort] == 'interest'
      @jobs_by_interest  = Job.jobs_by_level_of_interest.flatten
      render :interest
    elsif params[:sort] == 'company'
      @jobs_by_company   = Job.order(:company_id)
      render :company
    elsif params[:location]
      @jobs_in_city      = Job.jobs_for_a_city(params[:location])
      render :city
    end
  end


    def search
      if params[:search]
        @jobs = Job.where(params[:search])
      end
    end

    def dashboard
      @jobs_by_level_of_interest = Job.count_of_jobs_by_level_of_interest
      @top_companies_by_interest = Company.interest_in_companies_by_descending_order
      @job_locations = Job.count_of_jobs_by_city
    end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city,
                                :category_id)
  end

end
