// necessary imports
const express = require("express");
const {Component,User} = require("../models/models");
//relative imports
const db = require("../services/firebase_db");
const { getComponentById, addNewComponent,editComponentDetails, updateComponentCount,checkoutComponents} = require("../services/component_services");

const routes = express.Router();

// routes
routes.get("/v1", (req, res) => {
  return res.status(200).send("IdeaSquare Inventory API V1.0");
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
    const newComponent = new Component(
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


// need to modify the function so that only name, descriptions are edited and updated accordingly.
routes.post("/v1/components/:id/edit",async(req,res)=>{
    try{
        const newComponent = new Component(
            req.body.id,
            req.body.name,
            req.body.description,
            req.body.count
        )
        await editComponentDetails(db,newComponent);
        res.status(200).send("Component Details Updated Successfully ! ")
    }catch(error){
        console.log(error);
        res.status(500).send("Failed to Update Component Details !")
    }   
});

routes.post("/v1/components/:id/update-count",async(req,res)=>{
  const id = req.params.id;
  try{
    let result = await updateComponentCount(db,id,req.body.difference,req.body.taken);
    if(result==-1){
      res.status(500).send("Bad request! try once more !");
    }
    else{
      res.status(200).send("Count updated for id:" + id);
    }
  }catch(error){
    console.log(error);
    res.status(500).send("Bad Request! Try once more!");
  }
});

routes.post("/v1/components/checkout",async(req,res)=>{
  const requestedComponents = req.body.requestedComponents;
  const requestId= req.body.requestId;
  try{
  let response = await checkoutComponents(db,requestedComponents);
  if(response==-1){
    res.status(500).send("Reload once more! and try again!");
    return
  }
  res.status(200).send(response);
  }catch(error){
    res.status(500).send("Bad Request! Try again!")
  }

});

module.exports = routes;
