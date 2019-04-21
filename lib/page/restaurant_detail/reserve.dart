import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:cariin_rev/page/restaurant_detail/view_model/restaurant_model.dart';

class Reservation extends StatefulWidget {
  final _orders;

  Reservation(this._orders);

  @override
  _ReservationState createState() => _ReservationState(_orders);
}

class _ReservationState extends State<Reservation> {
   List _orders;

  _ReservationState(this._orders);

  final formats = {
    InputType.both: DateFormat("EEEE, MMMM d, yyyy 'at' h:mma"),
    InputType.date: DateFormat('yyyy-MM-dd'),
    InputType.time: DateFormat("HH:mm"),
  };

  // Changeable in demo
  InputType inputType = InputType.both;
  bool editable = true;
  DateTime date;
  String selectedPayMethod = dataDummy.payment[0].method;


    Widget listOrder() {
      return ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: _orders.length,
          itemBuilder: (context, index) {
            var item = _orders[index];
            var controller = new MoneyMaskedTextController(leftSymbol: "Rp. ");
            controller.updateValue(item.price);
            return Dismissible(
              key: Key(item.name),
              onDismissed: (DismissDirection dir) {
                setState(() {
                  _orders.removeAt(index);
                });
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text("Barang di hapus")));
              },
              background: Container(
                color: Colors.red,
                child: Icon(Icons.remove_shopping_cart),
                alignment: Alignment.centerLeft,
              ),
              child: Card(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Image.network(
                          item.imagePath,
                          width: 100.0,
                          height: 100.0,
                        ),
                      ),
                      Expanded(
                      flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 120.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(item.name,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text(
                                  controller.text,
                                  style: TextStyle(fontSize: 12.0),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: <Widget>[
                            IconButton(
                                icon: Icon(Icons.expand_less),
                                onPressed: () {
                                  setState(() {
                                    item.qty += 1;
                                  });
                                }),
                            Text(item.qty.toString()),
                            IconButton(
                                icon: Icon(Icons.expand_more),
                                onPressed: () {
                                  setState(() {
                                    item.qty -= 1;
                                  });
                                  if (item.qty < 1) {
                                    setState(() {
                                      _orders.removeAt(index);
                                    });
                                  }
                                }),
                          ],
                        ),
                      )
                    ],
                  )),
            );
          });
    }

    Widget messageBox() {
      return Theme(
        data: ThemeData(primaryColor: Colors.blue),
        child: TextFormField(
          maxLines: 3,
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Tambahkan pesan",
              hintText: "Tolong jangan terlalu pedas yaa"),
        ),
      );
    }

    Widget couponBox() {
      return Theme(
        data: ThemeData(primaryColor: Colors.blue),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: TextFormField(
                maxLength: 8,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.account_balance_wallet,color: Color(0xfff03c48),),
                  border: OutlineInputBorder(),
                  labelText: "Masukan kupon",
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            )
          ],
        ),
      );
    }

    Widget timePicker() {
      return SingleChildScrollView(
        child: DateTimePickerFormField(
          inputType: inputType,
          format: formats[inputType],
          editable: editable,
          decoration: InputDecoration(
              labelText: 'Pilih jam dan tanggal', hasFloatingPlaceholder: false),
          onChanged: (dt) => setState(() => date = dt),
        ),
      );
    }

    void updateInputType({bool date, bool time}) {
      date = date ?? inputType != InputType.time;
      time = time ?? inputType != InputType.date;
      setState(() => inputType =
      date ? time ? InputType.both : InputType.date : InputType.time);
    }

    @override
    Widget build(BuildContext context) {
      Widget messageBox() {
        return Theme(
          data: ThemeData(primaryColor: Colors.blue),
          child: TextFormField(
            maxLines: 3,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Tambahkan pesan",
                hintText: "Tolong jangan terlalu pedas yaa"),
          ),
        );
      }

      Widget timePicker() {
        return DateTimePickerFormField(
          inputType: inputType,
          format: formats[inputType],
          editable: editable,
          decoration: InputDecoration(
              labelText: 'Pilih jam dan tanggal', hasFloatingPlaceholder: false),
          onChanged: (dt) => setState(() => date = dt),
        );
      }

      void updateInputType({bool date, bool time}) {
        date = date ?? inputType != InputType.time;
        time = time ?? inputType != InputType.date;
        setState(() => inputType =
        date ? time ? InputType.both : InputType.date : InputType.time);
      }

      final List<DropdownMenuItem<String>> listPaymentMethod =
      dataDummy.payment.map((value) {
        return new DropdownMenuItem(
          value: value.method,
          child: new Text(value.method),
        );
      }).toList();

      return Container(
        color: Colors.grey,
        child: ListView(
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Text(
                "Menu Pesanan",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
              ),
            ),
            Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: listOrder(),
                )),
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 5.0),
                    child: Text(
                      "Catatan untuk restaurant",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: messageBox(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 5.0),
                    child: Text(
                      "Waktu anda akan datang",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: timePicker(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 5.0),
                    child: Text(
                      "Pilih metode pembayaran",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      title: Text(
                          "Bayar di tempat dengan : "),
                      leading: Image.asset(
                        "assets/icon/money.png",
                        width: 30.0,
                        height: 30.0,
                      ),
                      trailing: DropdownButton(
                        items: listPaymentMethod,
                        onChanged: (String newVal){
                          setState(() {
                            selectedPayMethod = newVal;
                          });
                        },
                        value: selectedPayMethod,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 5.0),
                    child: Text(
                      "Kupon",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: couponBox()
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
                color: Colors.white,
                child: totalBox()
            ),
          ],
        ),
      );
    }

  Widget totalBox() {
    var controller = new MoneyMaskedTextController(leftSymbol: "Rp. ");
    var total = _orders.fold(0,(curr,next) => curr + (next.price * next.qty));
    controller.updateValue(total);
    print(total);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                Text("Total pemesanan"),
                Text(controller.text,style: TextStyle(color: Colors.blueAccent,fontSize: 18.0,fontWeight: FontWeight.bold),),
                Text("Tanggal 12/03/2019")
              ],
            ),
          ),
          SizedBox(width: 5.0,),
          Expanded(flex: 2,child: Container(
            child: RaisedButton(
              color: Colors.blueAccent,
                child: Text("Bayar dengan ${selectedPayMethod}",style: TextStyle(color: Colors.white),),
                onPressed: ()=> print("press")
            ),
          ))
        ],
      ),
    );
  }

}
