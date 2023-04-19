require "diary"
require "diary_entry"
require "diary-reader"
require "phone_number_crawler"

RSpec.describe "diary integration" do 
    it "adds diary entries to a list" do 
        diary = Diary.new
        entry_1 = DiaryEntry.new("my title", "my contents")
        entry_2 = DiaryEntry.new("my title two", "my contents two")
        diary.add(entry_1)
        diary.add(entry_2)
        expect(diary.entries).to eq [entry_1, entry_2]
    end 

    it "fits exactly" do 

        diary = Diary.new
        reader = DiaryReader.new(2, diary)
        entry_1 = DiaryEntry.new("title1", "one")
        entry_2 = DiaryEntry.new("title2", "one two")
        entry_3 = DiaryEntry.new("title1", "one two three")
        entry_4 = DiaryEntry.new("title1", "one two three four")
        entry_5 = DiaryEntry.new("title1", "one two three four five")
        diary.add(entry_1)
        diary.add(entry_2)
        diary.add(entry_3)
        diary.add(entry_4)
        diary.add(entry_5)
        expect(reader.find_most_readable_in_time(2)).to eq entry_4

    end

    it "does not fit" do 
        diary = Diary.new
        reader = DiaryReader.new(2, diary)
        entry_1 = DiaryEntry.new("title1", "one")
        entry_2 = DiaryEntry.new("title2", "one two")
        entry_3 = DiaryEntry.new("title1", "one two three")
        entry_4 = DiaryEntry.new("title1", "one two three four five")
        diary.add(entry_1)
        diary.add(entry_2)
        diary.add(entry_3)
        diary.add(entry_4)
        expect(reader.find_most_readable_in_time(2)).to eq entry_3
    
    end 

    it "nothing readable" do 
        diary = Diary.new
        reader = DiaryReader.new(2, diary)
        entry_1 = DiaryEntry.new("title1", "one two three four five")
        diary.add(entry_1)
        expect(reader.find_most_readable_in_time(2)).to eq nil
    end

    it "nothing at all " do 
        diary = Diary.new
        reader = DiaryReader.new(2, diary)
        expect(reader.find_most_readable_in_time(2)).to eq nil
    end 

    it "wpm invalid" do 
        diary = Diary.new
        reader = DiaryReader.new(0, diary)
        expect {reader.find_most_readable_in_time(2) }.to raise_error "wpm must be positive"
    end 
   
    it "return phone numbers" do 
        diary = Diary.new
        phone_book = PhoneNumberCrawler.new(diary)
        diary.add(DiaryEntry.new("title1", "my friend 09000000000 is cool"))
        diary.add(DiaryEntry.new("title1", "my friend 09000000001, 09000000002, are cool"))
        expect(phone_book.extract_numbers).to eq [
           "09000000000",
            "09000000001",
            "09000000002"
        ]
    end 

end 