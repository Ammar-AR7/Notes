import 'package:final_project/app/modules/Trash/binding/trash_binding.dart';
import 'package:final_project/app/modules/home/views/home_screen.dart';
import 'package:final_project/app/modules/note/views/note_screen.dart';
import 'package:final_project/app/routes/app_routes.dart';
import 'package:get/get.dart';
import '../modules/Trash/views/trash_screen.dart';
import '../modules/home/binding/home_binding.dart';
import '../modules/note/binding/note_binding.dart';

abstract class AppPages {
  static const init = AppRoutes.Home;

  static final routes =[
    GetPage(
      name: AppRoutes.Home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.Note,
      page: () => NoteScreen(),
      binding: NoteBinding(),
    ),
    GetPage(
      name: AppRoutes.Trash,
      page: () => TrashScreen(),
      binding: TrashBinding(),
    ),
  ];
}