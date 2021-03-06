require("dotenv").config();
const cors = require('cors');
const express = require("express");
const path = require("path");

const employeeRouter = require("./api/employee/employee.router.js");
const userRouter = require("./api/users/user.router.js");
const commonRouter = require("./api/common/common.router.js");
const userRole  = require("./api/role/role.router.js");
const app = express();

app.use(cors());
app.options('*', cors());

//body paser middleware
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

app.use(express.static(path.join(__dirname, "public")));
app.use('/api/employee', employeeRouter);
app.use('/api/user', userRouter);
app.use('/api/role', userRole);
app.use('/', commonRouter)

app.post('login', (req, res) => {

})
const port = process.env.PORT || 4000;
app.listen(port, () => {
    console.log("server up and running on PORT :", port);
});
