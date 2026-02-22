import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quickr_user_flutter_app/application/core/theme/colors.dart';
import 'package:quickr_user_flutter_app/application/core/theme/diamentions.dart';
import 'package:quickr_user_flutter_app/application/core/theme/text_styles.dart';
import 'package:quickr_user_flutter_app/application/core/utils/extentions.dart';

import 'package:quickr_user_flutter_app/domain/home/models/services_response.dart';

class ServiceCategoryListWidget extends StatefulWidget {
  final List<ServiceCategory> subcategories;

  const ServiceCategoryListWidget({super.key, required this.subcategories});

  @override
  State<ServiceCategoryListWidget> createState() =>
      _ServiceCategoryListWidgetState();
}

class _ServiceCategoryListWidgetState extends State<ServiceCategoryListWidget> {
  final Set<int> expandedIndices = {};

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.subcategories.length,
      itemBuilder: (context, index) {
        final sub = widget.subcategories[index];
        final isExpanded = expandedIndices.contains(index);
        const mediaBaseUrl = 'https://fixifybackend.pythonanywhere.com/media/';

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: isExpanded
                ? ColorResources.scaffoldBackground2.withOpacity(0.5)
                : ColorResources.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: isExpanded
                ? null
                : [
                    BoxShadow(
                      color: ColorResources.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
            border: Border.all(
              color: ColorResources.scaffoldBackground2.withOpacity(0.3),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    // subcategory image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        imageUrl: '$mediaBaseUrl${sub.subCategoryImage}',
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) => Container(
                          width: 60,
                          height: 60,
                          color: ColorResources.secondaryColor,
                          child: const Icon(
                            Icons.image,
                            color: ColorResources.grey,
                          ),
                        ),
                      ),
                    ),
                    gap16,
                    // subcategory name
                    Expanded(
                      child: Text(
                        sub.subCategoryName ?? 'Unknown name',
                        style: context.textStyle1.w300.s14,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (expandedIndices.contains(index)) {
                            expandedIndices.remove(index);
                          } else {
                            expandedIndices.add(index);
                          }
                        });
                      },
                      icon: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: isExpanded
                              ? ColorResources.red.withOpacity(0.1)
                              : ColorResources.primary.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          isExpanded ? Icons.close : Icons.add,
                          color: isExpanded
                              ? ColorResources.red
                              : ColorResources.primary,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (isExpanded)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select the service you are looking for?',
                        style: context.textStyle1.w300.s12,
                      ),
                      gap16,
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: 0.9,
                            ),
                        itemCount: sub.services?.length ?? 0,
                        itemBuilder: (context, serviceIndex) {
                          final service = sub.services![serviceIndex];
                          final int quantity = service.quantity;
                          // final imageUrl = service.image;

                          return Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: ColorResources.scaffoldBackground2,
                              borderRadius: BorderRadius.circular(15),
                              // image: imageUrl != null
                              //     ? DecorationImage(
                              //         image: CachedNetworkImageProvider(
                              //           '$mediaBaseUrl$imageUrl',
                              //         ),
                              //         fit: BoxFit.cover,
                              //       )
                              //     : null,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    if (quantity == 0)
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            service.quantity = 1;
                                          });
                                        },
                                        child: Container(
                                          width: 28,
                                          height: 28,
                                          decoration: BoxDecoration(
                                            color: ColorResources.white,
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.add,
                                            color: ColorResources.primary,
                                            size: 20,
                                          ),
                                        ),
                                      )
                                    else
                                      Container(
                                        decoration: BoxDecoration(
                                          color: ColorResources.white
                                              .withOpacity(0.5),
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 4,
                                          vertical: 4,
                                        ),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  if (service.quantity > 0) {
                                                    service.quantity--;
                                                  }
                                                });
                                              },
                                              child: Container(
                                                width: 24,
                                                height: 24,
                                                decoration: BoxDecoration(
                                                  color: ColorResources.primary,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: const Icon(
                                                  Icons.remove,
                                                  color: ColorResources.white,
                                                  size: 16,
                                                ),
                                              ),
                                            ),
                                            gap8,
                                            Text(
                                              '$quantity',
                                              style:
                                                  context.textStyle1.w500.s14,
                                            ),
                                            gap8,
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  service.quantity++;
                                                });
                                              },
                                              child: Container(
                                                width: 24,
                                                height: 24,
                                                decoration: BoxDecoration(
                                                  color: ColorResources.primary,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: const Icon(
                                                  Icons.add,
                                                  color: ColorResources.white,
                                                  size: 16,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                                const Spacer(),
                                Text(
                                  service.name ?? '',
                                  style: context.textStyle1.w300.s12.copyWith(
                                    height: 1.3,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
