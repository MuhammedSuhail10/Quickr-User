import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickr_user_flutter_app/application/core/route/app_route.dart';
import 'package:quickr_user_flutter_app/application/core/theme/colors.dart';
import 'package:quickr_user_flutter_app/application/core/theme/diamentions.dart';
import 'package:quickr_user_flutter_app/application/core/theme/text_styles.dart';
import 'package:quickr_user_flutter_app/application/core/utils/app_assets.dart';
import 'package:quickr_user_flutter_app/application/core/utils/enums.dart';
import 'package:quickr_user_flutter_app/application/core/utils/extentions.dart';
import 'package:quickr_user_flutter_app/application/home/home_bloc.dart';
import 'package:quickr_user_flutter_app/domain/home/models/all_categories_response.dart';
import 'package:quickr_user_flutter_app/presentation/services/service_selection_screen.dart';
import 'package:quickr_user_flutter_app/presentation/widgets/common_button.dart';

class ServiceMainScreen extends StatefulWidget {
  const ServiceMainScreen({super.key});

  @override
  State<ServiceMainScreen> createState() => _ServiceMainScreenState();
}

class _ServiceMainScreenState extends State<ServiceMainScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  void _fetchCategories() {
    context.read<HomeBloc>().add(
      HomeEvent.getAllCategories(
        lastId: 0,
        searchQuery: _searchController.text,
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Services', style: context.heading.w400.s24),
            ),
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: ColorResources.secondaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    final isLoading =
                        state.getAllCategoriesStatus == ApiStatus.loading;
                    return TextField(
                      controller: _searchController,
                      onChanged: (value) {
                        _fetchCategories();
                      },
                      decoration: InputDecoration(
                        hintText: 'Search for services',
                        hintStyle: context.textStyle1.w300.s12,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            AppAssets.search,
                            height: 20,
                            width: 20,
                          ),
                        ),
                        suffixIcon: isLoading
                            ? const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                ),
                              )
                            : null,
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 16,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            gap20,
            // Service Cards Grid
            Expanded(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state.getAllCategoriesStatus == ApiStatus.loading &&
                      state.allCategoriesResponse == null) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final categories =
                      state.allCategoriesResponse?.categories ?? [];

                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        // Service Cards Grid
                        if (categories.isEmpty &&
                            state.getAllCategoriesStatus == ApiStatus.success)
                          const Padding(
                            padding: EdgeInsets.all(32.0),
                            child: Text('No services found'),
                          )
                        else
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            child: _buildServiceCard(categories),
                          ),
                        // Suggestion Section
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  gap16,
                                  Expanded(
                                    child: Text(
                                      "Couldn't find what you\nare looking for, let us\nknow...",
                                      style: context.heading.w400.s24,
                                    ),
                                  ),
                                ],
                              ),
                              gap12,
                              CommonButton(
                                text: 'Suggest',
                                textStyle: context.textStyle1.w700.s24.copyWith(
                                  color: ColorResources.primary,
                                ),
                                backgroundColor: ColorResources.secondaryColor,
                                borderWidth: 1,
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard(List<Category> categories) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        childAspectRatio: 0.85,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        const mediaBaseUrl = 'https://fixifybackend.pythonanywhere.com/media/';
        return GestureDetector(
          onTap: () {
            AppRoute.pushNamed(
              ServiceSelectionScreen.routeName,
              arguments: {
                'categoryName': category.name,
                'categoryId': category.id,
              },
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              decoration: BoxDecoration(
                color: category.image.isEmpty ? ColorResources.secondary : null,
                image: category.image.isNotEmpty
                    ? DecorationImage(
                        image: CachedNetworkImageProvider(
                          '$mediaBaseUrl${category.image}',
                        ),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: Stack(
                children: [
                  // Title at bottom
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        category.name,
                        style: context.textStyle1.w300.s14.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
