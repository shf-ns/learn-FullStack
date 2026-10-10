import express, { type Express, type Request, type Response } from "express";
import cors from "cors";

// 解析前端发来的 JSON 请求体
const app: Express = express();
const PORT = 3000;

// CORS 跨域：允许前端（localhost:5173）调用后端（localhost:3000）
app.use(
  cors({
    origin: "http://localhost:5173",
    credentials: true,
    methods: ["GET", "POST"],
  }),
);

app.use(express.json());

app.get("/api", (req: Request, res: Response) => {
  res.json({ message: "Hello World!" });
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
