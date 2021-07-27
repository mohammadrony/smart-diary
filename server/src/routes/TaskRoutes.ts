import { Router } from 'express'
import { TaskController } from '../controllers/TaskController'
import { AuthController } from '../controllers/AuthController'

export class TaskRoutes {
  public router: Router
  public taskController: TaskController = new TaskController()
  public authController: AuthController = new AuthController()

  constructor() {
    this.router = Router()
    this.routes()
  }

  routes() {
    // - /api/task
    this.router.get('/', this.taskController.getTasks)
    this.router.get('/:id', this.taskController.getTask)
    this.router.post('/', this.authController.authenticateJWT, this.taskController.createTask)
    this.router.put(
      '/:id',
      this.authController.authenticateJWT,
      this.taskController.updateTask
    )
    this.router.delete(
      '/:id',
      this.authController.authenticateJWT,
      this.taskController.deleteTask
    )
  }
}
