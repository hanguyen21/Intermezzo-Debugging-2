require "task"

RSpec.describe Task do
 it "return a list of tasks" do 
    task = Task.new("Walk the dog")
    expect(task.title).to eq "Walk the dog"
 end

  it " return false when the task is not complete" do
   task = Task.new("Walk the dog")
   expect(task.complete?).to eq false
 end

 it " return true when the task is completed " do
    task = Task.new("Walk the dog")
    task.mark_complete
    expect(task.complete?).to eq true
  end



end