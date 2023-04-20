require "diary_entry_formatter"

RSpec.describe DiaryEntryFormatter do
    it "formats a diary entry" do
      fake_diary_entry = double(:fake_diary_entry, title: "Hello", contents: "Hello, world!")
      formatter = DiaryEntryFormatter.new(fake_diary_entry)
      expect(formatter.format).to eq "Hello: Hello, world!"
    end
  end