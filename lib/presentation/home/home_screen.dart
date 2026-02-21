import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickr_user_flutter_app/application/core/route/app_route.dart';
import 'package:quickr_user_flutter_app/application/core/theme/colors.dart';
import 'package:quickr_user_flutter_app/application/core/theme/diamentions.dart';
import 'package:quickr_user_flutter_app/application/core/theme/text_styles.dart';
import 'package:quickr_user_flutter_app/application/core/utils/app_assets.dart';
import 'package:quickr_user_flutter_app/application/core/utils/extentions.dart';
import 'package:quickr_user_flutter_app/application/home/home_bloc.dart';
import 'package:quickr_user_flutter_app/domain/home/models/home_response.dart';
import 'package:quickr_user_flutter_app/presentation/services/service_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(const HomeEvent.getHomeData());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final categories = state.homeResponse?.services?.categories ?? [];
        final topServices = state.homeResponse?.topServices ?? [];

        return Scaffold(
          appBar: AppBar(
            backgroundColor: ColorResources.white,
            elevation: 0,
            scrolledUnderElevation: 0,
            surfaceTintColor: ColorResources.transparent,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Image.asset(AppAssets.logo, height: 30, width: 30),
                  onPressed: () {},
                ),
                const Spacer(),
                Row(
                  children: [
                    Text('Kochi', style: context.textStyle1.w300.s16),
                    gap4,
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: ColorResources.black,
                      size: 30,
                    ),
                  ],
                ),
              ],
            ),
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              context.read<HomeBloc>().add(const HomeEvent.getHomeData());
            },
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.all(16.0),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      // Service Categories Grid
                      _buildServiceCards(context, categories),
                      gap24,
                      // Top Services Section
                      if (topServices.isNotEmpty) ...[
                        Text(
                          'Top services',
                          style: context.textStyle1.bold.s20,
                        ),
                        gap16,
                        // Top Services Cards
                        SizedBox(
                          height: 230,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: topServices.length,
                            separatorBuilder: (context, index) => gap12,
                            itemBuilder: (context, index) {
                              final service = topServices[index];
                              const mediaBaseUrl =
                                  'https://fixifybackend.pythonanywhere.com';
                              return Container(
                                width:
                                    (MediaQuery.of(context).size.width - 44) /
                                    2,
                                decoration: BoxDecoration(
                                  color: ColorResources.secondary,
                                  borderRadius: BorderRadius.circular(25),
                                  image: service.image != null
                                      ? DecorationImage(
                                          image: CachedNetworkImageProvider(
                                            '$mediaBaseUrl${service.image!}',
                                          ),
                                          fit: BoxFit.cover,
                                        )
                                      : null,
                                ),
                              );
                            },
                          ),
                        ),
                        gap24,
                      ],

                      // Promotional Text
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            height: 1.3,
                            letterSpacing: 0.5,
                          ),
                          children: [
                            TextSpan(
                              text: 'Hire ',
                              style: context.heading.w400.s24,
                            ),
                            TextSpan(
                              text: 'professionals',
                              style: context.heading.w400.s24.copyWith(
                                color: const Color(0XFF69AE95),
                              ),
                            ),
                            TextSpan(
                              text: ' in a\nclick...',
                              style: context.heading.w400.s24,
                            ),
                          ],
                        ),
                      ),
                      gap4,
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            height: 1.3,
                            letterSpacing: 0.5,
                          ),
                          children: [
                            TextSpan(
                              text: 'Get ',
                              style: context.heading.w400.s24,
                            ),
                            TextSpan(
                              text: 'services',
                              style: context.heading.w400.s24.copyWith(
                                color: const Color(0XFF69AE95),
                              ),
                            ),
                            TextSpan(
                              text: ' at your\ndoorstep...',
                              style: context.heading.w400.s24,
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildServiceCards(BuildContext context, List<Category> categories) {
    // If we have categories from API, limit them to 5
    final hasMore = categories.length >= 6;
    final displayCategories = categories.take(5).toList();
    const mediaBaseUrl = 'https://fixifybackend.pythonanywhere.com/media/';

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.9,
      ),
      itemCount: hasMore ? 6 : displayCategories.length,
      itemBuilder: (context, index) {
        if (hasMore && index == 5) {
          // Professional "More Services" card
          return GestureDetector(
            onTap: () {
              AppRoute.pushNamed(ServiceDetailsScreen.routeName);
            },
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF69AE95), Color(0xFF4A8A73)],
                ),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF69AE95).withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.grid_view_rounded,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  gap8,
                  Text(
                    'More\nServices',
                    textAlign: TextAlign.center,
                    style: context.textStyle1.w600.s14.white.copyWith(
                      height: 1.1,
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        final category = displayCategories[index];
        final title = category.name ?? '';
        final imageUrl = category.image;

        return GestureDetector(
          onTap: () {
            // Handle specific category tap if needed, or navigate to details
            AppRoute.pushNamed(ServiceDetailsScreen.routeName);
          },
          child: Container(
            decoration: BoxDecoration(
              color: imageUrl == null ? ColorResources.secondary : null,
              borderRadius: BorderRadius.circular(25),
              image: imageUrl != null
                  ? DecorationImage(
                      image: CachedNetworkImageProvider(
                        '$mediaBaseUrl$imageUrl',
                      ),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: Column(
              children: [
                const Spacer(),
                // Shadow container for title
                imageUrl != null
                    ? Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(
                          color: ColorResources.black.withOpacity(0.35),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                        ),
                        child: Text(
                          title,
                          style: context.textStyle1.w300.s14.white,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    : Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            title,
                            style: context.textStyle1.w300.s14.white,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
