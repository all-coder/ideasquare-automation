const { response } = require("express");

async function addNewComponent(db, id, name, description, count) {
  await db
    .collection("components")
    .doc("/" + id + "/")
    .create({
      name: name,
      description: description,
      count: count,
    });
}

async function getComponentById(db,id){
    const document = db.collection("components").doc(id);
    let snapshot = await document.get()
    const response = snapshot.data()
    return response
}
module.exports = {addNewComponent,getComponentById};
