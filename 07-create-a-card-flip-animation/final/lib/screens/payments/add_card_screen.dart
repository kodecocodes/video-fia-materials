// Copyright (c) 2022 Razeware LLC

// Permission is hereby granted, free of charge, to any person
// obtaining a copy of this software and associated documentation
// files (the "Software"), to deal in the Software without
// restriction, including without limitation the rights to use,
// copy, modify, merge, publish, distribute, sublicense, and/or
// sell copies of the Software, and to permit persons to whom
// the Software is furnished to do so, subject to the following
// conditions:

// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.

// Notwithstanding the foregoing, you may not use, copy, modify,
// merge, publish, distribute, sublicense, create a derivative work,
// and/or sell copies of the Software in any work that is designed,
// intended, or marketed for pedagogical or instructional purposes
// related to programming, coding, application development, or
// information technology. Permission for such use, copying,
// modification, merger, publication, distribution, sublicensing,
// creation of derivative works, or sale is expressly withheld.

// This project and source code may use libraries or frameworks
// that are released under various Open-Source licenses. Use of
// those libraries and frameworks are governed by their own
// individual licenses.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
// HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
// WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
// DEALINGS IN THE SOFTWARE.

import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../../widgets/input_field_wrapper.dart';
import '../../widgets/primary_button.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({Key? key}) : super(key: key);

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final _formKey = GlobalKey<FormState>();
  // Update Note: From Flutter 2, we can no longer declare a non-nullable
  // instance variable without initializing it or adding the late keyword. For
  // more info read about [late variables](https://dart.dev/null-safety/understanding-null-safety#late-variables)
  late FocusNode _cvvFocusNode;
  bool _isCvvFocused = false;

  // Update Note: 1. Used of single quotes 
  // than double quotes. Ref: [prefer_single_quotes](https://dart-lang.github.io/linter/lints/prefer_single_quotes.html)
  final Map<String, dynamic> formData = <String, dynamic>{
    'card_number': '',
    'card_name': '',
    'expiry_date': DateTime.now().add(const Duration(days: 30)),
    'cvv': '',
  };

  @override
  void initState() {
    super.initState();
    _cvvFocusNode = FocusNode();
    _cvvFocusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _cvvFocusNode.removeListener(_handleFocusChange);
    _cvvFocusNode.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    if (_cvvFocusNode.hasFocus) {
      _isCvvFocused = true;
    } else {
      _isCvvFocused = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // Update Note: 1. Removed leading underscores for the local
    // variable to follow good practise. For more info,
    // [no_leading_underscores_for_local_identifiers](https://dart-lang.github.io/linter/lints/no_leading_underscores_for_local_identifiers.html)
    // 2. Removed the type annotation as it is the recommeded way
    // (read for mor info: [omit_local_variable_types](https://dart-lang.github.io/linter/lints/omit_local_variable_types.html))
    // 3. Added final keyword as variable is not being assigned any other value.
    // Read more at [prefer_final_locals](https://dart-lang.github.io/linter/lints/prefer_final_locals.html)
    final rotationFactor = _isCvvFocused ? 1.0 : 0.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Card'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Update Note: Explicitly mentioned the value type passed in the
            // builder parameter otherwise dart assumes the value variable as
            // generic datatype
            TweenAnimationBuilder<double>(
              // Update Note: Used const keyword with
              // constant constructors as per [flutter lint rule](https://dart-lang.github.io/linter/lints/prefer_const_constructors.html)
              duration: const Duration(milliseconds: 1000),
              curve: Curves.fastOutSlowIn,
              tween: Tween(begin: rotationFactor, end: rotationFactor),
              builder: (context, value, child) {
                return Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001) // perspective
                    ..rotateY(math.pi * value),
                  alignment: FractionalOffset.center,
                  // Update Note: 1. Performed explicit casting because
                  // map literal when accessed in this case wil return data type
                  // of dynamic. As we stored data in <String, dynamic> form
                  // where String type is the key and dynamic is the value
                  // stored in the map.
                  // 2. Also, it is hard to check the nullability of a value
                  // stored in map literal so during casted nullable type
                  // (like String?) and used the ?? operator provide the default
                  // value if the value returned by map literal is null
                  child: value < 0.5
                      ? FrontCard(
                          cardNumber:
                              (formData['card_number'] as String?) ?? '-',
                          cardName: (formData['card_name'] as String?) ?? '-',
                          expiryDate: formData['expiry_date'] as DateTime?,
                        )
                      : BackCard(
                          cvv: (formData['cvv'] as String?) ?? '-',
                        ),
                );
              },
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        const SizedBox(height: 16),
                        InputFieldWrapper(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            maxLength: 16,
                            decoration:
                                const InputDecoration(hintText: 'Card Number'),
                            onChanged: (value) {
                              setState(() {
                                formData['card_number'] = value;
                              });
                            },
                          ),
                        ),
                        InputFieldWrapper(
                          child: TextFormField(
                            decoration:
                                const InputDecoration(hintText: 'Name on Card'),
                            onChanged: (value) {
                              setState(() {
                                formData['card_name'] = value;
                              });
                            },
                          ),
                        ),
                        InputFieldWrapper(
                          child: TextFormField(
                            decoration:
                                const InputDecoration(hintText: 'Expiry Date'),
                            onTap: () async {
                              // Below line stops keyboard from appearing
                              FocusScope.of(context).requestFocus(FocusNode());

                              final date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100),
                                helpText: 'Select expiry date',
                                fieldLabelText: 'Expiry date',
                                fieldHintText: 'Month/Date/Year',
                                builder: (context, child) {
                                  // Update Note: Added a null check for the
                                  // child widget as it can be null but the
                                  // Theme widget expects a non-nullable child
                                  // widget
                                  if (child == null) {
                                    return const SizedBox();
                                  }
                                  return Theme(
                                    data: ThemeData.light().copyWith(
                                      colorScheme: const ColorScheme.light(
                                        primary: Color(0xFF158443),
                                      ),
                                    ),
                                    child: child,
                                  );
                                },
                              );
                              setState(() {
                                formData['expiry_date'] =
                                    date ?? formData['expiry_date'];
                              });
                            },
                          ),
                        ),
                        InputFieldWrapper(
                          child: TextFormField(
                            focusNode: _cvvFocusNode,
                            keyboardType: TextInputType.number,
                            maxLength: 3,
                            decoration: const InputDecoration(hintText: 'CVV'),
                            onChanged: (value) {
                              setState(() {
                                formData['cvv'] = value;
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 8),
                        PrimaryButton(
                          name: 'Add Card',
                          onTap: () {
                            final form = _formKey.currentState;
                            FocusScope.of(context).unfocus();
                            // Update Note: Added a null check before the form
                            // validation to ensure that the form is not null
                            if (form != null && form.validate()) {
                              form.save();
                              form.reset();
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class FrontCard extends StatelessWidget {
  final String cardNumber;
  final String cardName;
  final DateTime? expiryDate;

  late String _formattedCardNumber;
  late String _formattedExpiryDate;

  FrontCard({
    Key? key,
    required this.cardNumber,
    required this.cardName,
    this.expiryDate,
  }) : super(key: key) {
    _formattedCardNumber = cardNumber.padRight(16, '*');
    _formattedCardNumber = _formattedCardNumber.replaceAllMapped(
        RegExp(r'.{4}'), (match) => '${match.group(0)} ');
    _formattedExpiryDate =
        '${expiryDate?.month}/${'${expiryDate?.year}'.substring(2)}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange[300],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Mastercard'),
          const Spacer(),
          Center(
            child: Text(
              _formattedCardNumber,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4?.copyWith(
                    fontSize: 24,
                    color: Colors.black,
                  ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'VALID\nTHRU',
                style: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 8),
              Text(_formattedExpiryDate),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(cardName.toUpperCase()),
              Image.asset('assets/images/mastercard-logo.png', width: 100),
            ],
          ),
        ],
      ),
    );
  }
}

class BackCard extends StatelessWidget {
  final String cvv;
  const BackCard({
    Key? key,
    required this.cvv,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001) // perspective
        ..rotateY(math.pi),
      alignment: FractionalOffset.center,
      child: Container(
        height: 250,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Text('ELECTRONIC USE ONLY'),
            ),
            Container(
              color: Colors.black,
              height: 50,
            ),
            FractionallySizedBox(
              widthFactor: 0.8,
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.only(right: 16),
                alignment: Alignment.centerRight,
                color: Colors.grey,
                height: 50,
                child: Text(
                  cvv,
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
