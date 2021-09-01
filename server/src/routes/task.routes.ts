import { Router } from 'express'
import { taskController } from '../controllers/task.controller'
import { authController } from '../controllers/auth.controller'

export class taskRoutes {
  public router: Router
  public taskController: taskController = new taskController()
  public authController: authController = new authController()

  constructor() {
    this.router = Router()
    this.routes()
  }

  routes() {
    // - /api/task
    this.router.get('/', this.taskController.getTasks)
    this.router.get('/:id', this.taskController.getTask)
    this.router.post(
      '/', 
      this.authController.authenticateJWT,
      this.taskController.createTask
    )
    this.router.put(
      '/:id',
      // this.authController.authenticateJWT,
      this.taskController.updateTask
    )
    this.router.delete(
      '/:id',
      // this.authController.authenticateJWT,
      this.taskController.deleteTask
    )
  }
}
