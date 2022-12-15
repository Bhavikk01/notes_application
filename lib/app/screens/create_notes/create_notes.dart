import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_application/app/models/notes_model.dart';
import 'package:notes_application/app/providers/providers.dart';

class CreateNotes extends ConsumerWidget {
  const CreateNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    TextEditingController titleController = TextEditingController();
    TextEditingController notesController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                  bottom: 15.h,
                  top: 10.h
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingActionButton(
                      heroTag: 'btn4',

                      onPressed: () {
                        Navigator.pop(context);
                      },
                      backgroundColor: Colors.blue,
                      child: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
                    FloatingActionButton(
                      heroTag: 'btn5',

                      onPressed: () {
                        var myUid = ref.watch(firebaseAuthProvider).currentUser?.uid;
                        ref.read(notesDatabaseProvider)!.addNotes(
                            Notes(
                              savingTime: DateTime.now(),
                              userId: myUid?? '',
                              notesTitle: titleController.text,
                              notes: notesController.text,
                              id: '',
                            )
                        );
                        Navigator.pop(context);
                      },
                      backgroundColor: Colors.blue,
                      child: const Icon(Icons.save, color: Colors.white),
                    )
                  ],
                ),
              ),
              SizedBox(
                child: TextFormField(
                  minLines: 1,
                  maxLines: 1,
                  controller: titleController,
                  style: GoogleFonts.montserrat(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Title....",
                    hintStyle: GoogleFonts.montserrat(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFFC4C4C4),
                    ),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(
                  top: 10.h
                ),
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black38,
                    width: 1.w
                  )
                ),
                child: TextFormField(
                  maxLines: 10000,
                  minLines: 1,
                  controller: notesController,
                  style: GoogleFonts.montserrat(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter your notes here...",
                    hintStyle: GoogleFonts.montserrat(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFFC4C4C4),
                    ),
                  ),
                ),
              ),

              GestureDetector(
                onTap: (){
                  titleController.text = '';
                  notesController.text = '';
                },
                child: Container(
                  margin: EdgeInsets.only(
                      top: 10.h
                  ),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'Delete this note',
                    style: GoogleFonts.montserrat(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.red,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: 'btn3',

          child: const Icon(Icons.delete, color: Colors.white),
          onPressed: () {
            titleController.text = '';
            notesController.text = '';
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
