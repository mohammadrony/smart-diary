import { Request, Response } from 'express'
// import { Student } from '../models/student.model'
import { ITask, Task } from '../models/task.model'

export class taskController {
  public async getStudentTasks(req: Request, res: Response): Promise<void> {
    // const student: typeof Student = <typeof Student>req.user
    const tasks = await Task.find({ StudentId: req.user })
    res.status(200).json({ data: tasks })
  }

  public async getTeacherTasks(req: Request, res: Response): Promise<void> {
    const tasks = await Task.find({ TeacherId: req.user })
    res.status(200).json({ data: tasks })
  }

  public async getTask(req: Request, res: Response): Promise<void> {
    const task = await Task.findById(req.params.id)
    if (task === null) {
      res.sendStatus(404)
    } else {
      res.status(200).json({ data: task })
    }
  }

  public async createStudentTask(req: Request, res: Response): Promise<void> {
    const newTask: ITask = new Task({ StudentId: req.user, ...req.body })
    const result = await newTask.save()
    if (result === null) {
      res.sendStatus(500)
    } else {
      res.status(201).json({ status: 201, data: result })
    }
  }

  public async createTeacherTask(req: Request, res: Response): Promise<void> {
    const newTask: ITask = new Task({ TeacherId: req.user, ...req.body })
    const result = await newTask.save()
    if (result === null) {
      res.sendStatus(500)
    } else {
      res.status(201).json({ status: 201, data: result })
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
