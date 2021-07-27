require 'pry'

class MusicLibraryController
    attr_accessor :path

    def initialize(path="./db/mp3s")
        @path = path
        musicimporter = MusicImporter.new(path)
        musicimporter.import
    end

    def call
        puts "Welcome to your music library!"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
        puts "What would you like to do?"
        input = gets.chomp until input == "exit"
    end

    def list_songs
        Song.all.sort {|a, b| a.name <=> b.name}.each_with_index do |song, i|
            i += 1
            puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
    end

    def list_artists
        Artist.all.sort {|a,b| a.name <=> b.name}.each_with_index do |artist, i|
            i += 1
            puts "#{i}. #{artist.name}"
        end
    end

    def list_genres
        Genre.all.sort {|a,b| a.name <=> b.name}.each_with_index do |genre, i|
            i += 1
            puts "#{i}. #{genre.name}"
        end
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        user_input = gets.strip
        if artist = Artist.find_by_name(user_input)
            alpha_artist = Song.all.sort_by {|a| a.name}
            alpha_artist.each_with_index do |song, i|
                song
                #binding.pry
                puts "#{i+1}. #{song.name} - #{song.genre.name}"
            end
        end
    end

end