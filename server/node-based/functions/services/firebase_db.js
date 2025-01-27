//this the firebase db initialization file
const admin = require("firebase-admin");
const serviceAccount = require("../permissions.json");

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
});

const db = admin.firestore();
module.exports = db;