import {Request, Response} from "express";
export function verify_route(req: Request, res: Response) {
    if (verify(req)) {
        res.status(200).send();
    }
    res.status(403).send();
}

export function verify(req: Request): boolean {
    if (process.env.AUTH_TYPE == "CODE") {
        return req.headers.authorization == process.env.ACCESS_CODE
    }
    return false;
}