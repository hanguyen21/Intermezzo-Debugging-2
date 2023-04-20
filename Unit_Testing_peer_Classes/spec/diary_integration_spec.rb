require "secret_diary"
require "diary"

RSpec.describe SecretDiary do
    context "initialize" do
        it "doesn't read the diary because it is locked" do
            diary = Diary.new("MY CONTENTS")
            secret_diary = SecretDiary.new(diary)
            expect {secret_diary.read }.to raise_error "Go away!"
        end
    end 
   
    context "when it is unlocked" do
      it "it read the diary contents" do
        diary = Diary.new("MY CONTENTS")
        secret_diary = SecretDiary.new(diary)
        secret_diary.unlock
        expect(secret_diary.read).to eq "MY CONTENTS"
      end
    end

    context "when it is relocked" do
        it "it doesn't read the diary contents" do
          diary = Diary.new("MY CONTENTS")
          secret_diary = SecretDiary.new(diary)
          secret_diary.unlock
          secret_diary.lock
          expect {secret_diary.read }.to raise_error "Go away!"
        end
      end

end