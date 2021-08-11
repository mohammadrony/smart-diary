import { Router } from 'express'
import { publishedtaskController } from '../controllers/publishedTask.controller'
import { authController } from '../controllers/auth.controller'

export class publishedTaskRoutes {
  public router: Router
  public publishedtaskController: publishedtaskController = new publishedtaskController()
  public authController: authController = new authController()

  constructor() {
    this.router = Router()
    this.routes()
  }

  routes() {
    // - /api/publishedTask
    this.router.get('/', this.publishedtaskController.getPublishedTasks)
    this.router.get('/:id', this.publishedtaskController.getPublishedTask)
    this.router.post(
      '/', 
      // this.authController.authenticateJWT, 
      this.publishedtaskController.createPublishedTask
    )
    this.router.put(
      '/:id',
      // this.authController.authenticateJWT,
      this.publishedtaskController.updatePublishedTask
    )
    this.router.delete(
      '/:id',
      // this.authController.authenticateJWT,
      this.publishedtaskController.deletePublishedTask
    )
  }
}
