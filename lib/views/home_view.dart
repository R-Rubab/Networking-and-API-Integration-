import '../utils/export_files/export.dart';

// class PostListScreen extends StatefulWidget {
//   const PostListScreen({super.key});

//   @override
//   _PostListScreenState createState() => _PostListScreenState();
// }

// class _PostListScreenState extends State<PostListScreen> {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Provider.of<PostProviderController>(context, listen: false).fetchPosts();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final style = Theme.of(context).textTheme.bodyLarge;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: EColors.pink,
//         title: Text(
//           'Networking and API Integration',
//           style: Theme.of(context).textTheme.bodyLarge!.apply(fontSizeDelta: 4),
//         ),
//         centerTitle: true,
//       ),
//       body: Consumer<PostProviderController>(
//         builder: (context, provider, child) {
//           if (provider.isLoading) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (provider.errorMessage != null) {
//             return Center(child: Text('Error: ${provider.errorMessage}'));
//           } else {
//             return ListView.builder(
//               itemCount: provider.posts.length,
//               itemBuilder: (context, index) {
//                 final data = provider.posts[index];
//                 return Card(
//                   elevation: 5,
//                   color: EColors.getRandomColor(),
//                   margin: const EdgeInsets.all(9),
//                   child: ListTile(
//                     title: Text(
//                       '${data.id}. ${data.title} 💎',
//                       style:
//                           style!.apply(fontWeightDelta: 4, color: Colors.black),
//                     ),
//                     subtitle: Text(
//                       data.body,
//                       style: style,
//                     ),
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }

class PostListScreen extends StatelessWidget {
  const PostListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyLarge;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: EColors.pink,
        title: Text(
          'Networking and API Integration',
          style: Theme.of(context).textTheme.bodyLarge!.apply(fontSizeDelta: 4),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Post>>(
        future: ApiService().fetchPosts(), // Fetch posts using the ApiService
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Display a loading indicator while waiting for the data
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Display an error message if there's an error
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
              ),
            );
          } else if (snapshot.hasData) {
            // Data fetched successfully, display the list
            final posts = snapshot.data!;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final data = posts[index];
                return Card(
                  elevation: 5,
                  color: EColors.getRandomColor(),
                  margin: const EdgeInsets.all(9),
                  child: ListTile(
                    title: Text(
                      '${data.id}. ${data.title} 💎',
                      style:
                          style!.apply(fontWeightDelta: 4, color: Colors.black),
                    ),
                    subtitle: Text(
                      data.body,
                      style: style,
                    ),
                  ),
                );
              },
            );
          } else {
            // Handle the case where no data is available
            return const Center(child: Text('No posts available.'));
          }
        },
      ),
    );
  }
}
