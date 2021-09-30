import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:gmc_erp/common/widget/BaseInheritWidget.dart';
import 'package:gmc_erp/models/DTO/request_product_dto.dart';
import 'package:gmc_erp/screens/ListJobs/list_job_screen.dart';
import 'package:gmc_erp/services/AuthService.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:gmc_erp/public/constant/color.dart';

class ListCardBadge extends StatelessWidget {
  final String tittle;
  final int count;
  final RequestProductDTO requestProductDTO;
  final Set<void> Function(String) onTap;


  const ListCardBadge(
      {Key key,  String this.tittle, int this.count,  Set<void> Function(String) this.onTap, this.requestProductDTO})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => {
        // Navigator pages
        Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) {
                      RequestProductDTO requestProductDTOSearch = RequestProductDTO(groupByValue: this.tittle,
                      groupByColumn: this.requestProductDTO.groupByColumn,
                      jobTicket: this.requestProductDTO.jobTicket,
                      phase: this.requestProductDTO.phase,
                      status: this.requestProductDTO.status,
                      workCenter: this.requestProductDTO.workCenter,
                      workOrder: this.requestProductDTO.workOrder);
                      return ListJobsScreen(tittle, requestProductDTO: requestProductDTOSearch,);
                    }))
            .then((context) {
              print('vao 123123123');
        }),
        // this.onTap(tittle)
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
        color: HexColor(kNormalBackground),
        child: Center(
          child: Row(
            children: [
              SizedBox(width: size.width * 0.03),
              new Expanded(
                flex: 4,
                child: Text(
                  '${tittle}',
                  style: TextStyle(
                      color: HexColor(kNormalString),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              new Expanded(
                  flex: 1,
                  child: Text.rich(
                    TextSpan(children: <InlineSpan>[
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Chip(
                          backgroundColor: HexColor(kBlue800),
                          label: Text('${count}',
                              style: TextStyle(
                                  color: HexColor(kWhite), fontSize: 12.0)),
                        ),
                      ),
                      TextSpan(text: ' >', style: TextStyle(fontSize: 14.0)),
                    ]),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
