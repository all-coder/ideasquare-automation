// necessary imports
const express = require("express");

//relative imports
const db = require("../services/firebase_db");
const { addNewUser, getUserByRollNo } = require("../services/user_services");
const { Component, User } = require("../models/models");

const routes = express.Router();

routes.post("/v1/user/signup", async (req, res) => {
  try {
    const newUser = new User(
      req.body.name,
      req.body.roll_no,
      req.body.club_name,
      req.body.member_type,
      req.body.email,
      req.body.password
    );
    await addNewUser(db, newUser);
    res.status(200).send("User Added Successfully ! ");
  } catch (error) {
    console.log(error);
    res.status(500).send("Failed to Add New User ! ");
  }
});

routes.get("/v1/user/authentication/:rollNo",async (req,res)=>{
  try{
    const rollNumber=req.params.rollNo;
    const userData=await getUserByRollNo(db,rollNumber);
    if(userData){
      res.status(200).json(userData);
    }else{
      res.status(404).send("User not found");
      console.log("User not found");
    }
  }catch(error){
    console.error(error);
    res.status(500).send("Error in getting data from the data base.");
  }
});



module.exports =routes;
