import 'package:flutter/material.dart';

class DetilTransaksi extends StatefulWidget{
 // const PaymentDetailPage({Key? key}) : super(key: key);
  const DetilTransaksi({Key? key}) :super(key: key);

  @override
  State<DetilTransaksi> createState()=>_DetailTransaksiState();

    // TODO: implement createState
   // throw UnimplementedError();
  }

class _DetailTransaksiState extends State<DetilTransaksi> {
  var stateNamaPropinsi ='Pilih';
  final _controller = TextEditingController();

  @override
  void initState(){
    super.initState();
    _controller.addListener(() {
      _errorText();
    });
}

String? _errorText(){
    if(_controller.text.isEmpty){
      return'Data Tidak Boleh Kosong';
    }else{
      return null;
    }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              ///detil Transaksi
              const Text('Detail Transaksi'),
              TextField(
                controller: _controller,
                onChanged: (value){
                  _errorText();
                },
                decoration: InputDecoration(
                  hintText: 'nama kartu',errorText: _errorText()),

                ),
              Row(
                children: const[
                  Expanded(
                    flex: 2,
                    child: TextField(
                      decoration: InputDecoration(hintText: 'nomor kartu'),
                    ),
                  ),
                  SizedBox(width: 32.0),
                  Expanded(
                    flex: 1,
                    child: TextField(
                      decoration: InputDecoration(hintText: 'expire'),

                    ),
                  ),
                  SizedBox(width: 32.0),
                  Expanded(
                    flex: 1,
                    child: TextField(
                      decoration: InputDecoration(hintText: 'cv'),
                    ),
                  )

                ],
              ),
          //billing address
          const SizedBox(
            height: 42.0,

          ),
          const Text('billing Address'),
          Row(
            children: const[
              Expanded(
                child: TextField(
                  decoration: InputDecoration(hintText: 'Nama Jalan'),

                ),
              ),
              SizedBox(
                width: 22.0,
                 ),
              Expanded(
                  child: TextField(
                    decoration: InputDecoration(hintText: 'Kota'),

                  )
              )
            ],
          ),

          Row(
            children: [
              Expanded(
                child: DropdownButton<String>(
                  hint: const Text('Propinsi'),
                  value: stateNamaPropinsi,
                  items: const[
                    DropdownMenuItem<String>(
                      value: 'pilih',child: Text('Pilih')),
                    DropdownMenuItem<String>(
                      value: 'jawa barat',child: Text('Jawa Barat')),
                    DropdownMenuItem<String>(
                        value:'Jawa Tengah', child: Text('Jawa Tengah')),
                    DropdownMenuItem<String>(
                        value:'Jawa Timur', child: Text('Jawa Timur'))
                  ],
                  onChanged: (value){
                    setState(() {
                      stateNamaPropinsi=value??'';
                    });
                  },
                )),
            const Expanded(child: TextField(
              decoration: InputDecoration(hintText: 'kode pos'),

            ),
            ),


            ],
          ),
          const SizedBox(
            height: 42.0,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(onPressed: (){},child: const Text('bayar')),
            )
            ],
          ),
        )),
      );

    // TODO: implement build
    //throw UnimplementedError();
  }

}