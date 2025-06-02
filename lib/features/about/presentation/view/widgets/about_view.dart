import 'dart:convert';
import 'dart:io';

import 'package:deplfolio/core/utils/const_strings.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_utils.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../../data/models/about.dart';
import '../../../data/models/introduction_section.dart';
import 'approaches_accordion.dart';
import 'introduction_section_card.dart';
import 'projects_section_card.dart';
import 'section_title.dart';
import 'work_experience_item.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key, required this.about});

  final About about;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppUtils.screenPadding,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: IntroductionSectionCard(
              introductionSection: IntroductionSection(
                headerSmallText: about.headerSmallText,
                description: about.description,
                seeMyWorkLink: about.seeMyWorkLink,
                headerBigText: about.headerBigText,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 16.h),
              child: ProjectsSectionCard(projects: about.projects),
            ),
          ),
          const SliverToBoxAdapter(
            child: Center(
              child: SectionTitle(title: AppStrings.workExperience),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            sliver: SliverList.separated(
              itemCount: about.workExperience.length,
              itemBuilder:
                  (_, index) => WorkExperienceItem(
                    workExperience: about.workExperience[index],
                  ),
              separatorBuilder: (_, __) => SizedBox(height: 16.h),
            ),
          ),
          const SliverToBoxAdapter(
            child: Center(child: SectionTitle(title: AppStrings.approaches)),
          ),
          SliverToBoxAdapter(
            child: ApproachesAccordion(approaches: about.approaches),
          ),
          SliverToBoxAdapter(
            child: PrimaryButton(
              text: 'Upload CV PDF',
              onPressed: () async => await uploadPdfToGitHub(),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> uploadPdfToGitHub() async {
    const repoOwner = 'ahmedghaly15';
    const repoName = ConstStrings.appTitle;
    const path = 'assets/cv/Ahmed Ghaly - Flutter Dev.pdf';

    final picked = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (picked == null) return;

    final filePath = picked.files.single.path!;
    final fileBytes = File(filePath).readAsBytesSync();
    final encodedContent = base64Encode(fileBytes);

    final url = Uri.parse(
      'https://api.github.com/repos/$repoOwner/$repoName/contents/${Uri.encodeComponent(path)}',
    );

    // Step 1: Check if the file exists to get the SHA
    String? sha;
    final getResponse = await http.get(
      url,
      headers: {
        'Authorization': 'token $token',
        'Accept': 'application/vnd.github+json',
      },
    );

    if (getResponse.statusCode == 200) {
      final decoded = jsonDecode(getResponse.body);
      sha = decoded['sha'];
      print('📎 Existing SHA: $sha');
    } else {
      print('ℹ️ File not found. It will be created.');
    }

    // Step 2: Upload or update the file
    final putResponse = await http.put(
      url,
      headers: {
        'Authorization': 'token $token',
        'Accept': 'application/vnd.github+json',
      },
      body: jsonEncode({
        'message': 'Upload PDF via Flutter app',
        'content': encodedContent,
        if (sha != null) 'sha': sha,
        'branch': 'master', // replace with your branch if different
      }),
    );

    if (putResponse.statusCode == 201 || putResponse.statusCode == 200) {
      print('✅ File uploaded/updated successfully');
      print('📄 Response: ${putResponse.body}');
    } else {
      print('❌ Upload failed: ${putResponse.body}');
    }
  }
}
