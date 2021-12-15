import 'package:flutter/material.dart';
import 'package:future_jobs_clone/models/job_model.dart';
import 'package:future_jobs_clone/pages/detail_page.dart';
import 'package:future_jobs_clone/theme.dart';

class JobTile extends StatelessWidget {
  final JobModel job;

  const JobTile({
    Key? key,
    required this.job,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              job: job,
            ),
          ),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            job.companyLogo,
            width: 44,
          ),
          const SizedBox(
            width: 24,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  job.name,
                  style:
                      blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  job.companyName,
                  style: greyTextStyle,
                ),
                const SizedBox(
                  height: 18,
                ),
                const Divider(
                  thickness: 1,
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
