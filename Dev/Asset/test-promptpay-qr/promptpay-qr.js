const generatePayload = require('promptpay-qr');
const qrcode = require('qrcode');
const fs = require('fs');

const mobileNumber = '082-335-2731';
const amount = 50;
const payload = generatePayload(mobileNumber, { amount });

// Convert to PNG QR Code
qrcode.toDataURL(payload, { type: 'image/png' }, (err, url) => {
    if (err) return console.log(err);
    const base64Data = url.replace(/^data:image\/png;base64,/, "");
    fs.writeFileSync('./qr.png', base64Data, 'base64', (err) => {
        if (err) {
            console.log(err);
        } else {
            console.log('PNG file created');
        }
    });
});