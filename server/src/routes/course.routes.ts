import { Router } from 'express'
import { courseController } from '../controllers/course.controller'
import { courseTeachController } from '../controllers/courseTeach.controller'
import { authController } from '../controllers/auth.controller'

export class courseRoutes {
  public router: Router
  public courseController: courseController = new courseController()
  public courseTeachController: courseTeachController = new courseTeachController()
  public authController: authController = new authController()

  constructor() {
    this.router = Router()
    this.routes()
  }

  routes() {
    // - /api/course
    this.router.get('/student',
    this.authController.authenticateJWT,
    this.courseController.getStudentCourses
  )
  this.router.get('/teacher',
    this.authController.authenticateJWT,
    this.courseController.getTeacherCourses
  )
  this.router.get('/department',
    this.authController.authenticateJWT,
    this.courseController.getDepartmentCourses
  )
  this.router.get('/:id',
    this.authController.authenticateJWT,
    this.courseController.getCourse
  )
  this.router.post('/teacher', 
    this.authController.authenticateJWT,
    this.courseController.createCourse,
    this.courseTeachController.createCourseTeach
  )
  this.router.put('/:id',
    this.authController.authenticateJWT,
    this.courseController.updateCourse
  )
  this.router.delete('/:id',
    this.authController.authenticateJWT,
    this.courseController.deleteCourse
  )
  }
}
