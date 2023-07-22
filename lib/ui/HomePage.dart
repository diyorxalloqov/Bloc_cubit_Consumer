import 'package:bloc_consumer_app/cubit/Comments_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showMessage = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommentsCubit, CommentsState>(
        listener: (context, state) {
          if (state is CommentsReciveMessage) {
            setState(() {
              showMessage = true;
            });
            print("salom");
          }
        },
        builder: (context, state) => Scaffold(
              appBar: AppBar(
                title: const Text("Bloc/cubit/Consumer"),
              ),
              body: Builder(builder: (context) {
                if (state is CommentsLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (state is CommentsErrorState) {
                  return Center(
                    child: Text(state.error),
                  );
                } else if (state is CommentsCompleteState) {
                  print("complete");
                  return ListView.builder(
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              leading: const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "https://picsum.photos/200/300")),
                              title: Text(state.model[index].email.toString()),
                            ),
                            const Divider(thickness: 1, height: 5),
                          ],
                        );
                      },
                      itemCount: state.model.length);
                } else if (state is CommentsReciveMessage) {
                  return ListView.builder(
                      itemBuilder: (context, index) {
                        print("message");
                        return Column(
                          children: [
                            ListTile(
                              leading: const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "https://picsum.photos/200/300")),
                              title: Text(state.model[index].email.toString()),
                              trailing: showMessage
                                  ? const CircleAvatar(radius: 3)
                                  : const SizedBox.shrink(),
                            ),
                            const Divider(thickness: 1, height: 5),
                          ],
                        );
                      },
                      itemCount: state.model.length);
                } else {
                  return const SizedBox.shrink();
                }
              }),
            ));
  }
}
