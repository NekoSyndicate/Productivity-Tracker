import {Request, Response} from "express";
import {verify} from "./verify";
const data = require('../../schema.json')
export default function schema(req: Request, res: Response) {
    if (verify(req)) {
        res.header("Content-Type", 'application/json');
        res.send(JSON.stringify(data));
        return;
    }
    res.status(403).send();
}