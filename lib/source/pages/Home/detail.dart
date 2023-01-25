import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proses/source/data/home/cubit/detail_cubit.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
        actions: [
          SizedBox(
            width: MediaQuery.of(context).size.width <= 600 ? 200 : 300,
            child: TextFormField(
              controller: controller,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  focusColor: Colors.white,
                  hintText: 'Masukan ID Partai',
                  contentPadding: EdgeInsets.symmetric(vertical: 20),
                  hintStyle: TextStyle(color: Colors.white),
                  suffixIcon: InkWell(
                      onTap: () {
                        BlocProvider.of<DetailCubit>(context).dektp(controller.text);
                        controller.clear();
                      },
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ))),
            ),
          ),
          IconButton(
              onPressed: () {
                BlocProvider.of<DetailCubit>(context).scanQR();
              },
              icon: Icon(Icons.qr_code_sharp))
        ],
      ),
      body: BlocBuilder<DetailCubit, DetailState>(builder: (context, state) {
        if (state is DetailLoading) {
          return Container(
            child: const Center(
              child: CupertinoActivityIndicator(),
            ),
          );
        }
        if (state is DetailLoaded == false) {
          return Container();
        }
        var jo = (state as DetailLoaded).jsonJO;
        var data = (state as DetailLoaded).json;
        var id_partai = (state as DetailLoaded).id_partai;
        final DataTableSource pageTable = MyData(pageTable: data);
        int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
        int _rowsPerPage1 = PaginatedDataTable.defaultRowsPerPage;
        var tableItemsCount = data.length;
        var defaultRowsPerPage = PaginatedDataTable.defaultRowsPerPage;
        var isRowCountLessDefaultRowsPerPage = tableItemsCount < defaultRowsPerPage;
        _rowsPerPage = isRowCountLessDefaultRowsPerPage ? tableItemsCount : defaultRowsPerPage;
        if (data.isEmpty && jo.isEmpty) {
          return Container(
            alignment: Alignment.center,
            child: Text("Data Kosong"),
          );
        } else {
          return Container(
            margin: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8.0), boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 1.2,
                      spreadRadius: 1.2,
                      offset: Offset(1, 2),
                    )
                  ]),
                  child: Table(
                    columnWidths: const {
                      0: FixedColumnWidth(100),
                      1: FixedColumnWidth(12),
                    },
                    children: [
                      TableRow(children: [
                        Text('ID Partai', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
                        Text(':', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
                        Text(
                          '$id_partai',
                          style: TextStyle(fontSize: 17),
                        ),
                      ]),
                      TableRow(children: [
                        Text('Job Order', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
                        Text(':', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
                        Text(
                          jo[0]['jo'],
                          style: TextStyle(fontSize: 17),
                        ),
                      ]),
                      TableRow(children: [
                        Text('Customer', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
                        Text(':', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
                        Text(jo[0]['customer'], style: TextStyle(fontSize: 17)),
                      ]),
                      TableRow(children: [
                        Text('Jenis Kain', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
                        Text(':', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
                        Text(jo[0]['jenis_kain'], style: TextStyle(fontSize: 17)),
                      ]),
                      TableRow(children: [
                        Text('No Design', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
                        Text(':', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
                        Text(jo[0]['no_design'], style: TextStyle(fontSize: 17)),
                      ]),
                      TableRow(children: [
                        Text('CW', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
                        Text(':', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
                        Text(jo[0]['cw'], style: TextStyle(fontSize: 17)),
                      ]),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Flexible(
                  flex: 2,
                  child: SingleChildScrollView(
                    child: PaginatedDataTable(
                      dataRowHeight: 40,
                      columnSpacing: 14,
                      showCheckboxColumn: false,
                      horizontalMargin: 10,
                      rowsPerPage: !isRowCountLessDefaultRowsPerPage ? _rowsPerPage : _rowsPerPage1,
                      onRowsPerPageChanged: isRowCountLessDefaultRowsPerPage
                          ? null
                          : ((value) {
                              setState(() {
                                _rowsPerPage1 = value!;
                              });
                            }),
                      columns: const [
                        DataColumn(label: Text("No", style: TextStyle(fontSize: 16))),
                        DataColumn(label: Text("Tgl Produksi", style: TextStyle(fontSize: 16))),
                        DataColumn(label: Text("Kelompok", style: TextStyle(fontSize: 16))),
                        DataColumn(label: Text("Proses", style: TextStyle(fontSize: 16))),
                        DataColumn(label: Text("Nama Mesin", style: TextStyle(fontSize: 16))),
                        DataColumn(label: Text("Quantity M", style: TextStyle(fontSize: 16))),
                        DataColumn(label: Text("Quantity Kg", style: TextStyle(fontSize: 16))),
                      ],
                      source: pageTable,
                    ),
                  ),
                )
              ],
            ),
          );
        }
      }),
    );
  }
}

class MyData extends DataTableSource {
  final List? pageTable;

  MyData({this.pageTable});
  // final List _data = pageTable ;
  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => pageTable!.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(Text('${index + 1}')),
      DataCell(Center(child: Text(pageTable![index]['tgl_produksi'].toString(), style: TextStyle(fontSize: 15)))),
      DataCell(Text(pageTable![index]["kelompok"].toString(), style: TextStyle(fontSize: 15))),
      DataCell(Text(pageTable![index]["proses"].toString(), style: TextStyle(fontSize: 15))),
      DataCell(Text(pageTable![index]["nama_mesin"].toString(), style: TextStyle(fontSize: 15))),
      DataCell(Center(child: Text(pageTable![index]["qty_m"].toString(), style: TextStyle(fontSize: 15)))),
      DataCell(Center(child: Text(pageTable![index]["qty_kg"].toString(), style: TextStyle(fontSize: 15)))),
    ]);
  }
}
