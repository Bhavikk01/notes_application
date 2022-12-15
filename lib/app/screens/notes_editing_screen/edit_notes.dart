import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/notes_model.dart';
import '../../providers/providers.dart';

class EditNotes extends ConsumerWidget {
  final Notes notes;
  const EditNotes({required this.notes, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    TextEditingController titleController = TextEditingController(
      text: notes.notesTitle
    );
    TextEditingController notesController = TextEditingController(
      text: notes.notes
    );

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
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      backgroundColor: Colors.blue,
                      child: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
                    FloatingActionButton(
                      heroTag: 'btn2',

                      onPressed: () {
                        ref.read(notesDatabaseProvider)!.updateNotes(
                          notes.copyWith(
                            notes: notesController.text,
                            notesTitle: titleController.text,
                            savingTime: DateTime.now()
                          ),
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
          heroTag: 'btn1',
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
