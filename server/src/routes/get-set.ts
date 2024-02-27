import {Request, Response} from "express";
import {verify} from "./verify";
// @ts-ignore
import schema from "../../schema.json" assert { type: "json" };

let data = new Map<String, any>();
export function get(req: Request, res: Response) {
    let id = req.params.id;
    if (!doesExist(id)) {
        res.sendStatus(404)
        return;
    }

    if (!data.has(id)) {
        res.send({count: 0});
        return;
    }
    res.send({"count": data.get(id)});
}

export function set(req: Request, res: Response) {
    let id = req.params.id;
    let value = req.params.value;
    console.log(value);
    if (!doesExist(id)) {
        res.sendStatus(404)
        return;
    }

    switch (getType(id)) {
        default:
            data.set(id, +value);
            break;
    }
    res.sendStatus(200)
}

function doesExist(key: String):boolean {
    for (let i = 0; i < schema.schema.length; i++) {
        if (schema.schema[i].id == key) {
            return true;
        }
    }
    return false;
}

function getType(key: String):boolean {
    for (let i = 0; i < schema.length; i++) {
        if (schema[i].id == key) {
            return schema[i].type;
        }
    }
    return false;
}