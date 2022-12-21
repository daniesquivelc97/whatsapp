import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:whatsapp_messenger/common/extensions/custom_theme_extension.dart';
import 'package:whatsapp_messenger/common/widgets/custom_icon_button.dart';

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({Key? key}) : super(key: key);

  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  List<Widget> imageList = [];

  fetchAllImages() async {
    final permission = await PhotoManager.requestPermissionExtend();
    if (!permission.isAuth) return PhotoManager.openSetting();

    List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
      type: RequestType.image,
      onlyAll: true,
    );

    List<AssetEntity> photos = await albums[0].getAssetListPaged(
      page: 0,
      size: 24,
    );

    List<Widget> temporal = [];

    for (var asset in photos) {
      temporal.add(
        FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: MemoryImage(snapshot.data as Uint8List),
                  ),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      );
    }
    setState(() {
      imageList.addAll(temporal);
    });
  }

  @override
  void initState() {
    fetchAllImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        leading: CustomIconButton(
          onTap: () => Navigator.pop(context),
          icon: Icons.arrow_back,
        ),
        title: Text(
          'WhatsApp',
          style: TextStyle(
            color: context.theme.authAppbarTextColor,
          ),
        ),
        actions: [
          CustomIconButton(
            onTap: () {},
            icon: Icons.more_vert,
          ),
        ],
      ),
      body: GridView.builder(
        itemCount: imageList.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (_, index) {
          return imageList[index];
        },
      ),
    );
  }
}
