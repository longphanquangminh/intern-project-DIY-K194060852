class IndustriesController < ApplicationController
    def index
        query_industries = "select industries.id, industries.name, count(jobs.industry_id) as count_job_on_industry from jobs 
        inner join industries on industries.id = jobs.industry_id
        group by jobs.industry_id
        having count(jobs.industry_id)>=1"
        @query_industries = Industry.find_by_sql(query_industries)
    end
end
