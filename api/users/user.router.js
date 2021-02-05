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


//update User
userRouter.patch("/",checkToken, (req, res) => {
    pool.query(
        `update USERS_TABLE set first_name =?, last_name =?,user_name =?, role_id_fk =? where id = ?`,
        [
            req.body.first_name,
            req.body.last_name,
            req.body.user_name,
            req.body.role_id,
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
//delete task
userRouter.delete("/delete", checkToken, (req, res) => {
    pool.query(
        `delete from USERS_TABLE where id = ?`,
        [
            req.body.id,
        ],
        (error, results) => {
            if (error) {
                res.status(400).json({ msg: "something went wrong" });
            } else {
                res.status(200).json({ status:"success",deletedEmp : req.body.id });
            }
        }
    );
});


module.exports = userRouter;
