async function addNewUser(db, user) {
  await db
    .collection("users")
    .doc("/" + user.roll_no + "/")
    .create({
      name: user.name,
      club_name: user.club_name,
      member_type: user.member_type,
      email:user.email,
      password:user.password
    });
}

async function getUserByRollNo(db,rollNo){
  const document=db.collection("users").doc(rollNo);
  let snapshot=await document.get();
  const response=snapshot.data();
  return response;  
}

module.exports = {addNewUser,getUserByRollNo};
