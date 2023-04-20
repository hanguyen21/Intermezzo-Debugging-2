require "diary"

RSpec.describe Diary do
 it "adds and lists diary entries" do 
   diary = Diary.new
   fake_diary_entry_1 = double :fake_diary_entry
   fake_diary_entry_2 = double :fake_diary_entry
   diary.add(fake_diary_entry_1)
   diary.add(fake_diary_entry_2)
   expect(diary.entries).to eq [fake_diary_entry_1, fake_diary_entry_2]
 end

 it "counts words in the diary entries" do 
    diary = Diary.new
    fake_diary_entry_1 = double :fake_diary_entry, count_words: 2
    fake_diary_entry_2 = double :fake_diary_entry, count_words: 3
    diary.add(fake_diary_entry_1)
    diary.add(fake_diary_entry_2)
    expect(diary.count_words).to eq 5
  end

 
end
