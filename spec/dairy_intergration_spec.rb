require "diary"
require "diary_entry"

RSpec.describe "Diary Intergration" do 
  context " given no entries "do 
     it "return an empty list" do 
        diary = Diary.new
        expect(diary.all).to eq []
      end 
  end 

  context " after adding some entries "do 
     it "list out the entries added" do 
        diary = Diary.new
        diary_entry = DiaryEntry.new("my_title", "my_content")
        diary.add(diary_entry)
        expect(diary.all).to eq [diary_entry]
      end 
    end 

    it "list out multiple entries added" do 
      diary = Diary.new
      diary_entry = DiaryEntry.new("my_title", "my_content")
      diary_entry_2 = DiaryEntry.new("my_title_2", "my_content_2")
      diary.add(diary_entry)
      diary.add(diary_entry_2)
      expect(diary.all).to eq [diary_entry, diary_entry_2]
    end 

    describe "#count_words" do 
       it "counts words in all diary entries" do
       diary = Diary.new
       diary_entry = DiaryEntry.new("my title", "my content")
       diary_entry_2 = DiaryEntry.new("my title 2", "my content 2")
       diary.add(diary_entry)
       diary.add(diary_entry_2)
       expect(diary.count_words).to eq 5

       end 
    end 

    describe "reading time behaviour" do
       it "fails when wpm is 0" do 
        diary = Diary.new
        diary_entry_2 = DiaryEntry.new("my title 2", "my content 2")
        diary.add(diary_entry_2)
        expect { diary.reading_time(0) }.to raise_error("wpm must be positive.")

       end

       it "calculate the reading time" do 
        diary = Diary.new
        diary_entry = DiaryEntry.new("my title", "my content")
        diary_entry_2 = DiaryEntry.new("my title 2", "my content 2")
        diary.add(diary_entry)
        diary.add(diary_entry_2)
        expect(diary.reading_time(2)).to eq 3
       end

       it "calculate the reading time for all entries where  it fits exactly " do 
        diary = Diary.new
        diary_entry = DiaryEntry.new("my title", "my content 1")
        diary_entry_2 = DiaryEntry.new("my title 2", "my content 2")
        diary.add(diary_entry)
        diary.add(diary_entry_2)
        expect(diary.reading_time(2)).to eq 3
       end

       it "calculate the reading time for all entries where  it falls over a minute " do 
        diary = Diary.new
        diary_entry = DiaryEntry.new("my title", "my content")
        diary_entry_2 = DiaryEntry.new("my title 2", "my content 2")
        diary.add(diary_entry)
        diary.add(diary_entry_2)
        expect(diary.reading_time(2)).to eq 3
       end
    end 

       describe "best reading time entry behaviour" do 
        context "where we just have one entry an dit readable in the time" do

          it "return that entry" do
          diary = Diary.new
          diary_entry = DiaryEntry.new("my title", "my content")
          diary.add(diary_entry)
          result = diary.find_best_entry_for_reading_time(2, 1)
          expect(result).to eq diary_entry
          end
        end

        context "where we just have one entry and it is unreadable in the time" do

          it "return nil" do
          diary = Diary.new
          diary_entry = DiaryEntry.new("my title", "my content longer ")
          diary.add(diary_entry)
          result = diary.find_best_entry_for_reading_time(2, 1)
          expect(result).to eq nil
          end
        end

        context "where we have multiple entri" do

          it "return nil" do
          diary = Diary.new
          diary_entry = DiaryEntry.new("my title", "my content longer ")
          diary.add(diary_entry)
          result = diary.find_best_entry_for_reading_time(2, 1)
          expect(result).to eq nil
          end
        end

      end

   

end 