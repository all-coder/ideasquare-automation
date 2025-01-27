// necessary imports
const express = require("express");
const ComponentModel = require("../models/models");
//relative imports
const db = require("../services/firebase_db");
const { getComponentById, addNewComponent,editComponentDetails} = require("../services/component_services");

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
    const newComponent = new ComponentModel(
      req.body.id,
      req.body.name,
      req.body.description,
      req.body.count,
    );
    await addNewComponent(db, newComponent);
    res.status(200).send("Added New Component Successfully");
  } catch (error) {
    console.error(error);
    res.status(500).send(error);
  }
});

routes.post("/v1/components/:id/edit",async(req,res)=>{
    try{
        const newComponent = new ComponentModel(
            req.body.id,
            req.body.name,
            req.body.description,
            req.body.count
        )
        await editComponentDetails(db,newComponent);
        res.send(200).send("Component Details Updated Successfully ! ")
    }catch(error){
        console.log(error);
        res.status(500).send("Failed to Update Component Details !")
    }   
});

module.exports = routes;
