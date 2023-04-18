require "diary_entry"


RSpec.describe DiaryEntry do 
  it "constructs" do 
    diary_entry = DiaryEntry.new("my_title", "my_contents")
    expect(diary_entry.title).to eq "my_title"
    expect(diary_entry.contents).to eq "my_contents"
  end
 
  describe "#count_words" do 
    context "given the contents as a string " do
      it "returns number of words in the contents" do 
        diary_entry = DiaryEntry.new("my_title", "one two three")
        expect(diary_entry.count_words).to eq 3
      end

      it "returns zero if string is empty" do 
        diary_entry = DiaryEntry.new("my_title", "")
        expect(diary_entry.count_words).to eq 0
      end

      it "returns one " do 
        diary_entry = DiaryEntry.new("my_title", "one")
        expect(diary_entry.count_words).to eq 1
      end
   end 
 end 

 describe "#reading_time" do 
    it "fails" do 
        diary_entry = DiaryEntry.new("my_title", "hello word")
        expect { diary_entry.reading_time(0) }.to raise_error "wpm must be positive."
    end


    context "given the contents as a string " do
      it "returns number of words in the contents" do 
        diary_entry = DiaryEntry.new("my_title", "one")
        expect(diary_entry.reading_time(2)).to eq 1
      end

      it "returns zero if string is empty" do 
        diary_entry = DiaryEntry.new("my_title", "")
        expect(diary_entry.reading_time(2)).to eq 0
      end

      it "returns reading time " do 
        diary_entry = DiaryEntry.new("my_title", "one two three four five")
        expect(diary_entry.reading_time(2)).to eq 3
      end
   end 
 end 
#    describe "best reading time entry behaviour" do 
#      context "where we just have one entry" do
#       it "" do 

#       end
    
#      end

#    end
  

end 