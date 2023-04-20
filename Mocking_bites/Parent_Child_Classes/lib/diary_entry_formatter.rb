
class DiaryEntryFormatter
def initialize(diary_entry) # diary_entry is an instance of DiaryEntry
 @diary_entry = diary_entry
end

def format
  # Returns a nicely formatted diary entry
  return "#{@diary_entry.title}: #{@diary_entry.contents}"
end
end