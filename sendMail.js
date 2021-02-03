var nodemailer = require('nodemailer');

class SendMail {

    constructor() {

    }
    sendInfoMail(info) {
        var transporter = nodemailer.createTransport({
            service: 'gmail',
            auth: {
                user: process.env.GMAIL,
                pass: process.env.GMAIL_PASSWORD
            }
        });

        var mailOptions = {
            from: process.env.GMAIL,
            to: info.email,
            subject: 'Registartion confirmation',
            text: 'Hi, you have successfully registered!!\n',
            html: `
         <table style="width:100%;border: 1px solid #333"><caption>Registration details</caption><tr style="width:100%;border: 1px solid #333"><td>Username</td><td>${info.username}</td></tr><tr style="width:100%;border: 1px solid #333"><td>First Name</td><td>${info.firstname}</td></tr><tr style="width:100%;border: 1px solid #333"><td>Last Name</td><td>${info.lastname}</td></tr></table>
          `
        };

        try {
            transporter.sendMail(mailOptions, function (error, info) {
                if (error) {
                    console.log(error);
                } else {
                    console.log('Email sent: ' + info.response);
                }
            });
        } catch (ex) {
            console.log(ex)
        }
    }

}
module.exports = SendMail;