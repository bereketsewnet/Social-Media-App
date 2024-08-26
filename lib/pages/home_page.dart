import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/componets/my_post_button.dart';
import 'package:social_media_app/componets/my_textField.dart';

import '../componets/my_drawer.dart';
import '../componets/my_list_tile.dart';
import '../database/firestore.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController newPostController = TextEditingController();
  final FireStoreDatabase database = FireStoreDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'W A L L',
        ),
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
              children: [
                Expanded(
                  child: MyTextField(
                    textHint: 'Say something',
                    obscureText: false,
                    controller: newPostController,
                  ),
                ),
                PostButton(
                  onTap: postMessage,
                ),
              ],
            ),
          ),
          StreamBuilder(
              stream: database.getPostStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final posts = snapshot.data!.docs;
                if (snapshot.data == null || posts.isEmpty) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(25),
                      child: Text('No Posts.. Post something'),
                    ),
                  );
                }

                return Expanded(
                  child: ListView.builder(
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        final post = posts[index];

                        String message = post['postMessage'];
                        String userEmail = post['userEmail'];
                        Timestamp timeStamp = post['timeStamp'];

                        return MyListTile(
                          message: message,
                          userEmail: userEmail,
                        );
                      }),
                );
              }),
        ],
      ),
    );
  }

  void postMessage() {
    if (newPostController.text.isNotEmpty) {
      database.addPost(newPostController.text);
      newPostController.clear();
    }
  }
}
