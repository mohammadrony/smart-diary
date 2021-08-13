import { Router } from 'express'
import { noteSubjectController } from '../controllers/noteSubject.controller'
import { authController } from '../controllers/auth.controller'

export class noteSubjectRoutes {
  public router: Router
  public noteSubjectController: noteSubjectController = new noteSubjectController()
  public authController: authController = new authController()

  constructor() {
    this.router = Router()
    this.routes()
  }

  routes() {
    // - /api/noteSubject
    this.router.get('/', this.noteSubjectController.getNoteSubjects)
    this.router.get('/:id', this.noteSubjectController.getNoteSubject)
    this.router.post(
      '/', 
      // this.authController.authenticateJWT, 
      this.noteSubjectController.createNoteSubject
    )
    this.router.put(
      '/:id',
      // this.authController.authenticateJWT,
      this.noteSubjectController.updateNoteSubject
    )
    this.router.delete(
      '/:id',
      // this.authController.authenticateJWT,
      this.noteSubjectController.deleteNoteSubject
    )
  }
}
