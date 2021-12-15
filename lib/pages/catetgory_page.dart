import 'package:flutter/material.dart';
import 'package:future_jobs_clone/models/category_model.dart';
import 'package:future_jobs_clone/models/job_model.dart';
import 'package:future_jobs_clone/providers/job_provider.dart';
import 'package:future_jobs_clone/theme.dart';
import 'package:future_jobs_clone/widgets/job_tile.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  final CategoryModel category;

  const CategoryPage({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var jobProvider = Provider.of<JobProvider>(context);

    Widget header() {
      return Container(
        height: 270,
        width: double.infinity,
        padding: const EdgeInsets.only(
          left: defaultMargin,
          bottom: 30,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              category.imageUrl,
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category.name,
              style: whiteTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              "10 available",
              style: whiteTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
    }

    Widget companies() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(
          top: 30,
          right: defaultMargin,
          left: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Big Companies",
              style: blackTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            FutureBuilder<List<JobModel>>(
              future: jobProvider.getJobsByCategory(category.name),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    children:
                        snapshot.data!.map((job) => JobTile(job: job)).toList(),
                  );
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            )
          ],
        ),
      );
    }

    Widget newStartups() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(
          top: 16,
          right: defaultMargin,
          left: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New Startups",
              style: blackTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            FutureBuilder<List<JobModel>>(
              future: jobProvider.getJobs(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    children:
                        snapshot.data!.map((job) => JobTile(job: job)).toList(),
                  );
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(),
            companies(),
            newStartups(),
          ],
        ),
      ),
    );
  }
}
