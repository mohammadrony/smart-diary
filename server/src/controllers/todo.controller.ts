import { Request, Response } from 'express'
import { ITodo, Todo } from '../models/todo.model'

export class todoController {
  public async getTodos(req: Request, res: Response): Promise<void> {
    const todos = await Todo.find({TaskId: req.params.taskId})
    res.json({ todos })
  }

  public async getUpcomingTodos(req: Request, res: Response): Promise<void> {
    const upcomingTodoLimit = parseInt(req.query.limit.toString())
    const today:any = req.query.today
    const endDay:any = req.query.endDay
    const todos = await Todo.find({dueDate: {$gte: today, $lte: endDay}}).sort([['dueDate', 'descending']]).limit(upcomingTodoLimit)
    res.json({ todos })
  }

  public async getDueTodos(req: Request, res: Response): Promise<void> {
    const dueTodoLimit = parseInt(req.query.limit.toString())
    const today:any = req.query.today
    const startDay:any = req.query.startDay
    const todos = await Todo.find({dueDate: {$gte: startDay, $lte: today}}).sort([['dueDate', 'descending']]).limit(dueTodoLimit)
    res.json({ todos })
  }

  public async getTodo(req: Request, res: Response): Promise<void> {
    const todo = await Todo.findById(req.params.id)
    if (todo === null) {
      res.sendStatus(404)
    } else {
      res.json(todo)
    }
  }

  public async createTodo(req: Request, res: Response): Promise<void> {
    const newTodo: ITodo = new Todo(req.body)
    const todo = await Todo.findById(req.body.id)
    if (todo === null) {
      const result = await newTodo.save()
      if (result === null) {
        res.sendStatus(500)
      } else {
        res.status(201).json({ status: 201, data: result })
      }
    } else {
      res.sendStatus(422)
    }
  }

  public async updateTodo(req: Request, res: Response): Promise<void> {
    const todo = await Todo.findOneAndUpdate({ _id: req.params.id }, req.body)
    if (todo === null) {
      res.sendStatus(404)
    } else {
      const updatedTodo = { _id: req.params.id, ...req.body }
      res.json({ status: res.status, data: updatedTodo })
    }
  }

  public async deleteTodo(req: Request, res: Response): Promise<void> {
    const todo = await Todo.findOneAndDelete({ _id: req.params.id })
    if (todo === null) {
      res.sendStatus(404)
    } else {
      res.json({ response: 'Todo deleted Successfully' })
    }
  }

  public async deleteTodoByTask(req: Request, res: Response): Promise<void> {
    const todo = await Todo.deleteMany({ TaskId: req.params.taskId })
    if (todo === null) {
      res.sendStatus(404)
    } else {
      res.json({ response: 'Todo deleted Successfully' })
    }
  }
}
