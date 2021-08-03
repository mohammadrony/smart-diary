"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.ProductRoutes = void 0;
const express_1 = require("express");
const ProductController_1 = require("../controllers/ProductController");
const AuthController_1 = require("../controllers/AuthController");
class ProductRoutes {
    constructor() {
        this.productController = new ProductController_1.ProductController();
        this.authController = new AuthController_1.AuthController();
        this.router = express_1.Router();
        this.routes();
    }
    routes() {
        // - /api/products
        this.router.get('/', this.productController.getProducts);
        this.router.get('/:id', this.productController.getProduct);
        this.router.post('/', this.authController.authenticateJWT, this.productController.createProduct);
        this.router.put('/:id', this.authController.authenticateJWT, this.productController.updateProduct);
        this.router.delete('/:id', this.authController.authenticateJWT, this.productController.deleteProduct);
    }
}
exports.ProductRoutes = ProductRoutes;
//# sourceMappingURL=ProductRoutes.js.map