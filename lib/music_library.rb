# File: lib/music_library.rb

class MusicLibrary
    def initialize
      @Tracks = []
    end
  
    def add(track) 
        @Tracks << track 
    end
  
    def all
      return @Tracks
    end
    
    def search_by_title(keyword) # keyword is a string
      # Returns a list of tracks with titles that include the keyword
     @Tracks.select do |track|
        track.title.include? (keyword)
     end
    
    end
end