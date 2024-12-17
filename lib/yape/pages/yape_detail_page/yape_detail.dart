import 'package:fake_yape_app/shared/style.dart';
import 'package:fake_yape_app/yape/models/yapeo.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'yape_detail_components.dart';

class YapeDetail extends StatelessWidget {
  final Yapeo yapeData;
  final bool isReceiver;

  const YapeDetail({
    super.key,
    required this.yapeData,
    required this.isReceiver,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "¡Yapeaste!",
          style: TextStyle(
            color: mainColor,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Gap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "S/",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
            ),
            Text(
              yapeData.yapeoAmount.toString(),
              style: const TextStyle(
                color: mainColor,
                fontSize: 55,
              ),
            ),
          ],
        ),
        Text(
          isReceiver ? yapeData.senderName : yapeData.receiverName,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        Text(
          yapeData.yapeoDate.toString(),
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 14,
          ),
        ),
        const Gap(15),
        const Divider(),
        yapeData.message != null
            ? DetailTile(
                firstString: "",
                secondString: yapeData.message!,
              )
            : const Gap(1),
        DetailTile(
          firstString: "N° de celular: ",
          secondString:
              isReceiver ? yapeData.senderPhone : yapeData.receiverPhone,
        ),
        const DetailTile(
          firstString: "Destino: ",
          secondString: "Yape",
        ),
        DetailTile(
          firstString: "N° de operación: ",
          secondString: yapeData.id.toString(),
        ),
      ],
    );
  }
}

//TODO Acomodar la apariencia de la screenshot
class YapeDetailScreenshot extends StatelessWidget {
  final Yapeo yapeData;
  final bool isReceiver;

  const YapeDetailScreenshot({
    super.key,
    required this.yapeData,
    required this.isReceiver,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.center,
          colors: [
            mainColorDark,
            mainColor,
          ],
        ),
      ),
      child: Column(
        children: [
          const Gap(45),
          //Todo Añadir la animación del yape
          const Gap(100),
          const Gap(45),
          Expanded(
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: CustomPaint(
                  painter: YapeDetailPainter(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    width: double.infinity,
                    color: Colors.transparent,
                    child: YapeDetail(
                      yapeData: yapeData,
                      isReceiver: isReceiver,
                    ),
                  ),
                )),
          ),
          const Gap(30),
        ],
      ),
    );
  }
}
