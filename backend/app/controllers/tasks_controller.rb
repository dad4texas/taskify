class TasksController < ApplicationController
    def index
        tasks = Task.all
        render json: tasks, except: [:created_at, :updated_at]
    end

    def show
        task = Task.find_by(id: params[:id])
        if task
            render json: tasks, except: [:created_at, :updated_at]
        else
            render json: {message: "Task not found."}
        end
    end
end
