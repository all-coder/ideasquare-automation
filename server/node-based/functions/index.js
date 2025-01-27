// necessary imports
const functions = require("firebase-functions");
const routes = require("./routes/component_routes");

// initializing express app, and database
const express = require("express");
const cors = require("cors");

const app = express();

app.use(cors({ origin: true }));
app.use(routes)
exports.app = functions.https.onRequest(app);
