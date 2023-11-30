import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Button Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<ButtonInfo> buttons = [
    ButtonInfo(
      "Elevated Button",
      "A button that displays a raised appearance to indicate interactivity. It typically has a filled background and elevates when pressed.",
          () => ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          onPrimary: Colors.white,
        ),
        child: Text("Elevated Button"),
      ),
    ),
    ButtonInfo(
      "Floating Action Button",
      " A circular button, often used for primary or high-priority actions. It usually floats above the content to draw attention.",
          () => FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.orange,
        child: Icon(Icons.add),
      ),
    ),
    ButtonInfo(
      "Outlined Button",
      " A button with a transparent background and a defined border. It's used for actions that are less prominent than those emphasized by an elevated button.",
          () => OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          primary: Colors.blue,
        ),
        child: Text("Outlined Button"),
      ),
    ),
    ButtonInfo(
      "Icon Button",
      "A button that contains an icon. It's used for actions that are represented by specific icons rather than text.",
          () => IconButton(
        onPressed: () {},
        icon: Icon(Icons.star),
        color: Colors.green,
      ),
    ),
    ButtonInfo(
      "Text Button",
      "A button that appears as text, without any background or fill. It's typically used for less prominent actions or inline within text.",
          () => TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          primary: Colors.red,
        ),
        child: Text("Text Button"),
      ),
    ),
    ButtonInfo(
      "Dropdown Button",
      "A button that, when pressed, displays a dropdown menu with a list of selectable items. It allows users to choose one item from a list.",
          () => ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: Colors.purple,
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            items: ["Option 1", "Option 2", "Option 3"].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {},
          ),
        ),
      ),
    ),
    ButtonInfo(
      "PopUp Menu Button",
      " A button that, when pressed, displays a popup menu with a list of actions or options. It's often represented by three dots or an ellipsis icon and offers various choices when clicked.",
          () => ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: Colors.teal,
        ),
        child: PopupMenuButton<String>(
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem<String>(
                value: "Option 1",
                child: Text("Option 1"),
              ),
              PopupMenuItem<String>(
                value: "Option 2",
                child: Text("Option 2"),
              ),
              PopupMenuItem<String>(
                value: "Option 3",
                child: Text("Option 3"),
              ),
            ];
          },
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Button Demo'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // Set this to 4 for a 4x4 grid
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: buttons.length,
        itemBuilder: (context, index) {
          return ButtonCard(buttonInfo: buttons[index]);
        },
      ),
    );
  }
}

class ButtonCard extends StatelessWidget {
  final ButtonInfo buttonInfo;

  const ButtonCard({Key? key, required this.buttonInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          showButtonInfoDialog(context, buttonInfo);
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.touch_app),
              SizedBox(height: 8.0),
              buttonInfo.builder(),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonInfo {
  final String name;
  final String description;
  final Widget Function() builder;

  ButtonInfo(this.name, this.description, this.builder);
}

void showButtonInfoDialog(BuildContext context, ButtonInfo buttonInfo) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(buttonInfo.name),
        content: Text(buttonInfo.description),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Close'),
          ),
        ],
      );
    },
  );
}
