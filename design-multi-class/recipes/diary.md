# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._
As a user
So that I can record my experiences
I want to keep a regular diary

As a user
So that I can reflect on my experiences
I want to read my past diary entries

As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed

As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary

As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

``

````

_Also design the interface of each class in more detail._

```ruby
class Diary
  def add(entry) # entry is an Instance of DiaryEntry
  end

  def entries
  # Returns a list of DiaryEntries
  end
end

class DiaryEntry
  def initialize(title, contents) # title and contents are both strings
  end

  def title
    `Return title as a string
  end

  def contents
    Return contents as a string
  end
end

class PhoneNumberCrawler
  def initialize(diary) #diary is an instance of Diary
  end

  def extract_numbers
  return a list of strings representing phone numbers gather across pf diary entries
  end
end

class DiaryReader
  def initialize(wpm,diary)
   - wpm is a number representing how many words the reader can read in a minute
   - diary is an instance of Diary
  end

  def find_most_readable_in_time(time)
   Returns an instance of DiaryEntry, corresponding to the entry with the largest contents that is still readable within the time, based on the wpm specified earlier
  end
end

class Tasklist
  def add(task) task is an instance of Task
  end

  def all
    returns a list of tasks
  end
end

class task
  def initialize(title) title is a string
  end

  def title
   returns the title as a string
  end
end




````

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
1
diary = Diary.new
entry_1 = DiaryEntry.new("my title", "my contents")
entry_2 = DiaryEntry.new("my title two", "my contents two")
diary.add(entry_1)
diary.add(entry_2)
expect(diary.entries).to eq [entry_1, entry_2]

2 - fits exactly
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
expect(reader.find_most-readable_in_time(2)).to eq entry_4

3 - does not fit exactly

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
expect(reader.find_most-readable_in_time(2)).to eq entry_3

4 - nothing readable
diary = Diary.new
reader = DiaryReader.new(2, diary)
entry_1 = DiaryEntry.new("title1", "one two three four five")
diary.add(entry_1)
expect(reader.find_most-readable_in_time(2)).to eq nil

5 - nothing at all
diary = Diary.new
reader = DiaryReader.new(2, diary)
expect(reader.find_most-readable_in_time(2)).to eq nil

6- wpm invalid
diary = Diary.new
expect { DiaryReader.new(0, diary) }.to raise_error "wpm must be positive"

7 -
task_list = Tasklist.new
task_1 = Task.new("Walk the dog")
task_2 = Task.new("Walk the cat")
task_list.add(task_1)
task_list.add(task_2)
expect(task_list.all).to eq [task_1, task_2]

8-

diary = Diary.new
phone_book = PhoneNumberCrawler.new(diary)
diary.add(DiaryEntry.new("title1", "my friend 09000000000 is cool"))
diary.add(DiaryEntry.new("title1", "my friend 09000000000, 09000000001, 09000000002, 09000000002 are cool"))
expect(phone_book, extract_numbers).to eq [
   "09000000000",
    "09000000001",
    "09000000002"
]
# EXAMPLE

```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE

# Constructs a track
track = Track.new("Carte Blanche", "Veracocha")
track.title # => "Carte Blanche"
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._
