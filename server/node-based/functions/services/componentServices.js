async function addNewComponent(db, component) {
  await db
      .collection("components")
      .doc("/" + component.id + "/")
      .create({
        name: component.name,
        description: component.description,
        available: component.available,
        totalCount: component.totalCount,
        imageURL: component.imageURL,
        datasheet: component.datasheet,
        position: component.position,
      });
}

async function getComponentById(db, id) {
  const document = db.collection("components").doc(id);
  const snapshot = await document.get();
  const response = snapshot.data();
  return response;
}

// use this function to retrieve all ids in one go and store it locally
async function getAllIds(db) {
  const snapshot = await db.collection("components").get();
  const ids = snapshot.docs.map((doc)=>doc.id);
  return ids;
}

// fetching documents by specific componentIds
async function getComponentsByIds(db, componentIds, index = 0) {
  try {
    const refs = componentIds.slice(index).map((id) => db.doc(`components/${id}`));
    const snapshot = await db.getAll(...refs);

    const response = snapshot.reduce((acc, doc, i) => {
      acc[componentIds[index + i]] = doc.exists ? doc.data() : null;
      return acc;
    }, {});

    return response;
  } catch (error) {
    console.error("Error in getComponentsByIds:", error);
    throw error;
  }
}


async function editComponentDetails(db, component) {
  await db.collection("components").doc(component.id).set(
      {
        name: component.name,
        description: component.description,
        available: component.available,
        totalCount: component.totalCount,
        imageURL: component.imageURL,
        datasheet: component.datasheet,
        position: component.position,
      },
      {merge: true},
  );
}

async function updateComponentCount(db, id, difference, taken) {
  const component = await getComponentById(db, id); // Ensure this returns a valid document
  let present = null;
  if (taken == true) {
    if (!component || component.count < difference) {
      return -1;
    }
    present = component.available - difference;
  } else {
    present = component.available + difference;
  }
  await db.collection("components").doc(id).update({available: present});

  return present;
}

async function checkoutComponents(db, requestedComponents) {
  // unpacks the ids and itemCount in seperate arrays.
  const componentMap = new Map(
      Object.entries(requestedComponents).map(([key, value]) => [
        Number(key),
        value,
      ]),
  );

  const componentIds = Array.from(componentMap.keys());
  const itemCount = Array.from(componentMap.values());
  // retrieves all the relevant documents based off ids in one read operation(max 10 at a time).
  const refs = componentIds.map((id) => db.doc(`components/${id}`));
  const snapshot = await db.getAll(...refs);
  const documents = snapshot.map((doc) => doc.data());

  // checks whether there are any null objects in the documents object; if any,sends a bad request.
  const updatedCount = [];
  for (let i = 0; i < documents.length; i++) {
    if (documents[i] == null) {
      return -1;
    } else {
      if (documents[i].available < itemCount[i]) {
        return -1;
      } else {
        const presentCount = documents[i].available - itemCount[i];
        updatedCount.push(presentCount);
      }
    }
  }
  // updates the available count for the component.
  for (let i = 0; i < componentIds.length; i++) {
    await db
        .collection("components")
        .doc(componentIds[i].toString())
        .update({count: updatedCount[i]});
  }
}

module.exports = {
  addNewComponent,
  getComponentById,
  editComponentDetails,
  updateComponentCount,
  checkoutComponents,
  getAllIds,
  getComponentsByIds,
};
