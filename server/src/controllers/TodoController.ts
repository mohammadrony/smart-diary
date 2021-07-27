import { Request, Response } from 'express'
import { ITodo, Todo } from '../models/todo'

export class TodoController {
  public async getTodos(req: Request, res: Response): Promise<void> {
    const todos = await Todo.find()
    res.json({ todos })
  }

  public async getTodo(req: Request, res: Response): Promise<void> {
    const todo = await Todo.findOne({ id: req.params.id })
    if (todo === null) {
      res.sendStatus(404)
    } else {
      res.json(todo)
    }
  }

  public async createTodo(req: Request, res: Response): Promise<void> {
    const newTodo: ITodo = new Todo(req.body)
    const todo = await Todo.findOne({ id: req.body.id })
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
    const todo = await Todo.findOneAndUpdate({ id: req.params.id }, req.body)
    if (todo === null) {
      res.sendStatus(404)
    } else {
      const updatedTodo = { id: req.params.id, ...req.body }
      res.json({ status: res.status, data: updatedTodo })
    }
  }

  public async deleteTodo(req: Request, res: Response): Promise<void> {
    const todo = await Todo.findOneAndDelete({ id: req.params.id })
    if (todo === null) {
      res.sendStatus(404)
    } else {
      res.json({ response: 'Todo deleted Successfully' })
    }
  }
}
