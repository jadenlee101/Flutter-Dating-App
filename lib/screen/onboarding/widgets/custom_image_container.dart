import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../blocs/images/onboarding_bloc.dart';
import '../../../repositories/storage/storage_repository.dart';

class CustomImageContainer extends StatelessWidget {
  final TabController tabController;

  const CustomImageContainer(
      {Key? key, required this.tabController, this.imageUrl});

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, right: 10),
      child: Container(
        height: 150,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border(
            bottom: BorderSide(color: Theme.of(context).primaryColor, width: 1),
            top: BorderSide(color: Theme.of(context).primaryColor, width: 1),
            left: BorderSide(color: Theme.of(context).primaryColor, width: 1),
            right: BorderSide(color: Theme.of(context).primaryColor, width: 1),
          ),
        ),
        child: (imageUrl == null)
            ? Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  onPressed: (() async {
                    ImagePicker _picker = ImagePicker();
                    final XFile? _image =
                        await _picker.pickImage(source: ImageSource.gallery);

                    if (_image == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('No image selected')));
                      print('object');
                    }
                    if (_image != null) {
                      StorageRepository().uploadImage(_image);
                      print('UPLOADING');
                      // BlocProvider.of<OnboardingBloc>(context).add(
                      //     UpdateUserImages(image: _image),
                      //   );
                    }
                  }),
                  icon: Icon(Icons.add_circle,
                      color: Theme.of(context).accentColor),
                ),
              )
            : Image.network(
                imageUrl!,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
