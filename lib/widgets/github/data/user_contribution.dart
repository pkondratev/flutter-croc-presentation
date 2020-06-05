import 'package:flutter_presentation_croc/widgets/github/data/contribution_data.dart';
import 'package:flutter_presentation_croc/widgets/github/data/user.dart';

class UserContribution {
  User user;
  List<ContributionData> contributions;

  UserContribution(this.user, this.contributions);

  static UserContribution fromJson(Map<String, dynamic> jsonMap) {
    List<ContributionData> contributionList = (jsonMap["weeks"] as List)
        .map((e) => ContributionData.fromJson(e))
        .toList();
    var userContribution =
        UserContribution(User.fromJson(jsonMap["author"]), contributionList);
    return userContribution;
  }
}
