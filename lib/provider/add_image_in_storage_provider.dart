import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as fstorage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../generated/l10n.dart';

class AddImageInStorageProvider extends ChangeNotifier{
  File? image;
  String? imageUrl;
  bool buttonState = false;
  CollectionReference refColl = FirebaseFirestore.instance.collection('stocks');

  Future pickingImage(bool camera) async {
    try {
      final image = await ImagePicker().pickImage(
        source: camera == true ? ImageSource.camera : ImageSource.gallery,
      );
      if (image == null) return;
      final imageTemporary = File(image.path);
      this.image = imageTemporary;
      notifyListeners();
    } on PlatformException {
      return const SnackBar(
        content: Text('Ошибка'),
      );
    }
  }

  dynamic addImageInStorage() async {
    if (image!.path.isNotEmpty) {
      buttonState = true;
      notifyListeners();
      final String fileName = DateTime.now().microsecondsSinceEpoch.toString();
      fstorage.Reference reference = fstorage.FirebaseStorage.instance
          .ref()
          .child("images/")
          .child(fileName);
      final File file = File(image!.path);
      fstorage.UploadTask uploadTask = reference.putFile(file);
      fstorage.TaskSnapshot taskSnapshot = await uploadTask;
      await taskSnapshot.ref.getDownloadURL().then((url) {
        imageUrl = url;
        notifyListeners();
      });
    }
  }

  showModalSheet(BuildContext context) {
    return showModalBottomSheet(
      clipBehavior: Clip.hardEdge,
      backgroundColor: Theme.of(context).primaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          width: double.infinity,
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 25.0,
              ),
              Text(
                S.of(context).choose_method_text,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: 'SFProSemibold',
                  color: Theme.of(context).canvasColor,
                  fontSize: 21.0,
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          pickingImage(false);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).backgroundColor,
                          onPrimary: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 13.0),
                          child: Text(
                            S.of(context).from_gallery_text,
                            style: const TextStyle(
                              fontFamily: 'SFProSemibold',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          pickingImage(true);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).backgroundColor,
                          onPrimary: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 13.0),
                          child: Text(
                            S.of(context).camera_text,
                            style: const TextStyle(
                              fontFamily: 'SFProSemibold',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}