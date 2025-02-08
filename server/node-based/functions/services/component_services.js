// TO-DO
// need to store the requestIDs in an another collection.

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

async function updateComponentCount(db, id, difference, taken) {
  let component = await getComponentById(db, id); // Ensure this returns a valid document
  var present = null;
  if (taken == true) {
    if (!component || component.count < difference) {
      return -1;
    }
    present = component.count - difference;
  } else {
    present = component.count + difference;
  }
  await db.collection("components").doc(id).update({ count: present });

  return present;
}


async function checkoutComponents(db, requestedComponents) {
  //unpacks the ids and itemCount in seperate arrays.
  const componentMap = new Map(
    Object.entries(requestedComponents).map(([key, value]) => [Number(key),value,]));

  const componentIds = Array.from(componentMap.keys());
  const itemCount = Array.from(componentMap.values());
  // retrieves all the relevant documents based off ids in one read operation(max 10 at a time).
  const refs = componentIds.map((id) => db.doc(`components/${id}`));
  const snapshot = await db.getAll(...refs);
  const documents = snapshot.map((doc) => doc.data());

  // checks whether there are any null objects in the documents object; if any,sends a bad request.
  var updatedCount = [];
  for (let i = 0; i < documents.length; i++) {
    if (documents[i] == null) {
      return -1;
    } else {
      if (documents[i].count < itemCount[i]) {
        return -1;
      } else {
        var presentCount = documents[i].count - itemCount[i];
        updatedCount.push(presentCount);
      }
    }
  }
  // updates the available count for the component.
  for(let i=0;i<componentIds.length;i++){
    await db.collection("components").doc(componentIds[i].toString()).update({count:updatedCount[i]});;
  }
}

module.exports = {
  addNewComponent,
  getComponentById,
  editComponentDetails,
  updateComponentCount,
  checkoutComponents,
};
