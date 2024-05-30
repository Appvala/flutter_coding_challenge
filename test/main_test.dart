import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_coding_challenge/main.dart';
import 'package:flutter_coding_challenge/presentation/screens/dropdown_screen.dart';

void main() {
  testWidgets('MyApp starts with DropdownScreen', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.byType(DropdownScreen), findsOneWidget);
  });
}
