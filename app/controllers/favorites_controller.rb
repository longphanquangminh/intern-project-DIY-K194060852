class FavoritesController < ApplicationController
    before_action :load_job, only: %i[create destroy]
    before_action :set_favorite_job, only: %i[create]
    before_action :load_favorite_job, only: :destroy
  
    def index
      @jobs = current_user.favorites.order(created_at: :desc)
    end
  
    def create
      if @favorite_job.save!
        # flash.now[:success] = "Successfully add new job"

        # flash.now[:notice] = 'There is an error in your form'
        # render :new

        flash[:notice] = 'You have successfully add the job to your favorites'
        redirect_to request.referrer
      else
        flash.now[:danger] = "not successful"
        # flash[:notice] = 'You have successfully created the product'
        # redirect_to products_url
      end
    end
  
    def destroy
      if @favorited_job.destroy
        # flash.now[:success] = "Successfully delete favorite job"
        flash[:notice] = 'You have successfully deleted your favorite job'
        redirect_to request.referrer # https://stackoverflow.com/questions/18354949/what-is-the-use-of-request-referer
      else
        flash.now[:danger] = "not successful"
      end
    end
  
    private
  
    def load_job
      @job = Job.find_by(id: params[:job_id])
    end
  
    def set_favorite_job
      @favorite_job = Favorite.new(user_id: current_user.id, job_id: @job.id)
    end
  
    def load_favorite_job
      @favorited_job = current_user.favorites.find(params[:id])
      # @favorited_job = Favorite.where(user_id: current_user.id, job_id: @job.id)
    end
  end
