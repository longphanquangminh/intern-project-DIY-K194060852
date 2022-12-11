require './lib/slug_work.rb'

class Industry < ActiveRecord::Base
    has_many :jobs

    extend FriendlyId
    friendly_id :name, use: %i(slugged finders)
    
    def normalize_friendly_id(string)
        SlugWork.new.slug_work(string)
    end
    
end
