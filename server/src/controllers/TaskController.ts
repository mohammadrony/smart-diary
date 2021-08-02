import { Request, Response } from 'express'
import { ITask, Task } from '../models/task'

export class TaskController {
  public async getTasks(req: Request, res: Response): Promise<void> {
    const tasks = await Task.find()
    res.json({ tasks })
  }

  public async getTask(req: Request, res: Response): Promise<void> {
    const task = await Task.findById(req.params.id)
    if (task === null) {
      res.sendStatus(404)
    } else {
      res.json(task)
    }
  }

  public async createTask(req: Request, res: Response): Promise<void> {
    const newTask: ITask = new Task(req.body)
    const task = await Task.findById(req.body.id)
    if (task === null) {
      const result = await newTask.save()
      if (result === null) {
        res.sendStatus(500)
      } else {
        res.status(201).json({ status: 201, data: result })
      }
    } else {
      res.sendStatus(422)
    }
  }

  public async updateTask(req: Request, res: Response): Promise<void> {
    const task = await Task.findOneAndUpdate({ _id: req.params.id }, req.body)
    if (task === null) {
      res.sendStatus(404)
    } else {
      const updatedTask = { _id: req.params.id, ...req.body }
      res.json({ status: res.status, data: updatedTask })
    }
  }

  public async deleteTask(req: Request, res: Response): Promise<void> {
    const task = await Task.findOneAndDelete({ _id: req.params.id })
    if (task === null) {
      res.sendStatus(404)
    } else {
      res.json({ response: 'Task deleted Successfully' })
    }
  }
}
