{{PROBLEM}} Multi-Class Planned Design Recipe

1. Describe the Problem

> As a user
> So that I can keep track of my tasks
> I want a program that I can add todo tasks to and see a list of them.

> As a user
> So that I can focus on tasks to complete
> I want to mark tasks as complete and have them disappear from the list.

2. Design the Class System
   Consider diagramming out the classes and their relationships. Take care to focus on the details you see as important, not everything. The diagram below uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com

todo tasks
list of tasks
add (todo task)
mark (tasks as complete)

┌─────────────────────────┐
│ TaskList │
│ │
│ -add -complete
│ -all │
└─────────────┬───────────┘
│TaskList has zero
│or more Task
│
┌────────────▼────────────┐
│ Task │
│ - mark complete │
│ - title │
│ - complete? │
└─────────────────────────┘

Also design the interface of each class in more detail.
'''ruby

class TaskList

def add(task) # task is an instance of Task
end

def all

# returns a list of Task instances

# but only the non-completed ones

end

def completed

# returns a list of Task instances

# but only the complete ones

end
end

class Task
def initialize(title) # title is a string
end

def title

# return title as a string

end

def mark_complete

# Mark the task as complete

# return nothing

end

def complete?

# returns true if marked completed, otherwise false

end
end

3. Create Examples as Integration Tests
   Create examples of the classes being used together in different situations and combinations that reflect the ways in which the system will be used.

# TaskList

# 1

task_list = TaskList.new
task_1 = Task.new("buy new clothes")
task_2 = Task.new("walk the dog")
task_list.add(task_1)
task_list.add(task_2)
task_list.all # => [task_1, task_2]

# 2

task_list = TaskList.new
task_1 = Task.new("buy new clothes")
task_2 = Task.new("walk the dog")
task_list.add(task_1)
task_list.add(task_2)
task_2.mark_complete
task_list.all # => [task_1]

# 3

task_list = TaskList.new
task_1 = Task.new("buy new clothes")
task_2 = Task.new("walk the dog")
task_list.add(task_1)
task_list.add(task_2)
task_2.mark_complete
task_list.complete # => [task_2]

4. Create Examples as Unit Tests
   Create examples, where appropriate, of the behaviour of each relevant class at a more granular level of detail.

'''ruby

# Tasklist

# 1

task_list = TaskList.new
task_list.all # => []

# 2

task_list = TaskList.new
task_list.complete # => []

# Task

# 1

task = Task.new("Walk the dog")
task.title # => ["Walk the dog"]

# 2

task = Task.new("Walk the dog")
task.complete? # => false

# 3

task = Task.new("Walk the dog")
task.mark_complete
task.complete? # => true

5. Implement the Behaviour
   After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.
