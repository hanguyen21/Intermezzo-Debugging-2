class TaskList

    def initialize
     @task = []
    end

    def add(task)
    @task << task
    end

    def all 
        return @task.reject(&:complete?)
    end
    
    def complete
        return @task.select(&:complete?)
    end
end