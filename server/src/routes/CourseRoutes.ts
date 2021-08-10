import { Router } from 'express'
import { CourseController } from '../controllers/CourseController'
import { AuthController } from '../controllers/AuthController'

export class CourseRoutes {
  public router: Router
  public courseController: CourseController = new CourseController()
  public authController: AuthController = new AuthController()

  constructor() {
    this.router = Router()
    this.routes()
  }

  routes() {
    // - /api/course
    this.router.get('/', this.courseController.getCourses)
    this.router.get('/:id', this.courseController.getCourse)
    this.router.post(
      '/', 
      // this.authController.authenticateJWT, 
      this.courseController.createCourse
    )
    this.router.put(
      '/:id',
      // this.authController.authenticateJWT,
      this.courseController.updateCourse
    )
    this.router.delete(
      '/:id',
      // this.authController.authenticateJWT,
      this.courseController.deleteCourse
    )
  }
}
