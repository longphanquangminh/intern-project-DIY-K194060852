class CitiesController < ApplicationController
    def index
        query_cities_vietnam = "select cities.id, cities.name, count(jobs.city_id) as count_job_on_city from jobs 
        inner join cities on cities.id = jobs.city_id
        where cities.country = 'Vietnam'
        group by jobs.city_id
        having count(jobs.city_id)>=1"
        @cities_vietnam = City.find_by_sql(query_cities_vietnam)

        query_cities_notvietnam = "select cities.id, cities.name, count(jobs.city_id) as count_job_on_city from jobs 
        inner join cities on cities.id = jobs.city_id
        where cities.country != 'Vietnam'
        group by jobs.city_id
        having count(jobs.city_id)>=1"
        @cities_notvietnam = City.find_by_sql(query_cities_notvietnam)

        query_areas = "select cities.country from cities
        group by cities.country"
        @areas = City.find_by_sql(query_areas)

        @cities = City.all
    end

    def show
        # display a single city with full information
        @city_item = City.find(params[:id])
    end

end
