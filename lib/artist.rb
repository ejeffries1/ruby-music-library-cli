require 'pry'
class Artist
    extend Concerns::Findable
    attr_accessor :name

    @@all = []
    def initialize(name)
        @name = name
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

    def self.create(artist)
        artist = self.new(artist)
        artist.save
        artist
    end

    def songs
        Song.all.collect { |song| song}
    end

    def add_song(song)
        song.artist = self unless song.artist
    end

    def genres
        Song.all.collect {|song| song.genre}.uniq
    end
    
end