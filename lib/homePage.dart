import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var cardHolderName ="";
  var cardNumber ="";
  var expiryDate ="";
  var cvvCode = "";
  var isCvvFocused =false;
  var isSelected =false;

final GlobalKey<FormState>formKey =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Card"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children:[
            Container(
              height: 250,
              width: double.infinity,
              color:Colors.white,
              child: Image.network("data:image/png;base64,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",fit: BoxFit.fill,),
            ),
            SizedBox(height: 10,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CreditCardForm(
                      cardNumber: cardNumber ,
                      expiryDate: expiryDate, 
                      cardHolderName: cardHolderName,
                      cvvCode: cvvCode, 
                      onCreditCardModelChange: onCreditCardModelChange, 
                      formKey: formKey,
                      inputConfiguration: InputConfiguration(
                        cardNumberDecoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Card Number",
                          hintText: "**** **** ****",
                        ),
                        expiryDateDecoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Expiry Date",
                          hintText: "MM/YY",
                        ),
                        cvvCodeDecoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "CVV",
                          hintText: "***",
                        ),
                        cardHolderDecoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Card Holder",
                          hintText: "Card Holder"
                          
                        ),
                        
                      ),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Checkbox(value: isSelected, onChanged: (bool?value){
                          setState(() {
                            isSelected =value!;
                          });
                        }),
                        SizedBox(width: 10,),
                        Text("Save card data for future payments",style: TextStyle(
                          fontSize: 20,color: Colors.black
                        ),)
                          ],
                        ),
                      ),
                     Padding(
                       padding: const EdgeInsets.all(20),
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black
                          ),
                          onPressed: (){},
                         child: Text("Cancel",style: TextStyle(
                            fontSize: 20,color: Colors.white
                          ),)),
                          SizedBox(width: 50,),
                           ElevatedButton(
                          onPressed: (){},
                         child:Row(
                          children: [
                            Text("Continue",style: TextStyle(
                            fontSize: 20,color: Colors.white
                          ),),
                          Icon(Icons.arrow_forward,color: Colors.white,)
                          ],
                         )
                         ),
                        ],
                       ),
                     )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  void onCreditCardModelChange(CreditCardModel creditCardModel){
    setState(() {
      cardNumber =creditCardModel.cardNumber;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
      expiryDate = creditCardModel.expiryDate;
    });
  }
}