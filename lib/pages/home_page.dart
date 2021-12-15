import 'package:flutter/material.dart';
import 'package:future_jobs_clone/models/category_model.dart';
import 'package:future_jobs_clone/models/job_model.dart';
import 'package:future_jobs_clone/providers/category_provider.dart';
import 'package:future_jobs_clone/providers/job_provider.dart';
import 'package:future_jobs_clone/providers/user_provider.dart';
import 'package:future_jobs_clone/theme.dart';
import 'package:future_jobs_clone/widgets/category_card.dart';
import 'package:future_jobs_clone/widgets/job_tile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    var categoryProvider = Provider.of<CategoryProvider>(context);
    var jobProvider = Provider.of<JobProvider>(context);

    Widget header() {
      return Container(
        margin: const EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Howdy,",
                  style: greyTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  userProvider.user.name,
                  style: blackTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: semiBold,
                  ),
                ),
              ],
            ),
            Container(
              width: 58,
              height: 58,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: primaryColor,
                ),
              ),
              child: Image.asset(
                'assets/image_profile.png',
              ),
            ),
          ],
        ),
      );
    }

    Widget hotCategories() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: Text(
              "Hot categories",
              style: blackTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 200,
            child: FutureBuilder<List<CategoryModel>>(
              future: categoryProvider.getCategories(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  var index = -1;
                  var lastItem = snapshot.data!.indexOf(snapshot.data!.last);
                  return ListView(
                    scrollDirection: Axis.horizontal,
                    children: snapshot.data!.map((category) {
                      index++;
                      return Container(
                        margin: EdgeInsets.only(
                          right: index == lastItem ? defaultMargin : 0,
                        ),
                        child: CategoryCard(
                          category: category,
                        ),
                      );
                    }).toList(),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          )
        ],
      );
    }

    Widget justPosted() {
      return Container(
        padding: const EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Just posted",
              style: blackTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            FutureBuilder<List<JobModel>>(
              future: jobProvider.getJobs(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    children: snapshot.data!
                        .map((job) => JobTile(
                              job: job,
                            ))
                        .toList(),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          header(),
          hotCategories(),
          justPosted(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icon_home.png',
              width: 24,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icon_notification.png',
              width: 24,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icon_love.png',
              width: 24,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icon_user.png',
              width: 24,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
