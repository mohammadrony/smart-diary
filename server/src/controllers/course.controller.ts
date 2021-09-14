import { NextFunction, Request, Response } from 'express'
import { ICourse, Course } from '../models/course.model'
import { CourseTeach } from '../models/courseTeach.model'

export class courseController {
  public async getStudentCourses(req: Request, res: Response): Promise<void> {
    const courses = await Course.find({ StudentId: req.user })
    res.status(200).json({ data: courses })
  }

  public async getTeacherCourses(req: Request, res: Response): Promise<void> {
    const courseTeaches = await CourseTeach.find({  
      TeacherId: req.user
    }).populate({path: 'CourseId'})
    const courses = courseTeaches.map((courseTeach) => courseTeach.CourseId)
    res.status(200).json({ data: courses })
  }

  public async getCourse(req: Request, res: Response): Promise<void> {
    const course = await Course.findById(req.params.id)
    if (course === null) {
      res.sendStatus(404)
    } else {
      res.status(200).json({ data: course })
    }
  }

  public async createCourse(req: Request, res: Response, next: NextFunction): Promise<void> {
    const newCourse: ICourse = new Course(req.body)
    const result = await newCourse.save()
    req.body.CourseId = result._id
    if (result === null) {
      res.sendStatus(500)
    } else {
      next()
    }
  }

  public async updateCourse(req: Request, res: Response): Promise<void> {
    const course = await Course.findOneAndUpdate({ _id: req.params.id }, req.body)
    if (course === null) {
      res.sendStatus(404)
    } else {
      const updatedCourse = { _id: req.params.id, ...req.body }
      res.json({ status: res.status, data: updatedCourse })
    }
  }

  public async deleteCourse(req: Request, res: Response): Promise<void> {
    const course = await Course.findOneAndDelete({ _id: req.params.id })
    if (course === null) {
      res.sendStatus(404)
    } else {
      res.json({ response: 'Course deleted Successfully' })
    }
  }
}
