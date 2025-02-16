const express = require("express");
const {Component, User} = require("../models/models");
// relative imports
const db = require("../services/firebaseDb");
const {
  addNewComponent,
  getComponentById,
  editComponentDetails,
  updateComponentCount,
  checkoutComponents,
  getComponentsByIds,
  getAllIds,
} = require("../services/componentServices");

const routes = express.Router();

// routes


// Ideasquare Inventory API
routes.get("/v1", (req, res) => {
  return res.status(200).send("IdeaSquare Inventory API V1.0");
});

// retrieves all ids present in the collection("components")
routes.get("/v1/components/get-all-ids", async (req, res) => {
  try {
    const response = await getAllIds(db);
    if (response) {
      res.status(200).send(response);
    } else {
      res.status(500).send("Failed to fetch ids! Try Again!");
    }
  } catch (error) {
    res.status(500).send("Internal Server Error!");
  }
});

// gets(but uses post request)components based on the ids array provided
routes.post("/v1/components/get-components-by-ids", async (req, res) => {
  try {
    const {componentIds, index = 0} = req.body;

    if (!componentIds || !Array.isArray(componentIds)) {
      return res.status(400).json({
        error: "Invalid request: componentIds must be an array",
      });
    }

    if (componentIds.length === 0) {
      return res.status(400).json({
        error: "Component Ids array is empty",
      });
    }

    // Validate index
    if (typeof index !== "number" || index < 0 || index >= componentIds.length) {
      return res.status(400).json({
        error: "Invalid index value",
      });
    }
    // res.status(200).send(componentIds);
    // return;
    const components = await getComponentsByIds(db, componentIds, index);

    if (!components) {
      return res.status(404).json({
        error: "No components found for the provided IDs",
      });
    }

    return res.status(200).json(components);
  } catch (error) {
    console.error("Error fetching components:", error);
    return res.status(500).json({
      error: "Internal Server Error",
      message: error.message,
    });
  }
});

// retrieves individual component based on singular id provided
routes.get("/v1/components/:id", async (req, res) => {
  try {
    const response = await getComponentById(db, req.params.id);
    if (response == null) {
      res
          .status(500)
          .send("Component not found ! Re-Check your ID once more !");
      return;
    }
    res.status(200).send(response);
  } catch (error) {
    console.error(error);
    res.status(500).send(error);
  }
});


// adds new component to the collection.
routes.post("/v1/components/add", async (req, res) => {
  try {
    const newComponent = new Component(
        req.body.id,
        req.body.name,
        req.body.description,
        req.body.available,
        req.body.totalCount,
        req.body.position,
        req.body.datasheet,
        req.body.imageURL,
    );
    await addNewComponent(db, newComponent);
    res.status(200).send(`Component with ID ${newComponent.id}`);
  } catch (error) {
    console.error(error);
    res.status(500).send(error);
  }
});

// allows to edit the component's details, more modifications are required.
routes.post("/v1/components/:id/edit", async (req, res) => {
  try {
    const newComponent = new Component(
        req.body.id,
        req.body.name,
        req.body.description,
        req.body.available,
        req.body.totalCount,
        req.body.position,
        req.body.datasheet,
        req.body.imageURL,
    );
    await editComponentDetails(db, newComponent);
    res.status(200).send("Component Details Updated Successfully ! ");
  } catch (error) {
    console.log(error);
    res.status(500).send("Failed to Update Component Details !");
  }
});

routes.post("/v1/components/:id/update-count", async (req, res) => {
  const id = req.params.id;
  try {
    const result = await updateComponentCount(
        db,
        id,
        req.body.difference,
        req.body.taken,
    );
    if (result == -1) {
      res.status(500).send("Bad request! try once more !");
    } else {
      res.status(200).send("Count updated for id:" + id);
    }
  } catch (error) {
    console.log(error);
    res.status(500).send("Bad Request! Try once more!");
  }
});

routes.post("/v1/components/checkout", async (req, res) => {
  const requestedComponents = req.body.requestedComponents;
  const requestId = req.body.requestId;
  try {
    const response = await checkoutComponents(db, requestedComponents);
    if (response == -1) {
      res.status(500).send("Reload once more! and try again!");
      return;
    }
    res.status(200).send(response);
  } catch (error) {
    res.status(500).send("Bad Request! Try again!");
  }
});

module.exports = routes;
