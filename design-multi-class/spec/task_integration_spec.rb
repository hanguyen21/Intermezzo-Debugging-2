require "task"
require "task_list"

RSpec.describe "integration" do
 context "given two tasks " do 
   it "return all tasks" do 
    task_list = TaskList.new
    task_1 = Task.new("buy new clothes")
    task_2 = Task.new("walk the dog")
    task_list.add(task_1)
    task_list.add(task_2)
    expect(task_list.all).to eq [task_1, task_2]
   end
 end

   it "return incomplete tasks" do 
    task_list = TaskList.new
    task_1 = Task.new("buy new clothes")
    task_2 = Task.new("walk the dog")
    task_list.add(task_1)
    task_list.add(task_2)
    task_2.mark_complete
    expect(task_list.all).to eq [task_1]
   end 

   
    it "return complete tasks" do 
        task_list = TaskList.new
        task_1 = Task.new("buy new clothes")
        task_2 = Task.new("walk the dog")
        task_list.add(task_1)
        task_list.add(task_2)
        task_2.mark_complete
        expect(task_list.complete).to eq [task_2]
    end


end
