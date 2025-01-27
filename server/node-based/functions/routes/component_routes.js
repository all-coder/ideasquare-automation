// necessary imports
const express = require("express");

//relative imports
const db = require("../services/firebase_db")
const { getComponentById, addNewComponent } = require("../services/components");

const routes = express.Router();


// routes
routes.get("/v1", (req, res) => {
  return res.status(200).send("IdeaSquare Inventory API Version");
});

routes.get("/v1/components/:id", async (req, res) => {
  try {
    const response = await getComponentById(db, req.params.id);
    res.status(200).send(response);
  } catch (error) {
    console.error(error);
    res.status(500).send(error);
  }
});

routes.post("/v1/components/add", async (req, res) => {
  try {
    await addNewComponent(
      db,
      req.body.id,
      req.body.name,
      req.body.description,
      req.body.count
    );
    res.status(200).send("Added New Component Successfully");
  } catch (error) {
    console.error(error);
    res.status(500).send(error);
  }
});

module.exports = routes;
