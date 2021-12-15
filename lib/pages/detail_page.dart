import 'package:flutter/material.dart';
import 'package:future_jobs_clone/models/job_model.dart';
import 'package:future_jobs_clone/theme.dart';

class DetailPage extends StatefulWidget {
  final JobModel job;
  const DetailPage({Key? key, required this.job}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isApplied = false;

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: const EdgeInsets.only(
          top: 80,
        ),
        child: Column(
          children: [
            isApplied
                ? Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 30),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(48),
                      color: const Color(0xffECEDF1),
                    ),
                    child: Text(
                      "You have applied this job and the\nrecruiter will contact you",
                      style: greyTextStyle.copyWith(),
                      textAlign: TextAlign.center,
                    ),
                  )
                : Container(),
            Image.network(
              widget.job.companyLogo,
              width: 60,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              widget.job.name,
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              "${widget.job.companyName} • ${widget.job.location}",
              style: greyTextStyle.copyWith(),
            )
          ],
        ),
      );
    }

    Widget detailItem(String text) {
      return Container(
        margin: const EdgeInsets.only(
          top: 16,
        ),
        child: Row(
          children: [
            Icon(
              Icons.adjust,
              color: primaryColor,
              size: 12,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Text(
                text,
                style: blackTextStyle.copyWith(
                  fontWeight: light,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget aboutJob() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About the job",
              style: blackTextStyle.copyWith(
                fontWeight: bold,
              ),
            ),
            Column(
              children: widget.job.about.map((e) => detailItem(e)).toList(),
            )
          ],
        ),
      );
    }

    Widget qualifications() {
      return Container(
        margin: const EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Qualifications",
              style: blackTextStyle.copyWith(
                fontWeight: bold,
              ),
            ),
            Column(
              children:
                  widget.job.qualifications.map((e) => detailItem(e)).toList(),
            )
          ],
        ),
      );
    }

    Widget applyButton() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 50,
            ),
            height: 45,
            width: 200,
            child: TextButton(
              onPressed: () {
                setState(() {
                  isApplied = true;
                });
              },
              style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(66))),
              child: Text(
                "Apply for Job",
                style: whiteTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
            ),
          )
        ],
      );
    }

    Widget cancelButton() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 50,
            ),
            height: 45,
            width: 200,
            child: TextButton(
              onPressed: () {
                setState(() {
                  isApplied = false;
                });
              },
              style: TextButton.styleFrom(
                backgroundColor: redColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(66)),
              ),
              child: Text(
                "Cancel Apply",
                style: whiteTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget responsibilities() {
      return Container(
        margin: const EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Responsibilities",
              style: blackTextStyle.copyWith(
                fontWeight: bold,
              ),
            ),
            Column(
              children: widget.job.responsibilities
                  .map((e) => detailItem(e))
                  .toList(),
            )
          ],
        ),
      );
    }

    Widget messageButton() {
      return Container(
        margin: const EdgeInsets.only(
          top: 20,
          bottom: 35,
        ),
        child: TextButton(
          onPressed: () {},
          child: Text(
            'Message Recruiter',
            style: greyTextStyle.copyWith(
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          children: [
            header(),
            aboutJob(),
            qualifications(),
            responsibilities(),
            isApplied ? cancelButton() : applyButton(),
            messageButton()
          ],
        ),
      ),
    );
  }
}
