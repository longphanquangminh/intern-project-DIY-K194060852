# References: 
# 1/ https://stackoverflow.com/questions/6701896/how-to-write-to-a-csv-file-through-ftp-in-rails-3
# 2/ https://stackoverflow.com/questions/9204423/how-to-unzip-a-file-in-ruby-on-rails (cái cuối)
# 3/ https://regexr.com

# require so it can run
require './lib/download_data.rb'
require './lib/extract_data.rb'
require 'csv'

namespace :importwork do
  desc "TODO"

  task import_db: :environment do

    # DownloadData.new.downloadzipfile(ENV['FTP_SERVER'], ENV['FTP_USERNAME'], ENV['FTP_PASSWORD'], ENV['CSV_ZIP'], ENV['PATH_ZIP_FILE'])
    
    ExtractData.new.extractzipfile(ENV['CSV_ZIP'], ENV['PATH_CSV_FILE'])

    industry_list = Array.new
    level_list = Array.new
    type_list = Array.new
    work_city_list = Array.new
    jobs_list = Array.new
    file = ENV['CSV_FILENAME']
    
    CSV.foreach(file, headers: true) do |row|

      cate = Industry.new(name: row['category'])
      industry_list << cate if cate.valid?
      
      level  = Level.new(name: row['level'])
      level_list << level if level.valid?

      type  = Type.new(name: row['type'])
      type_list << type if type.valid?

      cities = ISO3166::Country.find_country_by_alpha2('VN').subdivisions
      set_cities=[]

      cities.each do |name, city|
        set_cities << city.code
        set_cities << city.name
        set_cities << city.translations['en']
      end

      add_more_correct_cities = ["16", "Bắc Cạn" , "Xã Xuân Giao", "Hồ Chí Minh", "Bà Rịa - Vũng Tàu", "Cần Thơ", "Đà Nẵng", "Hà Nội", "Hải Phòng", "Thừa Thiên Huế"]
      add_more_correct_cities.each {|city| set_cities << city}

      work_city_name = row['work place'].gsub(/[\[\]\"]/, '')
      country = set_cities.include?(work_city_name) ? "Vietnam" : "International"
      work_city = City.new(name: work_city_name, country: country)
      work_city_list << work_city if work_city.valid?
    end
    Industry.import industry_list, on_duplicate_key_ignore: true, validate: false
    Level.import level_list, on_duplicate_key_ignore: true, validate: false
    Type.import type_list, on_duplicate_key_ignore: true, validate: false
    City.import work_city_list, on_duplicate_key_ignore: true, validate: false

    # Import for jobs

    h_industries = Industry.select(:id, :name).index_by(&:name)
    h_levels = Level.select(:id, :name).index_by(&:name)
    h_types = Type.select(:id, :name).index_by(&:name)
    h_work_cities = City.select(:id, :name).index_by(&:name)
    CSV.foreach(file, headers: true) do |row|
      work_city_name = row['work place'].gsub(/[\[\]\"]/, '')
      jobs = Job.new({
        benefit: row['benefit'],
        industry: h_industries[row['category']],
        company_address: row['company address'],
        company_district: row['company district'],
        company_id: row['company id'],
        company_name: row['company name'],
        company_province: row['company province'],
        description: row['description'],
        level: h_levels[row['level']],
        type: h_types[row['type']],
        name: row['name'],
        requirement: row['requirement'],
        salary: row['salary'],
        contact_email: row['contact email'],
        contact_name: row['contact name'],
        contact_phone: row['contact phone'],
        city_id: h_work_cities[work_city_name].try(:id)
      })

      jobs_list << jobs if jobs.valid?

    end

    Job.import jobs_list, on_duplicate_key_update: [:benefit, :description, :requirement, :salary], validate: false

    Job.reindex

    ## Do Solr for cities
    a_cities = []
    all_city = City.all
    all_city.each do |item_city|
      kq = Job.search do
        fulltext "\"#{item_city.name}\""
      end

      item_city.job_count = kq.total
      a_cities << item_city
      
    end

    City.import a_cities, on_duplicate_key_update: [:job_count], validate: false

    ## Do Solr for industries
    a_industries = []
    all_industries = Industry.all
    all_industries.each do |item_industry|
      kq = Job.search do
        fulltext "\"#{item_industry.name}\""
      end

      item_industry.job_count = kq.total
      a_industries << item_industry

    end

    Industry.import a_industries, on_duplicate_key_update: [:job_count], validate: false
    
  end

end
