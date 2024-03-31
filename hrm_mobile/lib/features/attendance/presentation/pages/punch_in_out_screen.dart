import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hrm_mobile/core/models/global_form.dart';
import 'package:hrm_mobile/features/attendance/presentation/widget/display_picture_screen.dart';
import 'package:hrm_mobile/features/attendance/presentation/provider/attendance_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

class PunchInOutScreen extends StatefulWidget {
  final String userId;
  const PunchInOutScreen(this.userId, {super.key});

  @override
  State<PunchInOutScreen> createState() => _PunchInOutScreenState();
}

class _PunchInOutScreenState extends State<PunchInOutScreen> {
  late FormGroup _form;
  late List<CameraDescription> cameras;
  late CameraDescription firstCamera;
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;
  late DateTime today = DateTime.now();
  @override
  void initState() {
    initData();
    _form = employeeFilterForm;
    super.initState();
  }

  initData() async {
    final attendanceProvider = Provider.of<AttendanceProvider>(context, listen: false);
    await attendanceProvider.getCurrentAttendance(widget.userId);
  }

  Future<void> initCamera() async {
    try {
      cameras = await availableCameras();
      firstCamera = cameras.first;
      _cameraController = CameraController(firstCamera, ResolutionPreset.max, enableAudio: false);
      _initializeControllerFuture = _cameraController.initialize();
      await _cameraController.lockCaptureOrientation(DeviceOrientation.landscapeLeft);
    } on CameraException {
      // print(e.description);
    }
  }

  @override
  Widget build(BuildContext context) {
    final attendanceProvider = Provider.of<AttendanceProvider>(context, listen: true);
    return attendanceProvider.isLoading
        ? const LinearProgressIndicator()
        : SingleChildScrollView(
            child: ReactiveForm(
                formGroup: _form,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      Container(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )),
                      // Body
                      Text(
                        DateFormat.yMMMMd().format(today),
                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text('Punch in records: ${attendanceProvider.punchInRecords.isEmpty ? "Haven't punch in yet" :  attendanceProvider.punchInRecords.map((date) => DateFormat.Hm().format(date)).toList().join(', ')}', overflow: TextOverflow.ellipsis),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('Punch out records: ${attendanceProvider.punchoutRecords.isEmpty ? "Haven't punch out yet" : attendanceProvider.punchoutRecords.map((date) => DateFormat.Hm().format(date)).toList().join(', ')}', overflow: TextOverflow.ellipsis),
                      const SizedBox(
                        height: 15,
                      ),
                      FilledButton(
                        onPressed: () async {
                          try {
                            await _initializeControllerFuture;
                            final image = await _cameraController.takePicture();
                            if (!context.mounted) return;
                            await Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => DisplayPictureScreen(
                                  imagePath: image.path,
                                ),
                              ),
                            );
                          } catch (e) {
                            // ignore: avoid_print
                            print(e);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(40),
                        ),
                        child: const Text('Punch in', style: TextStyle(fontSize: 14)),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      FutureBuilder(
                          future: initCamera(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.done) {
                              return FutureBuilder<void>(
                                future: _initializeControllerFuture,
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState == ConnectionState.done) {
                                    return CameraPreview(_cameraController);
                                  } else {
                                    return const Center(child: LinearProgressIndicator());
                                  }
                                },
                              );
                            } else {
                              return const Center(child: LinearProgressIndicator());
                            }
                          })
                    ],
                  ),
                )),
          );
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }
}
