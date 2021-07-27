import { Router } from 'express'
import { ProductController } from '../controllers/productController'
import { AuthController } from '../controllers/AuthController'

export class ProductRoutes {
  public router: Router
  public productController: ProductController = new ProductController()
  public authController: AuthController = new AuthController()

  constructor() {
    this.router = Router()
    this.routes()
  }

  routes() {
    // - /api/products
    this.router.get('/', this.productController.getProducts)
    this.router.get('/:id', this.productController.getProduct)
    this.router.post('/', this.authController.authenticateJWT, this.productController.createProduct)
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
