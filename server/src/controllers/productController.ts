import type { Request, Response, NextFunction } from "express";
import { data } from "../config/db.ts";

export const documents = async (
  req: Request,
  res: Response,
  next: NextFunction,
) => {
  try {
    const { documents }: any = await data();
    if (!documents) {
      return res.status(404).json({ code: 404, message: "项目不存在" });
    }
    res.json({ code: 200, message: "success", data: documents });
  } catch (err) {
    next(err);
  }
};
export const sites = async (
  req: Request,
  res: Response,
  next: NextFunction,
) => {
  try {
    const { sites }: any = await data();
    if (!sites) {
      return res.status(404).json({ code: 404, message: "项目不存在" });
    }
    res.json({ code: 200, message: "success", data: sites });
  } catch (err) {
    next(err);
  }
};
