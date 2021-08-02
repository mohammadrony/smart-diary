import { Router } from 'express'
import { TodoController } from '../controllers/TodoController'
import { AuthController } from '../controllers/AuthController'

export class TodoRoutes {
  public router: Router
  public todoController: TodoController = new TodoController()
  public authController: AuthController = new AuthController()

  constructor() {
    this.router = Router()
    this.routes()
  }

  routes() {
    // - /api/todo
    this.router.get('/', this.todoController.getTodos)
    this.router.get('/:id', this.todoController.getTodo)
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
  }
}
