class Job < ActiveRecord::Base
    belongs_to :industry
    belongs_to :level
    belongs_to :type
    belongs_to :city
    has_many :favorites
    has_many :applies
    has_many :histories

    # validates :category, :company_name, :level, :name, :type, :work_place, presence: true

    before_save :strip_html_from_texts

    def strip_html_from_texts
        self.description = ActionView::Base.full_sanitizer.sanitize(self.description)

        self.requirement = ActionView::Base.full_sanitizer.sanitize(self.requirement)

        self.benefit = ActionView::Base.full_sanitizer.sanitize(self.benefit)
    end

    searchable do
        text :name, stored: true, boost: 55
        text :benefit, stored: true, boost: 25
        text :description, stored: true, boost: 45
        text :requirement, stored: true, boost: 15
        text :city_name, stored: true, boost: 54 do |i|
           i.city.name unless i.city.nil? 
        end
        text :industry_name, stored: true, boost: 53 do |i|
           i.industry.name unless i.industry.nil? 
        end
        
    end

end
