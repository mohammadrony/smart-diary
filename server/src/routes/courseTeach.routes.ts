import { Router } from 'express'
import { courseTeachController } from '../controllers/courseTeach.controller'
import { authController } from '../controllers/auth.controller'

export class courseTeachRoutes {
  public router: Router
  public courseTeachController: courseTeachController = new courseTeachController()
  public authController: authController = new authController()

  constructor() {
    this.router = Router()
    this.routes()
  }

  routes() {
    // - /api/courseTeach
    this.router.get('/', this.courseTeachController.getCourseTeaches)
    this.router.get('/:id', this.courseTeachController.getCourseTeach)
    this.router.post(
      '/', 
      // this.authController.authenticateJWT, 
      this.courseTeachController.createCourseTeach
    )
    this.router.put(
      '/:id',
      // this.authController.authenticateJWT,
      this.courseTeachController.updateCourseTeach
    )
    this.router.delete(
      '/:id',
      // this.authController.authenticateJWT,
      this.courseTeachController.deleteCourseTeach
    )
  }
}
