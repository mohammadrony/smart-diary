import { Router } from 'express'
import { todoController } from '../controllers/todo.controller'
import { authController } from '../controllers/auth.controller'

export class todoRoutes {
  public router: Router
  public todoController: todoController = new todoController()
  public authController: authController = new authController()

  constructor() {
    this.router = Router()
    this.routes()
  }

  routes() {
    // - /api/todo
    this.router.get('/:taskId', this.todoController.getTodos)
    this.router.post(
      '/',
      // this.authController.authenticateJWT,
      this.todoController.createTodo
    )
    this.router.put(
      '/:id',
      // this.authController.authenticateJWT,
      this.todoController.updateTodo
    )
    this.router.delete(
      '/:id',
      // this.authController.authenticateJWT,
      this.todoController.deleteTodo
    )
    this.router.delete(
      '/task/:taskId',
      // this.authController.authenticateJWT,
      this.todoController.deleteTodoByTask
    )
  }
}
