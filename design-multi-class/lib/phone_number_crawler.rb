class PhoneNumberCrawler
    def initialize(diary) #diary is an instance of Diary
     @diary = diary
     @contact = []
     @entries = diary.entries
    end
  
    def extract_numbers

        # numbers = @entries.match (/[0-9]{11}/).to_s.each do |number|
        
        @entries.map do |entry| 
            phone_numbers = entry.contents.scan(/[0-9]{11}/)
           @contact << phone_numbers
        end
        return @contact.flatten
    end
end