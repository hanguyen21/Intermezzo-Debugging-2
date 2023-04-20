require "music_library"

RSpec.describe MusicLibrary do 


context "when we add some tracks to the library" do 
    it "return all tracks " do
      music_library = MusicLibrary.new
      fake_track_1 = double :track
      fake_track_2 = double :track
      music_library.add(fake_track_1)
      music_library.add(fake_track_2)
      expect(music_library.all).to eq [fake_track_1, fake_track_2]
    end

    context "when we add some tracks to the library" do 
        it "searches for those tracks by full title" do
          music_library = MusicLibrary.new
          track_1 = double :track, matches?: true
          track_2 = double :track, matches?: false
          music_library.add(track_1)
          music_library.add(track_2)
          result = music_library.search("two")
          expect(result).to eq [track_1]
        end
    end 

end

end 