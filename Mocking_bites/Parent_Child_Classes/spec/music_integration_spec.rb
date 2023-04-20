require "track"
require "music_library"

RSpec.describe "Music Library Integration" do
    context "when we add a track to the library" do 
        it "comes back in the list" do
            music_library = MusicLibrary.new
            track = Track.new("my_title", "my_artist")
            music_library.add(track)
            expect(music_library.all).to eq [track]
    end
  end  
  context "when we add two tracks to the library" do 
    it "comes back in the list" do
      music_library = MusicLibrary.new
      track1 = Track.new("my_title1", "my_artist1")
      track2 = Track.new("my_title2", "my_artist2")
      music_library.add(track1)
      music_library.add(track2)
      expect(music_library.all).to eq [track1, track2]
    end
  end
  context "when we add some tracks to the library" do 
    it "searches for those tracks by full title" do
      music_library = MusicLibrary.new
      track1 = Track.new("one two three", "four five six")
      track2 = Track.new("seven eight nine ", "ten eleven twelve")
      music_library.add(track1)
      music_library.add(track2)
      result = music_library.search("two")
      expect(result).to eq [track1]
    end
end 
end
