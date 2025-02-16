// necessary imports
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

//eva icons, box icons

// relative imports
class AddComponent extends StatefulWidget {
  const AddComponent({super.key});
  @override
  State<StatefulWidget> createState() {
    return _AddComponentState();
  }
}

class _AddComponentState extends State<AddComponent> {
  final _formKey = GlobalKey<FormState>();
  final descriptionController = TextEditingController();
  final totalCount = TextEditingController();
  final rackNo = TextEditingController();
  final boxNo = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xff2F2E2E),
        centerTitle: true,
        title: Text(
          "Add Component",
          style: GoogleFonts.firaMono(
            fontWeight: FontWeight.w400,
            color: const Color(0xffced4da),
            fontSize: 30,
          ),
        ),
      ),
      body: Column(
        children: [
          // image holder
          Container(
            margin: const EdgeInsets.fromLTRB(10, 8, 10, 5),
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 3.5,
            decoration: BoxDecoration(
              color: Color(0xff2F2E2E),
            ),
          ),

          // form collecting information about the information
          Container(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 4),
            margin: const EdgeInsets.all(5),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    decoration: const BoxDecoration(
                      color: Color(0xff2F2E2E),
                    ),
                    child: TextFormField(
                      controller: descriptionController,
                      style: GoogleFonts.firaMono(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.electric_bike,
                          color: Colors.white,
                          size: 30,
                        ),
                        contentPadding: EdgeInsets.only(top: 12),
                        border: InputBorder.none,
                        hintText: "What is the component called?",
                        hintStyle: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  // description of the component
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color:
                          const Color(0xff2F2E2E), // Optional rounded corners
                    ),
                    child: SizedBox(
                      height: 150, // Adjust height as needed
                      child: TextFormField(
                        controller: totalCount,
                        maxLines: null, // Allows multiple lines
                        keyboardType: TextInputType.multiline,
                        style: GoogleFonts.firaMono(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Ionicons.document_sharp,
                            color: Colors.white,
                            size: 30,
                          ),
                          contentPadding: EdgeInsets.all(16), // Better spacing
                          border: InputBorder.none,
                          hintText: "What can you say about the component?",
                          hintStyle: TextStyle(color: Colors.white70),
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  //adding buttons for submission and resetting the form
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Color(0xff1F1F1E),
                            ),
                            right: BorderSide(
                              color: Color(0xff1F1F1E),
                            ),
                            top: BorderSide(
                              color: Color(0xff1F1F1E),
                            ),
                            bottom: BorderSide(
                              color: Color(0xff1F1F1E),
                            ),
                          ),
                          color: Colors.white,
                        ),
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(),
                          child: Text(
                            "Reset",
                            style: GoogleFonts.jetBrainsMono(
                              fontSize: 15,
                              color: const Color(0xff1F1F1E),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xff1F1F1E),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Add",
                            style: GoogleFonts.jetBrainsMono(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
