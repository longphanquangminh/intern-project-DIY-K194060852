require './lib/slug_work.rb'
class JobsController < ApplicationController
    def index
        @jobs_count = Job.count
        @favoritesCount = Favorite.select("count(job_id)").where("user_id = ", current_user.id) if user_signed_in?
        @jobs_latest = Job.order(created_at: :desc).limit(5)
        @cities_top = City.select(:id, :name, :job_count).order(job_count: :desc).limit(9)
        @industries_top = Industry.select(:id, :name, :job_count).order(job_count: :desc).limit(9)

        @query = Job.search do
            fulltext params[:search]
            paginate page: params[:page], per_page: 20
        end
        
        @params_var = params[:search]
        @jobs_search = @query.results
        @total_search = @query.total
        
    end

    def show
        @job = Job.find(params[:id])
        if user_signed_in?
            if History.exists?(job_id: @job.id, user_id: current_user.id)
                History.where(user_id: current_user.id, job_id: @job.id).destroy_all
            end
            @user_histories = History.new(user_id: current_user.id, job_id: @job.id )
            @user_histories.save!
        end
    end

    def search 
        @click = request.path.include?('/jobs/city/') ? City.find(SlugWork.new.slug_work(params[:city])) : Industry.find(SlugWork.new.slug_work(params[:industry]))
        @jobs = request.path.include?('/jobs/city/') ? Job.includes([:city]).where('city_id = ?', @click) : Job.includes([:industry]).where('industry_id = ?', @click)
        @query = @jobs.page(params[:page]).per(20)
    end
    
end
