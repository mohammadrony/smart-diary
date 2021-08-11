import { Router } from 'express'
import { productController } from '../controllers/product.controller'
import { authController } from '../controllers/auth.controller'

export class productRoutes {
  public router: Router
  public productController: productController = new productController()
  public authController: authController = new authController()

  constructor() {
    this.router = Router()
    this.routes()
  }

  routes() {
    // - /api/products
    this.router.get('/', this.productController.getProducts)
    this.router.get('/:id', this.productController.getProduct)
    this.router.post(
      '/',
      this.authController.authenticateJWT,
      this.productController.createProduct,
    )
    this.router.put(
      '/:id',
      this.authController.authenticateJWT,
      this.productController.updateProduct
    )
    this.router.delete(
      '/:id',
      this.authController.authenticateJWT,
      this.productController.deleteProduct
    )
  }
}
