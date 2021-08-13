import { Router } from 'express'
import { noteTopicController } from '../controllers/noteTopic.controller'
import { authController } from '../controllers/auth.controller'

export class noteTopicRoutes {
  public router: Router
  public noteTopicController: noteTopicController = new noteTopicController()
  public authController: authController = new authController()

  constructor() {
    this.router = Router()
    this.routes()
  }

  routes() {
    // - /api/noteTopic
    this.router.get('/', this.noteTopicController.getNoteTopics)
    this.router.get('/:id', this.noteTopicController.getNoteTopic)
    this.router.post(
      '/', 
      // this.authController.authenticateJWT, 
      this.noteTopicController.createNoteTopic
    )
    this.router.put(
      '/:id',
      // this.authController.authenticateJWT,
      this.noteTopicController.updateNoteTopic
    )
    this.router.delete(
      '/:id',
      // this.authController.authenticateJWT,
      this.noteTopicController.deleteNoteTopic
    )
  }
}
