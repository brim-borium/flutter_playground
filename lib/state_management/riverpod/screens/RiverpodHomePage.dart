import 'package:flutter/material.dart';
import 'package:flutter_playground/state_management/riverpod/models/user.dart';
import 'package:flutter_playground/state_management/riverpod/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, watch, child) {
          final state = watch(userNotifierProvider.state);

          return state.when(() => homePageInitial(context),
              loading: () => homePageLoading(),
              loaded: (user) => homePageLoaded(context, user: user),
              error: (errorMessage) =>
                  homePageError(context, message: errorMessage));
        },
      ),
    );
  }

  Widget homePageInitial(BuildContext context) {
    final TextEditingController _userIdController = TextEditingController();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(controller: _userIdController),
          ),
          ElevatedButton(
              onPressed: () {
                context
                    .read(userNotifierProvider)
                    .getUserInfo(_userIdController.text);
              },
              child: Text('Get user info'))
        ],
      ),
    );
  }

  Widget homePageLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget homePageLoaded(BuildContext context, {required User user}) {
    final TextEditingController _userIdController = TextEditingController();

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(user.data.avatar),
            Text('NAME: ${user.data.firstName} ${user.data.lastName}'),
            Text('EMAIL: ${user.data.email}'),
            Text('ID: ${user.data.id}'),
            TextField(
              controller: _userIdController,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                context
                    .read(userNotifierProvider)
                    .getUserInfo(_userIdController.text);
              },
              child: Text('Get user info'),
            ),
          ],
        ),
      ),
    );
  }

  Widget homePageError(BuildContext context, {required String message}) {
    final TextEditingController _userIdController = TextEditingController();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _userIdController,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context
                  .read(userNotifierProvider)
                  .getUserInfo(_userIdController.text);
            },
            child: Text('Get user info'),
          ),
          Text(
            message,
            style: TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }
}
