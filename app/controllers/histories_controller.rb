class HistoriesController < ApplicationController
  
    def index
        @history_job = current_user.histories.order(created_at: :desc)
    end
  
  end
