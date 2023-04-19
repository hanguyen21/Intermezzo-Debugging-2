class DiaryReader
    def initialize(wpm,diary)
        @wpm = wpm
        @diary = diary
        @entry_word_count = {}
        @entries = diary.entries
    end 

    def find_most_readable_in_time(time)
       fail "wpm must be positive" unless @wpm.positive?
       max_words = @wpm * time
       @entries.each{ |entry| @entry_word_count[entry] = entry.count_words }
       result_pair = @entry_word_count.select{|k,v| v <= max_words}.max_by{|k,v| v }

       return result_pair == nil ? nil : result_pair[0]
    end 

end