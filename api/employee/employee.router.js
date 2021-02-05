const app = require('express');
const pool = require('../../dbconfig/db');
const router = app.Router();
var dateFormat = require('dateformat');
const { checkToken } = require('../../auth/token-validation');
//get All tasks
router.get("/", checkToken,  (req, res) => {
    // let off = req.query.offset?parseInt(req.query.offset):6;
    // let limit = req.query.limit?parseInt(req.query.limit):20;
    // const firstParam = !req.query.limit ? 0 :limit * off;  
    
    pool.query('select * from employee order by id desc' ,(err, data) => {
        if (err) {
            res.status(400).json({ msg: "something went wrong" });
        } else {
            res.status(200).json({ data: data });
        }

    })
});
router.get("/totalEmployees",  checkToken,  (req, res) => {
    
    pool.query('select count(*) as total from employee limit 1' ,(err, data) => {
        if (err) {
            res.status(400).json({ msg: "something went wrong" });
        } else {
            res.status(200).json(data);
        }

    })
});

//create Employee
router.post("/", checkToken, (req, res) => {
    const arr = [
        req.body.name,
        req.body.address,
        req.body.contact,
        req.body.email,
        req.body.designation,
        dateFormat(new Date(req.body.joining_date),'yyyy-mm-dd'),
        dateFormat(new Date(req.body.birth_date),'yyyy-mm-dd'),
    ];
    pool.query(
        ` insert into employee(name,address,contact,email,designation,joining_date,birth_date) values(?,?,?,?,?,?,?);`,
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


//delete task
router.delete("/delete", checkToken, (req, res) => {
    pool.query(
        `delete from employee where id = ?`,
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


//update employee
router.patch("/",   checkToken,(req, res) => {
    pool.query(
        `update employee set name=?, address=?, contact=?, email=?,designation = ?,joining_date = ?,birth_date = ? where id = ?`,
        [
            req.body.name,
            req.body.address,
            req.body.contact,
            req.body.email,
            req.body.designation,
            dateFormat(new Date(req.body.joining_date),'yyyy-mm-dd'),
            dateFormat(new Date(req.body.birth_date),'yyyy-mm-dd'),
            req.body.id
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


module.exports = router;
