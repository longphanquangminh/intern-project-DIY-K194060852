require 'zip'

class ExtractData

    def extractzipfile(fileName, pathToPutFiles)
        pathToPutFiles = '/' if pathToPutFiles.nil?
        return false if fileName.nil? 
        
        FileUtils.mkdir_p(pathToPutFiles)
      
        Zip::File.open(fileName) do |zip_file|
          zip_file.each do |f|
            fpath = File.join(pathToPutFiles, f.name)
            FileUtils.mkdir_p(File.dirname(fpath))
            zip_file.extract(f, fpath) unless File.exist?(fpath)
          end

        end

    end

end
