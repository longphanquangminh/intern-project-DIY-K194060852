class HistoriesController < ApplicationController
  
    def index
        @history_job = current_user.histories
    end
  
  end
