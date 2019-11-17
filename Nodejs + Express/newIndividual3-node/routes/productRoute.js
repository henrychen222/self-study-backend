// const db = require('../config/db');
// const ProductModel = require('../model/productModel')
//
// module.exports = router => {
//     router.get("/", (req, res) => {
//         db.query(ProductModel.getAllProductSQL(), (err, data) => {
//             if (!err) {
//                 res.status(200).json({
//                     message: "Products listed.",
//                     productId: data
//                 });
//             }
//         });
//     });
//
//     router.post("/add", (req, res) => {
//         //read product information from request
//         let product = new ProductModel(req.body.prd_name, req.body.prd_price);
//         db.query(product.getAddProductSQL(), (err, data) => {
//             res.status(200).json({
//                 message: "ProductModel added.",
//                 productId: data.insertId
//             });
//         });
//     });
//
//     router.get("/:productId", (req, res) => {
//         let pid = req.params.productId;
//         db.query(ProductModel.getProductByIdSQL(pid), (err, data) => {
//             if (!err) {
//                 if (data && data.length > 0) {
//                     res.status(200).json({
//                         message: "ProductModel found.",
//                         product: data
//                     });
//                 } else {
//                     res.status(200).json({
//                         message: "ProductModel Not found."
//                     });
//                 }
//             }
//         });
//     });
//
//     router.post("/delete", (req, res) => {
//         var pid = req.body.productId;
//         db.query(ProductModel.deleteProductByIdSQL(pid), (err, data) => {
//             if (!err) {
//                 if (data && data.affectedRows > 0) {
//                     res.status(200).json({
//                         message: `Product deleted with id = ${pid}.`,
//                         affectedRows: data.affectedRows
//                     });
//                 } else {
//                     res.status(200).json({
//                         message: "ProductModel Not found."
//                     });
//                 }
//             }
//         });
//     });
//
// }
//
