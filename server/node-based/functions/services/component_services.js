// const { response } = require("express");
async function addNewComponent(db, component) {
  await db
    .collection("components")
    .doc("/" + component.id + "/")
    .create({
      name: component.name,
      description: component.description,
      count: component.count,
    });
}

async function getComponentById(db, id) {
  const document = db.collection("components").doc(id);
  let snapshot = await document.get();
  const response = snapshot.data();
  return response;
}

async function editComponentDetails(db, component) {
  await db.collection("components").doc(component.id).set(
    {
      name: component.name,
      description: component.description,
      count: component.count,
    },
    { merge: true }
  );
}
module.exports = { addNewComponent, getComponentById,editComponentDetails};
