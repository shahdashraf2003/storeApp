// ignore_for_file: use_build_context_synchronously, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/helper/show_snack_bar.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/pages/home.dart';
import 'package:store_app/services/update_product_service.dart';
import 'package:store_app/widgets/button.dart';
import 'package:store_app/widgets/textfiled.dart';

class UpdateProduct extends StatefulWidget {
  static String id = 'UpdateProduct';

  const UpdateProduct({super.key});

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  String? title;

  String? price;

  String? description;

  String? image;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductsModel product =
        ModalRoute.of(context)!.settings.arguments as ProductsModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            'Update Product',
            style: TextStyle(
              color: Colors.black,
              fontSize: 23,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomTextField(
                    hintText: 'Product Name',
                    onChanged: (value) {
                      title = value;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    hintText: 'image',
                    onChanged: (value) {
                      image = value;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    hintText: 'Price',
                    inputType: TextInputType.number,
                    onChanged: (value) {
                      price = value;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    hintText: 'Description',
                    onChanged: (value) {
                      description = value;
                    },
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Button(
                    buttonText: 'Update',
                    onPressed: () async {
                      isLoading = true;
                      setState(() {});

                      try {
                        await updateProduct(product);
                  
                        Navigator.pushNamed(context, HomePage.id);
                      } catch (e) {
                        // ignore: use_build_context_synchronously
                        showSnackBar(context, e.toString());
                      }
                      isLoading = false;
                      setState(() {});
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductsModel product) async {
    await UpdateProductService().updateProduct(
      id: product.id,
      title: title == null ? product.title : title!,
      price: price == null ? product.price.toString() : price!,
      description: description == null ? product.description : description!,
      category: product.category,
      image: image == null ? product.image : image!,
    );
  }
}
