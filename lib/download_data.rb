require 'net/ftp'

class DownloadData

    def downloadzipfile(ftp_server, userName, passWord, fileName, pathToPutFiles)
        return false if ftp_server.nil? || userName.nil? || passWord.nil? || fileName.nil?

        ftp = Net::FTP.new(ftp_server)

        pathToPutFiles = "/" if pathToPutFiles.nil?

        ftp.login(userName, passWord)
        ftp.chdir(pathToPutFiles) # cd
        ftp.getbinaryfile(fileName)
        ftp.close

    end

end
