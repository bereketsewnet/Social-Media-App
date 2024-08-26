import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/helper/helper_function.dart';

import '../componets/my_back_button.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Users').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return displayMessageToUser(context, 'Something went wrong');
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              final users = snapshot.data!.docs;

              return Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 25, left: 25),
                    child: Row(
                      children: [
                        MyBackButton(),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        final user = users[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor:
                                Theme.of(context).colorScheme.inversePrimary,
                            child: const Icon(Icons.person),
                          ),
                          title: Text(user['userName']),
                          subtitle: Text(user['email']),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else {
              return const Text('No Data');
            }
          }),
    );
  }
}
