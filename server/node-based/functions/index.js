const functions = require("firebase-functions");
var admin = require("firebase-admin");
var serviceAccount = require("./permissions.json");
admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
});
  

const express = require("express");
// const cors = require("cors");
const db = admin.firestore()
const app = express();
// app.use(cors({origin:true}));


app.get("/hello-world",(req,res)=>{
    return res.status(200).send("Hello world");
});

app.post("/components/add",(req,res)=>{
    (async ()=>{
        try{
            await db.collection("components").doc('/' + req.body.id + '/').create({
                name:req.body.name,
                description:req.body.description,
                count:req.body.count


            })

            res.status(200).send();
        }catch(error)
        {
            console.log(error);
            return res.status(500).send(error);
        }
    })();
});

exports.app = functions.https.onRequest(app);