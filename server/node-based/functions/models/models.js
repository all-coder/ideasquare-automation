class Component{
    constructor(id,name,description,count){
        this.id = id; // will generate this unique id using uuid on the frontend
        this.name = name;
        this.description = description;
        this.count = count;
    }
}

class User{
    constructor(name,roll_no,club_name,member_type){
        this.name = name;
        this.roll_no =roll_no; // point of difference
        this.club_name = club_name;
        this.member_type = member_type;
    }
}

module.exports = {Component,User};