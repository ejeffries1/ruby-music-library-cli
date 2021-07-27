require 'pry'

class Song
    attr_accessor :name, :genre, :artist
    #attr_reader :artist


    @@all = []
    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist = artist if artist != nil
        self.genre=(genre) if genre != nil
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def save
        @@all << self
    end

    def self.create(name)
        song = self.new(name)
        song.save
        song
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre
        @genre
    end

    def genre=(genre)
        @genre = genre
        genre.songs << self unless genre.songs.include?(self)
    end

    def self.find_by_name(name)
        @@all.find do |song|
            name == song.name
        end
    end

    def self.find_or_create_by_name(name)
       if self.find_by_name(name)
        find_by_name(name)
       else self.create(name)
       end
    end

    def self.new_from_filename(file)
        file_array = file.split(" - ")
        artist = file_array[0]
        name = file_array[1]
        genre = file_array[2].gsub(".mp3", "")

        genre = Genre.find_or_create_by_name(genre)
        artist = Artist.find_or_create_by_name(artist)
        #binding.pry
        new(name,artist,genre)
    end

    def self.create_from_filename(file)
        @@all << self.new_from_filename(file)
    end
end