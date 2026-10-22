import mysql from "mysql2/promise";
import dotenv from "dotenv";
dotenv.config({ path: "../.env" });

// 创建连接池，设置连接池的参数
const pool = mysql.createPool({
  host: process.env.DB_HOST || "localhost",
  port: Number(process.env.DB_PORT) || 3306,
  user: process.env.DB_USER || "root",
  database: process.env.DB_NAME || "link",
  password: process.env.DB_PASSWORD,
  waitForConnections: true,
  connectionLimit: 10,
  maxIdle: 10, // 最大空闲连接数，默认等于 `connectionLimit`
  idleTimeout: 60000, // 空闲连接超时，以毫秒为单位，默认值为 60000 ms
  queueLimit: 0,
  enableKeepAlive: true,
  keepAliveInitialDelay: 0,
});

export const data: () => Promise<
  | {
      documents: mysql.QueryResult;
      sites: mysql.QueryResult;
    }
  | undefined
> = async () => {
  try {
    // execute 将在内部调用 prepare 和 query
    const [documents] = await pool.execute(
      "SELECT site.* FROM category, site WHERE category.id = site.category_id AND category_id = 1",
    );
    const [sites] = await pool.execute(
      "SELECT site.* FROM category, site WHERE category.id = site.category_id AND category_id = 2",
    );

    return { documents, sites };
  } catch (err) {
    console.log(err);
  }
};
