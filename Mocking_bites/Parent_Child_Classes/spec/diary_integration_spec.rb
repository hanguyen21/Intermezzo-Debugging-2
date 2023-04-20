require "diary"
require "diary_entry"


RSpec.describe "diary integration" do 
    it "adds diary entries to a list" do 
        diary = Diary.new
        entry_1 = DiaryEntry.new("my title", "my contents")
        entry_2 = DiaryEntry.new("my title two", "my contents two")
        diary.add(entry_1)
        diary.add(entry_2)
        expect(diary.entries).to eq [entry_1, entry_2]
    end 
end 