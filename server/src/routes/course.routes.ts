import { Router } from 'express'
import { courseController } from '../controllers/course.controller'
import { authController } from '../controllers/auth.controller'

export class courseRoutes {
  public router: Router
  public courseController: courseController = new courseController()
  public authController: authController = new authController()

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
      this.authController.authenticateJWT, 
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
