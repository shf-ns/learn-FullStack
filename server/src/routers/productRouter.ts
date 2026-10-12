import { Router } from "express";
import { documents, sites } from "../controllers/productController.ts";

const router = Router();

router.get("/documents", documents);
router.get("/sites", sites);

export default router;
