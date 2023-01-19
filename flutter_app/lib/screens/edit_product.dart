import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/providers/product.dart';
import 'package:flutter_app/providers/products.dart';
import 'package:provider/provider.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({Key? key}) : super(key: key);

  static const routeName = '/edit-product';

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  // final _priceFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();
  var _editedproduct = Product(
    id: "",
    title: "",
    description: "",
    price: 0,
    imageUrl: "",
  );

  @override
  void dispose() {
    super.dispose();
    _imageUrlController.dispose();
  }

  void _saveForm() {
    final bool isValid = _form.currentState!.validate();
    if (!isValid) return;
    _form.currentState!.save();
    Provider.of<Products>(context).addItem(_editedproduct);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add product"), actions: [
        IconButton(
          icon: Icon(Icons.save),
          onPressed: _saveForm,
        )
      ]),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(label: Text('Title')),
                textInputAction: TextInputAction.next,
                // onFieldSubmitted: (_) {
                // FocusScope.of(context).requestFocus(_priceFocusNode);
                // },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a valid  title!';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _editedproduct = Product(
                    title: newValue.toString(),
                    price: _editedproduct.price,
                    description: _editedproduct.description,
                    imageUrl: _editedproduct.imageUrl,
                    id: _editedproduct.id,
                  );
                },
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) return 'Please enter a number!';
                  if (double.tryParse(value) == null)
                    return 'Enter valid number';
                  if (double.parse(value) <= 0)
                    return 'Enter number greater than 0';
                },
                decoration: const InputDecoration(label: Text('Price')),
                textInputAction: TextInputAction.next,
                // focusNode: _priceFocusNode,
                keyboardType: TextInputType.number,
                onSaved: (newValue) {
                  _editedproduct = Product(
                    title: _editedproduct.title,
                    price: double.parse(newValue.toString()),
                    description: _editedproduct.description,
                    imageUrl: _editedproduct.imageUrl,
                    id: _editedproduct.id,
                  );
                },
              ),
              TextFormField(
                decoration: const InputDecoration(label: Text('Description')),
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                onSaved: (newValue) {
                  _editedproduct = Product(
                    title: _editedproduct.title,
                    price: _editedproduct.price,
                    description: newValue.toString(),
                    imageUrl: _editedproduct.imageUrl,
                    id: _editedproduct.id,
                  );
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                    ),
                    child: _imageUrlController.text.isEmpty
                        ? const Text('Enter a URL')
                        : FittedBox(
                            fit: BoxFit.cover,
                            child: Image.network(_imageUrlController.text),
                          ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Image URL'),
                      ),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      controller: _imageUrlController,
                      onFieldSubmitted: (_) {
                        _saveForm();
                      },
                      onEditingComplete: () {
                        setState(() {});
                      },
                      onSaved: (newValue) {
                        _editedproduct = Product(
                          title: _editedproduct.title,
                          price: _editedproduct.price,
                          description: _editedproduct.description,
                          imageUrl: newValue.toString(),
                          id: _editedproduct.id,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
