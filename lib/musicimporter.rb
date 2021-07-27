require 'pry'

class MusicImporter
    attr_accessor :path, :files, :size

    def initialize(path)
        @path = path
    end

    def files
        @files = Dir.glob("#{path}/*.mp3").collect do |file|
            file.gsub("#{path}/","")
        #binding.pry
        end
    end

    def import
        files.each do |file|
            Song.create_from_filename(file)
        end
    end
end