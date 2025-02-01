// necessary imports
const express = require("express");
const cors = require("cors");

// relative imports
const functions = require("firebase-functions");
const component_routes = require("./routes/component_routes");
const user_routes = require("./routes/user_routes");

// initializing the express app
const app = express();
app.use(cors({ origin: true }));

// setting up the routes
app.use(component_routes)
app.use(user_routes)

exports.app = functions.https.onRequest(app);
