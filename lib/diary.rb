class Diary
    def initialize
      @entry = []
    end
  
    def add(entry) 
      @entry << entry
    end
  
    def all
            return @entry
    end
  
    def count_words
      return @entry.sum(&:count_words)
        
    end
  
    def reading_time(wpm) 
      fail "wpm must be positive." unless wpm.positive?
      return (count_words / wpm.to_f).ceil
    end
  
    def find_best_entry_for_reading_time(wpm, minutes)
        readable_entries = @entry.filter do |entry|
        entry.reading_time(wpm) <= minutes
        end
        return readable_entries.first
    end

  end

