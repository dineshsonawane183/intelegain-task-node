const app = require('express');
const pool = require('../../dbconfig/db');
const router = app.Router();
var dateFormat = require('dateformat');
const { checkToken } = require('../../auth/token-validation');

router.get("/", checkToken, (req, res) => {
    pool.query('select * from USER_ROLES', (err, data) => {
        if (err) {
            res.status(400).json({ msg: "something went wrong" });
        } else {
            res.status(200).json({ data: data });
        }

    })
});
router.get("/id", checkToken, (req, res) => {
    pool.query('select * from USER_ROLES where id = ?', [
        req.query.id?parseInt( req.query.id): req.query.id
    ], (err, data) => {
        if (err) {
            res.status(400).json({ msg: "something went wrong" });
        } else {
            res.status(200).json({ data: data[0] });
        }

    })
});
router.get("/permission", checkToken, (req, res) => {
    pool.query('select * from PERMISSIONS_TABLE', (err, data) => {
        if (err) {
            res.status(400).json({ msg: "something went wrong" });
        } else {
            res.status(200).json({ data: data });
        }

    })
});

router.post("/", checkToken, (req, res) => {
    const arr = [
        req.body.role_type,
        req.body.role_description,
        req.body.permission ? parseInt(req.body.permission) : req.body.permission,
        req.body.parent ? parseInt(req.body.parent) : req.body.parent,
    ];
    pool.query(
        `insert into user_roles (ROLE_TYPE,ROLE_DESCRIPTION,PERMISSION_ID_FK,PARENT) values(?,?,?,?);`,
        arr,
        (error, results) => {
            if (error) {
                res.status(400).json({ msg: "something went wrong" });
            } else {
                res.status(200).json({ res: results });
            }
        }
    );
});
router.post("/permission", checkToken, (req, res) => {
    const arr = [
        req.body.permission_code,
        req.body.permission_desc,
    ];
    pool.query(
        `insert into permissions_table (PERMISSION_CODE,PERMISSION_DESC) values(?,?);`,
        arr,
        (error, results) => {
            if (error) {
                res.status(400).json({ msg: "something went wrong" });
            } else {
                res.status(200).json({ res: results });
            }
        }
    );
});


module.exports = router;
