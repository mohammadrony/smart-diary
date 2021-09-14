import { Request, Response } from 'express'
import { ICourseTeach, CourseTeach } from '../models/courseTeach.model'
import { ICourseTake, CourseTake } from '../models/courseTake.model'
import { ITask, Task } from '../models/task.model'

export class taskController {
  public async getStudentTasks(req: Request, res: Response): Promise<void> {
    // const student: typeof Student = <typeof Student>req.user
    var tasks = []
    tasks = await Task.find({ StudentId: req.user })

    const courseTakes: ICourseTake[] = await CourseTake.find({ StudentId: req.user })
    
    for(var i=0;i<courseTakes.length;i++){
      tasks = tasks.concat(await Task.find({ CourseId: courseTakes[i].CourseId }))
    }
    
    tasks = tasks.sort((first, second) => 0 - (first._id > second._id ? -1 : 1));

    res.status(200).json({ data: tasks })
  }

  public async getCourseTasks(req: Request, res: Response): Promise<void> {
    const courseTeach: ICourseTeach[] = await CourseTeach.find({
      TeacherId: req.user,
      CourseId: req.params.CourseId
    })
    if(!courseTeach){
      res.status(403).json({ status: 'error', data: 'You are not allowed to see these tasks' })
    } else {
      const tasks = await Task.find({
        TeacherId: req.user,
        CourseId: req.params.CourseId
      })
      res.status(200).json({ data: tasks })
    }
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

  public async createCourseTask(req: Request, res: Response): Promise<void> {
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
