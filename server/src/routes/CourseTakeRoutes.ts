import { Router } from 'express'
import { CourseTakeController } from '../controllers/CourseTakeController'
import { AuthController } from '../controllers/AuthController'

export class CourseTakeRoutes {
  public router: Router
  public courseTakeController: CourseTakeController = new CourseTakeController()
  public authController: AuthController = new AuthController()

  constructor() {
    this.router = Router()
    this.routes()
  }

  routes() {
    // - /api/course-take
    this.router.get('/', this.courseTakeController.getCourseTakes)
    this.router.get('/:id', this.courseTakeController.getCourseTake)
    this.router.post(
      '/', 
      // this.authController.authenticateJWT, 
      this.courseTakeController.createCourseTake
    )
    this.router.put(
      '/:id',
      // this.authController.authenticateJWT,
      this.courseTakeController.updateCourseTake
    )
    this.router.delete(
      '/:id',
      // this.authController.authenticateJWT,
      this.courseTakeController.deleteCourseTake
    )
  }
}
