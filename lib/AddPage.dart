import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  String foodName;
  int kcalFor100grams;
  int foodWeight;
  int count;

  void submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add food'),
      ),
      body: Form(
        key: this._formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 100),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    validator: (value) {
                      if (value.isEmpty)
                        return 'Food name is empty';
                      else if (value.length > 200)
                        return 'Food name is too long';
                      else
                        return null;
                    },
                    onSaved: (String value) {
                      this.foodName = value;
                    },
                    decoration: InputDecoration(
                      icon: Icon(Icons.fastfood),
                      labelText: 'Food name',
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          autofocus: false,
                          validator: (value) {
                            if (value.isEmpty)
                              return 'Kcal is empty';
                            else if (int.tryParse(value) == null)
                              return 'Kcal must be number';
                            else
                              return null;
                          },
                          onSaved: (String value) {
                            this.kcalFor100grams = int.parse(value);
                          },
                          decoration: InputDecoration(
                            labelText: 'kcal per 100 grams',
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          autofocus: false,
                          validator: (value) {
                            if (value.isEmpty)
                              return 'Weight is empty';
                            else if (int.tryParse(value) == null)
                              return 'Weight must be number';
                            else
                              return null;
                          },
                          onSaved: (String value) {
                            this.foodWeight = int.parse(value);
                          },
                          decoration: InputDecoration(
                            labelText: 'Weight',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    autofocus: false,
                    validator: (value) {
                      if (value.isEmpty)
                        return 'Food count is empty';
                      else if (int.tryParse(value) == null)
                        return 'Food count must be number';
                      else
                        return null;
                    },
                    onSaved: (String value) {
                      this.count = int.parse(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Food count',
                    ),
                  ),
                ),
                SizedBox(height: 56.0),
                RaisedButton(
                  color: Theme.of(context).primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.0,
                    ),
                  ),
                  onPressed: () async {
                    this.submit();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
