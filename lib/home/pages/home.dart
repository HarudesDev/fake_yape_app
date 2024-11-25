import 'package:auto_route/auto_route.dart';
import 'package:fake_yape_app/shared/auto_router.gr.dart';
import 'package:fake_yape_app/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static final transactions = <Map<String, String>>[
    {
      'receiverName': 'Saida M. Flores M.',
      'date': 'Hoy 9:06 AM',
      'amount': 'S/160.00',
    },
    {
      'receiverName': 'Saida M. Flores M.',
      'date': 'Hoy 9:06 AM',
      'amount': 'S/160.00',
    },
    {
      'receiverName': 'Saida M. Flores M.',
      'date': 'Hoy 9:06 AM',
      'amount': 'S/160.00',
    },
    {
      'receiverName': 'Saida M. Flores M.',
      'date': 'Hoy 9:06 AM',
      'amount': 'S/160.00',
    },
    {
      'receiverName': 'Saida M. Flores M.',
      'date': 'Hoy 9:06 AM',
      'amount': 'S/160.00',
    },
    {
      'receiverName': 'Saida M. Flores M.',
      'date': 'Hoy 9:06 AM',
      'amount': 'S/160.00',
    },
    {
      'receiverName': 'Saida M. Flores M.',
      'date': 'Hoy 9:06 AM',
      'amount': 'S/160.00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final future = Supabase.instance.client.from('countries').select();

    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [mainColor, mainColorDark],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    "Hola, nombre usuario",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            actions: [
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.headset_mic_outlined,
                  color: Colors.white,
                ),
              ),
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.notifications_outlined,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              FutureBuilder(
                future: future,
                builder: ((context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final countries = snapshot.data;
                  return Column(
                    children: countries!.map((snapshot) {
                      return Text(snapshot['name']);
                    }).toList(),
                  );
                }),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuxiliaryButton(
                    imageUrl: "assets/images/welcome_page_1.png",
                    buttonText: "Recargar \ncelular",
                  ),
                  AuxiliaryButton(
                    imageUrl: "assets/images/welcome_page_1.png",
                    buttonText: "Yapear \nservicios",
                  ),
                  AuxiliaryButton(
                    imageUrl: "assets/images/welcome_page_1.png",
                    buttonText: "Créditos",
                  ),
                  AuxiliaryButton(
                    imageUrl: "assets/images/welcome_page_1.png",
                    buttonText: "Código de \naprobación",
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuxiliaryButton(
                    imageUrl: "assets/images/welcome_page_1.png",
                    buttonText: "Promos",
                  ),
                  AuxiliaryButton(
                    imageUrl: "assets/images/welcome_page_1.png",
                    buttonText: "Tienda",
                  ),
                  AuxiliaryButton(
                    imageUrl: "assets/images/welcome_page_1.png",
                    buttonText: "Cambiar \ndólares",
                  ),
                  AuxiliaryButton(
                    imageUrl: "assets/images/welcome_page_1.png",
                    buttonText: "Ver más",
                  ),
                ],
              ),
              const Gap(10),
              Expanded(
                child: ListView(
                  children: [
                    //todo: reemplazar la SizedBox por el carrusel
                    const Gap(50),
                    TransactionsList(transactions: transactions),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.white,
            child: SizedBox.expand(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        AutoRouter.of(context).push(const QrReaderRoute());
                      },
                      label: const Text(
                        "Escanear QR",
                        style: TextStyle(
                          color: secondaryColor,
                        ),
                      ),
                      icon: const Icon(
                        Icons.qr_code,
                        color: secondaryColor,
                      ),
                      style: ButtonStyle(
                        minimumSize: const WidgetStatePropertyAll(
                          Size(175, 45),
                        ),
                        backgroundColor:
                            const WidgetStatePropertyAll(Colors.white),
                        elevation: const WidgetStatePropertyAll(0),
                        side: const WidgetStatePropertyAll(
                          BorderSide(color: secondaryColor),
                        ),
                        shape: getRoundedRectangleBorder(5),
                      ),
                    ),
                  ),
                  SizedBox(
                    //TODO implementar navegación
                    child: OutlinedButton.icon(
                      onPressed: () {
                        AutoRouter.of(context).push(const YapeDirectoryRoute());
                      },
                      label: const Text(
                        "Yapear",
                        style: TextStyle(color: Colors.white),
                      ),
                      icon: const Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                      style: ButtonStyle(
                        minimumSize: const WidgetStatePropertyAll(
                          Size(175, 45),
                        ),
                        backgroundColor:
                            const WidgetStatePropertyAll(secondaryColor),
                        elevation: const WidgetStatePropertyAll(0),
                        side: const WidgetStatePropertyAll(
                          BorderSide(color: secondaryColor),
                        ),
                        shape: getRoundedRectangleBorder(5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TransactionsList extends StatelessWidget {
  const TransactionsList({
    super.key,
    required this.transactions,
  });

  final List<Map<String, String>> transactions;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: const WidgetStatePropertyAll(Colors.white),
                alignment: const AlignmentDirectional(-1, 0),
                elevation: const WidgetStatePropertyAll<double>(3),
                shape: getRoundedRectangleBorder(10.0),
              ),
              label: const Text(
                "Mostrar saldo",
                style: TextStyle(color: mainColor),
              ),
              icon: const Icon(
                Icons.visibility,
                color: mainColor,
              ),
              onPressed: () {},
            ),
          ),
          const Gap(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Movimientos",
                style: TextStyle(
                  color: mainColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.refresh,
                    color: secondaryColor,
                    size: 24,
                  ),
                  //const VerticalDivider(),
                  OutlinedButton(
                    onPressed: () {
                      AutoRouter.of(context).push(const TransactionsRoute());
                    },
                    style: const ButtonStyle(
                      side: WidgetStatePropertyAll(
                        BorderSide(color: Colors.transparent),
                      ),
                    ),
                    child: const Text(
                      "Ver todos",
                      style: TextStyle(color: secondaryColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Gap(10),
          const Divider(),
          ...transactions.map((transaction) {
            return Column(
              children: [
                TransactionTile(transaction: transaction),
                const Divider(),
              ],
            );
          }),
        ],
      ),
    );
  }
}

class AuxiliaryButton extends StatelessWidget {
  final String imageUrl;
  final String buttonText;

  const AuxiliaryButton(
      {super.key, required this.imageUrl, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imageUrl,
          width: 60,
          height: 60,
        ),
        Text(
          buttonText,
          style: const TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}

class TransactionTile extends StatelessWidget {
  final Map<String, String> transaction;

  const TransactionTile({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction['receiverName']!,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              const Gap(10),
              Text(
                transaction['date']!,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Text(
            transaction['amount']!,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
