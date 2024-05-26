import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/images.dart';
import '../../../core/utils/my_theme.dart';
import '../../viewmodels/vehicle_view_model.dart';

class VehiclePage extends StatefulWidget {
  const VehiclePage({super.key});

  @override
  State<VehiclePage> createState() => _VehiclePageState();
}

class _VehiclePageState extends State<VehiclePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = Provider.of<VehicleViewModel>(context, listen: false);
      viewModel.fetchVehicles();
    });

    _scrollController.addListener(() {
      final viewModel = Provider.of<VehicleViewModel>(context, listen: false);

      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        viewModel.loadMoreVehicles();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<VehicleViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: ThemeColors.iconThemeData,
        title: const Text(
          'Vehicles',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: AppColors.gradient,
          ),
        ),
        child: viewModel.isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(8.0),
                itemCount: viewModel.vehicles.length,
                itemBuilder: (context, index) {
                  final vehicle = viewModel.vehicles[index];
                  return Card(
                    child: Column(
                      children: [
                        Image.network(
                          vehicle.imageUrl,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              AppImages.placeholder,
                              fit: BoxFit.fill,
                            );
                          },
                          fit: BoxFit.cover,
                        ),
                        ListTile(
                          title: Text(vehicle.name),
                          subtitle: Text(
                            'Model: ${vehicle.model}\n'
                            'Manufacturer: ${vehicle.manufacturer}\n'
                            'Cost: ${vehicle.costInCredits}\n'
                            'Length: ${vehicle.length}\n'
                            'Speed: ${vehicle.maxAtmospheringSpeed}\n'
                            'Crew: ${vehicle.crew}\n'
                            'Passengers: ${vehicle.passengers}\n'
                            'Cargo Capacity: ${vehicle.cargoCapacity}\n'
                            'Consumables: ${vehicle.consumables}\n'
                            'Class: ${vehicle.vehicleClass}',
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
