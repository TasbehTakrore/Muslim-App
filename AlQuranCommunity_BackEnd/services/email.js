const nodemailer = require("nodemailer");

const sendEmail = async (dest, subject, code) => {
  let transporter = nodemailer.createTransport({
    service: "gmail",
    auth: {
        user: 'alqurancommunity2023@gmail.com',
        pass: 'iktuinjdfiapckzl'
    },
  });

  let message = `
    <div  style="font-family: sans-serif; margin: 0 auto; max-width: 500px; padding: 20px; text-align: center; border: 2px solid #245923; ">
      <h1 style="text-align: center; color:#245923;">Reset Password</h1>
      <p style="text-align: center;color:black;font-weight:500;">
      </p>
      <p style="color:black;font-weight:500;">
        As-salamu alaykum<br>
        We received a request to reset your password. Please use the code below to reset your password
      </p>
      <h2 style="text-align: center;color:red">${code}</h2>
      <p style="text-align: center; color:black; font-weight:700; ">
        If you did not request a password reset, please ignore this email.
      </p>
      <p style="text-align: center; font-weight:500;color:black;">
        Regards,<br>
        Al-Quran Community App
      </p>
    </div>
  `;

  let info = await transporter.sendMail({
    from: '"Al-Quran Community App" <alqurancommunity2023@gmail.com>',
    to: dest,
    subject:  subject,
    html: message,
  });

  console.log("Message sent: %s", info.messageId);
};

module.exports = { sendEmail };
