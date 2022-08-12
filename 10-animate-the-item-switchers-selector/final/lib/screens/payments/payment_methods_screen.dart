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

import 'package:flutter/material.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Methods'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.credit_card),
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/add_card',
          );
        },
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey[300],
            child: const Text(
              'Cards',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          const ListTile(
            leading: CircleAvatar(),
            title: Text('1243 2255 5334 ****'),
            subtitle: Text('Visa'),
            trailing: Icon(Icons.edit),
          ),
          const ListTile(
            leading: CircleAvatar(),
            title: Text('6443 2255 5334 ****'),
            subtitle: Text('MasterCard'),
            trailing: Icon(Icons.edit),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey[300],
            child: const Text(
              'Crypto',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          const ListTile(
            leading: CircleAvatar(),
            title: Text('3EktnHQD7RiAE6uzMj2ZifT9*****'),
            subtitle: Text('Bitcoin'),
            trailing: Icon(Icons.edit),
          ),
        ],
      ),
    );
  }
}
