
import 'package:buttons/buttons.dart';
import 'package:flutter/material.dart';

void main() => runApp(const GroupedButtonExample());

class GroupedButtonExample extends StatelessWidget {
  const GroupedButtonExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grouped Buttons Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late final List<String> _checked = ["A", "B"];
  String _picked = "Two";

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grouped Buttons Example"),
      ),
      body: _body(),
    );
    //
  }

  Widget _body(){
    return ListView(
      children: <Widget>[

        //--------------------
        //SIMPLE USAGE EXAMPLE
        //--------------------

        //BASIC CHECKBOXGROUP
        Container(
          padding: const EdgeInsets.only(left: 14.0, top: 14.0),
          child: const Text("Basic CheckboxGroup",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0
            ),
          ),
        ),

        CheckboxGroup(
          labels: const <String>[
            "Sunday",
            "Monday",
            "Tuesday",
            "Wednesday",
            "Thursday",
            "Friday",
            "Saturday",
          ],
          disabled: const [
            "Wednesday",
            "Friday"
          ],
          // ignore: avoid_print
          onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
          // ignore: avoid_print
          onSelected: (List<String> checked) => print("checked: ${checked.toString()}"),
        ),



        //BASIC RADIOBUTTONGROUP
        Container(
          padding: const EdgeInsets.only(left: 14.0, top: 14.0),
          child: const Text("Basic RadioButtonGroup",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0
            ),
          ),
        ),

        RadioButtonGroup(
          labels: const [
            "Option 1",
            "Option 2",
          ],
          disabled: const [
            "Option 1"
          ],
          // ignore: avoid_print
          onChange: (String label, int index) => print("label: $label index: $index"),
          // ignore: avoid_print
          onSelected: (String label) => print(label),
        ),




        //--------------------
        //CUSTOM USAGE EXAMPLE
        //--------------------

        ///CUSTOM CHECKBOX GROUP
        Container(
          padding: const EdgeInsets.only(left: 14.0, top: 14.0, bottom: 14.0),
          child: const Text("Custom CheckboxGroup",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0
            ),
          ),
        ),

        CheckboxGroup(
          orientation: GroupedButtonsOrientation.HORIZONTAL,
          margin: const EdgeInsets.only(left: 12.0),
          // onSelected: (List selected) => setState((){
          //   _checked = selected.;
          // }),
          labels: const <String>[
            "A",
            "B",
          ],
          checked: _checked,
          itemBuilder: (Checkbox cb, Text txt, int i){
            return Column(
              children: <Widget>[
                const Icon(Icons.polymer),
                cb,
                txt,
              ],
            );
          },
        ),



        ///CUSTOM RADIOBUTTON GROUP
        Container(
          padding: const EdgeInsets.only(left: 14.0, top: 14.0, bottom: 14.0),
          child: const Text("Custom RadioButtonGroup",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0
            ),
          ),
        ),

        RadioButtonGroup(
          orientation: GroupedButtonsOrientation.HORIZONTAL,
          margin: const EdgeInsets.only(left: 12.0),
          onSelected: (String selected) => setState((){
            _picked = selected;
          }),
          labels: const <String>[
            "One",
            "Two",
          ],
          picked: _picked,
          itemBuilder: (Radio rb, Text txt, int i){
            return Column(
              children: <Widget>[
                const Icon(Icons.public),
                rb,
                txt,
              ],
            );
          },
        ),

      ]
    );
  }

}
