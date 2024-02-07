// src/index.js
import express, { Express, Request, Response } from "express";
import dotenv from "dotenv";
import schema from "./routes/schema";
import {verify_route} from "./routes/verify";

dotenv.config();

const app: Express = express();
const port = process.env.PORT || 3000;

app.get(process.env.ROOT + "schema", schema);
app.get(process.env.ROOT + "verify", verify_route);


app.listen(port, () => {
    console.log(`[server]: Server is running at http://localhost:${port}`);
});