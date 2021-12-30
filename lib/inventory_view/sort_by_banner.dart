import 'package:flutter/material.dart';

import 'package:pantry/app/theme.dart' as theme;

class SortByBanner extends StatelessWidget {
  const SortByBanner(
      {Key? key, required this.sortCategory, required this.updateSortCategory})
      : super(key: key);

  final String sortCategory;
  final VoidCallback updateSortCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: updateSortCategory,
      child: _bannerContainer(sortCategory),
    );
  }
}

_bannerContainer(String category) {
  return Container(
    height: 56.0,
    padding: const EdgeInsets.only(left: 16.0),
    child: Align(
      alignment: Alignment.centerLeft,
      child: _bannerText(category),
    ),
  );
}

_bannerText(String category) {
  return RichText(
    text: TextSpan(
      style: theme.Typography.titleMedium(theme.Light.onBackground),
      children: [
        const TextSpan(text: 'sort by: '),
        TextSpan(
          text: category,
          style: theme.Typography.titleMedium(theme.Light.primary),
        ),
      ],
    ),
  );
}
