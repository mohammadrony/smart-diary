import { Router } from 'express'
import { PublishedTaskController } from '../controllers/PublishedTaskController'
import { AuthController } from '../controllers/AuthController'

export class PublishedTaskRoutes {
  public router: Router
  public publishedTaskController: PublishedTaskController = new PublishedTaskController()
  public authController: AuthController = new AuthController()

  constructor() {
    this.router = Router()
    this.routes()
  }

  routes() {
    // - /api/published-task
    this.router.get('/', this.publishedTaskController.getPublishedTasks)
    this.router.get('/:id', this.publishedTaskController.getPublishedTask)
    this.router.post(
      '/', 
      // this.authController.authenticateJWT, 
      this.publishedTaskController.createPublishedTask
    )
    this.router.put(
      '/:id',
      // this.authController.authenticateJWT,
      this.publishedTaskController.updatePublishedTask
    )
    this.router.delete(
      '/:id',
      // this.authController.authenticateJWT,
      this.publishedTaskController.deletePublishedTask
    )
  }
}
