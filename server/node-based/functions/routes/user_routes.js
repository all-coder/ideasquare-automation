// necessary imports
const express = require("express");

//relative imports
const db = require("../services/firebase_db");
const { addNewUser } = require("../services/user_services");
const { Component, User } = require("../models/models");

const routes = express.Router();

routes.post("/v1/user/signup", async (req, res) => {
  try {
    const newUser = new User(
      req.body.name,
      req.body.roll_no,
      req.body.club_name,
      req.body.member_type
    );
    await addNewUser(db, newUser);
    res.status(200).send("User Added Successfully ! ");
  } catch (error) {
    console.log(error);
    res.status(500).send("Failed to Add New User ! ");
  }
});

module.exports =routes;
