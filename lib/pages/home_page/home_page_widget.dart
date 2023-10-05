import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Import and Export',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FutureBuilder<List<CustomersRow>>(
                    future: CustomersTable().queryRows(
                      queryFn: (q) => q,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<CustomersRow> iconCustomersRowList = snapshot.data!;
                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await actions.importFromCsv(
                            '',
                          );
                        },
                        child: Icon(
                          Icons.ios_share,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          size: 24.0,
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: FutureBuilder<List<CustomersRow>>(
                      future: CustomersTable().queryRows(
                        queryFn: (q) => q,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<CustomersRow> iconCustomersRowList =
                            snapshot.data!;
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await actions.downloadCollectionAsCSV(
                              iconCustomersRowList.toList(),
                            );
                          },
                          child: Icon(
                            Icons.download,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            size: 24.0,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: FutureBuilder<List<CustomersRow>>(
                  future: CustomersTable().queryRows(
                    queryFn: (q) => q,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<CustomersRow> dataTableCustomersRowList =
                        snapshot.data!;
                    return Container(
                      width: double.infinity,
                      child: DataTable2(
                        columns: [
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                'id',
                                style: FlutterFlowTheme.of(context).labelLarge,
                              ),
                            ),
                            fixedWidth: 100.0,
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                'created_at',
                                style: FlutterFlowTheme.of(context).labelLarge,
                              ),
                            ),
                            fixedWidth: 180.0,
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                'name',
                                style: FlutterFlowTheme.of(context).labelLarge,
                              ),
                            ),
                            fixedWidth: 200.0,
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                'job',
                                style: FlutterFlowTheme.of(context).labelLarge,
                              ),
                            ),
                            fixedWidth: 200.0,
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                'emial',
                                style: FlutterFlowTheme.of(context).labelLarge,
                              ),
                            ),
                            fixedWidth: 250.0,
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                'salary(\$)',
                                style: FlutterFlowTheme.of(context).labelLarge,
                              ),
                            ),
                            fixedWidth: 100.0,
                          ),
                        ],
                        rows: dataTableCustomersRowList
                            .mapIndexed((dataTableIndex,
                                    dataTableCustomersRow) =>
                                [
                                  Text(
                                    valueOrDefault<String>(
                                      dataTableCustomersRow.id.toString(),
                                      '1',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      dateTimeFormat('yMMMd',
                                          dataTableCustomersRow.createdAt),
                                      'today',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      dataTableCustomersRow.name,
                                      'name',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      dataTableCustomersRow.job,
                                      'job',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      dataTableCustomersRow.email,
                                      'email',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      dataTableCustomersRow.salary?.toString(),
                                      '100',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ].map((c) => DataCell(c)).toList())
                            .map((e) => DataRow(cells: e))
                            .toList(),
                        headingRowColor: MaterialStateProperty.all(
                          FlutterFlowTheme.of(context).accent2,
                        ),
                        headingRowHeight: 56.0,
                        dataRowColor: MaterialStateProperty.all(
                          FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        dataRowHeight: 56.0,
                        border: TableBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        dividerThickness: 2.0,
                        columnSpacing: 1.0,
                        showBottomBorder: true,
                        minWidth: 49.0,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
