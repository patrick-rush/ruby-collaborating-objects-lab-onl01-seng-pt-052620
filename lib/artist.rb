require 'pry'

class Artist
    
    attr_accessor :name, :song
    @@all = []
    
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all 
    end

    def add_song(song)
        song.artist = self
    end

    def songs
        Song.all.select do |song|
            song.artist == self
        end
    end

    def self.find_or_create_by_name(name)
        self.all.find { |artist| artist.name == name } or Artist.new(name)
    end

    def print_songs
        songs.each do |song|
            puts song.name
        end
    end

end