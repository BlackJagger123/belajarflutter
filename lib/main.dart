import 'package:flutter/material.dart';
import 'package:belajar1/basic_widgets/fab_widget.dart';
import 'package:belajar1/basic_widgets/test_widget.dart';
import 'package:belajar1/basic_widgets/textfield_widget.dart';
import 'package:belajar1/basic_widgets/image_widget.dart';
import 'package:belajar1/basic_widgets/loading_cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Tes Belajar Flutter 1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Variable/State untuk mengambil tanggal
  DateTime selectedDate = DateTime.now();

  //  Initial SelectDate FLutter
  Future<void> _selectDate(BuildContext context) async {
    // Initial DateTime FIinal Picked
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const MyTextWidget(),
              const MyImageWidget(),
              Text("${selectedDate.toLocal()}".split(' ')[0]),
              const SizedBox(
                height: 20.0,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoadingCupertino()),
                  );
                },
                child: const Text('Tampilkan LoadingCupertino'),
              ),
              ElevatedButton(
                onPressed: () => {
                  _selectDate(context),
                  // ignore: avoid_print
                  print(selectedDate.day + selectedDate.month + selectedDate.year)
                },
                child: const Text('Pilih Tanggal'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyTextField()),
                  );
                },
                child: const Text('Buka TextField'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyFloatingActionButton()),
                  );
                },
                child: const Text('Buka FAB'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
