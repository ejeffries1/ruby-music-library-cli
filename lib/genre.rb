require 'pry'

class Genre
    extend Concerns::Findable
    attr_accessor :name
    #attr_reader :name
    
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

    def self.create(name)
        genre = self.new(name)
        genre.save
        genre
    end

    def songs
        Song.all.collect {|song| song}
    end

    def artists
        Song.all.collect {|song| song.artist}.uniq
    end


end