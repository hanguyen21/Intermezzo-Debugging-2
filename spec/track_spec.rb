require "track"

RSpec.describe Track do
    context "initialize" do 
        it "constructions" do
         track = Track.new("my_title", "my_artist")
         expect(track.title).to eq "my_title"
         expect(track.artist).to eq "my_artist"
        end
    end 
 
    describe  "#format" do 
     it "formats the tile and artists into a single string" do 
        track = Track.new("my_title", "my_artist")
        expect(track.format).to eq "my_title by my_artist"
    
    end
    
    
    end

     

end
