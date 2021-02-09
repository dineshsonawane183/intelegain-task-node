const app = require('express');
const pool = require('../../dbconfig/db');
const { hashSync, genSaltSync, compareSync } = require("bcrypt");
const e = require('cors');
const router = app.Router();
const { sign } = require("jsonwebtoken");
const SendMail = require('../../sendMail');


router.post("/login", (req, res) => {
    pool.query(
        `select id,user_name,first_name,last_name,password,role_id_fk,permission_id from USERS_TABLE where USER_NAME = ?`,
        [
            req.body.username
        ],
        (error, results) => {
            if (error) {
                res.status(400).json({ msg: "something went wrong", error: error });
            } else {
                if (results.length >= 1) {
                    const result = compareSync(req.body.password, results[0].password);
                    if (result) {
                        delete results[0].password;
                        const jsontoken = sign({ result: results[0] }, process.env.TOKEN_SECRET, {
                            expiresIn: "1h"
                        });
                        res.status(200).json({ status: "success", data: results[0], token: jsontoken });
                    } else {
                        res.status(200).json({ status: "failure", msg: "invalid username/password" });
                    }

                } else {
                    res.status(200).json({ status: "failure", msg: "invalid username/password" });
                }
            }
        }
    );
});
router.post("/register", (req, res) => {
    const body = req.body;
    const salt = genSaltSync(10);
    body.password = hashSync(body.password, salt);
    pool.query(
        `insert into users_table (USER_NAME,PASSWORD,FIRST_NAME,LAST_NAME,ROLE_ID_FK,EMAIL) values (?,?,?,?,?,?);`,
        [
            req.body.username,
            req.body.password,
            req.body.firstname,
            req.body.lastname,
            req.body.role,
            req.body.email
        ],
        (error, results) => {
            if (error) {
                res.status(400).json({ msg: "something went wrong", error: error });
            } else {
                delete body.password;
                //send registration confirmation mail
                new SendMail().sendInfoMail(body);
                res.status(200).json({ status: "success", data: results });
            }
        }
    );
});

module.exports = router;
