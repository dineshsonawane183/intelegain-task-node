const app = require('express');
const { checkToken } = require('../../auth/token-validation');
const pool = require('./../../dbconfig/db')
const userRouter = app.Router();

//get All users
userRouter.get("/",checkToken,  (req, res) => {
    pool.query(`select u.id, u.user_name, u.first_name,u.last_name,u.created_date as user_created_date, r.role_type,
    r.role_description,p.permission_code from USERS_TABLE as u  inner join USER_ROLES as r  on u.role_id_fk = r.id
     inner join PERMISSIONS_TABLE as p on r.permission_id_fk = p.id`, (err, data) => {
        if (err) {
            res.status(400).json({ msg: "something went wrong" });
        } else {
            res.status(200).json({ data: data });
        }

    })
});

//create task
userRouter.post("/",checkToken, (req, res) => {
    pool.query(
        `insert into user (name, task_id,username,password) values(?,?,?,?);`,
        [
            req.body.name,
            req.body.task_id,
            req.body.username,
            req.body.password,
        ],
        (error, results) => {
            if (error) {
                res.status(400).json({ msg: "something went wrong" });
            } else {
                res.status(200).json({ res: results });
            }
        }
    );
});

//update task
userRouter.patch("/",checkToken, (req, res) => {
    pool.query(
        `update user set name=?, task_id=? where id = ?`,
        [
            req.body.name,
            req.body.task_id,
            req.body.id,
        ],
        (error, results) => {
            if (error) {
                res.status(400).json({ msg: "something went wrong" });
            } else {
                res.status(200).json({ res: results });
            }
        }
    );
});


module.exports = userRouter;
