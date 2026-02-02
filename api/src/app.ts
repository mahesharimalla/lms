import express from "express";
import cors from "cors";
import helmet from "helmet";
import { errorHandler } from "./middleware/error.middleware";
import { notFoundHandler } from "./middleware/not-found.middleware";
import morgan from "morgan";
import healthchecksRouter from "./healthchecks";
import coursesRouter from "./courses/courses.router";

const app = express();
//const APIKEY = "ghp_1234567890abcdefghijklmnopqrstuvwxyz";


/**
 * Middlewares
 */
app.use(morgan("dev"));

// ✅ CORS FIRST
app.use(cors({
  origin: "*",
  methods: ["GET", "POST", "PUT", "DELETE", "OPTIONS"],
  allowedHeaders: ["Content-Type", "Authorization"]
}));

app.options("*", cors());

// ✅ Helmet AFTER CORS
app.use(helmet({
  crossOriginResourcePolicy: false
}));

app.use(express.json());

// Routers
app.use("/api", healthchecksRouter);
app.use("/api/courses", coursesRouter);

// Error and 404
app.use(errorHandler);
app.use(notFoundHandler);

export default app;










/*
import express from "express";
import cors from "cors";
import helmet from "helmet";
import { errorHandler } from "./middleware/error.middleware";
import { notFoundHandler } from "./middleware/not-found.middleware";
import morgan from "morgan";
import healthchecksRouter from "./healthchecks";
import coursesRouter from "./courses/courses.router";

const app = express();

/**
 * Middlewares
 */
/*
app.use(morgan("dev"));
app.use(helmet());

// Cors allow all origins
app.use(cors());
app.use(express.json());

// Routers
app.use("/api", healthchecksRouter);
app.use("/api/courses", coursesRouter);

// Error and 404
app.use(errorHandler);
app.use(notFoundHandler);

export default app;

*/
