import { NextFunction, Request, Response } from 'express'
import { Student } from '../models/student.model'
import { ICourse, Course } from '../models/course.model'
import { CourseTake } from '../models/courseTake.model'
import { CourseTeach } from '../models/courseTeach.model'

export class courseController {
  public async getStudentCourses(req: Request, res: Response): Promise<void> {
    const courseTakes = await CourseTake.find({  
      StudentId: req.user
    }).populate({path: 'CourseId'})
    const courses = courseTakes.map((courseTake) => courseTake.CourseId)
    res.status(200).json({ data: courses })
  }

  public async getTeacherCourses(req: Request, res: Response): Promise<void> {
    const courseTeaches = await CourseTeach.find({  
      TeacherId: req.user
    }).populate({path: 'CourseId'})
    const courses = courseTeaches.map((courseTeach) => courseTeach.CourseId)
    res.status(200).json({ data: courses })
  }

  public async getDepartmentCourses(req: Request, res: Response): Promise<void> {
    const student = await Student.findById(req.user)
    const courses = await Course.find({  
      DepartmentId: student.DepartmentId
    })
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
