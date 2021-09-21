part of home_view;

class _HomeMobile extends StatefulWidget {
  final HomeViewModel viewModel;

  _HomeMobile(this.viewModel);

  @override
  __HomeMobileState createState() => __HomeMobileState();
}

class __HomeMobileState extends State<_HomeMobile> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            collapsedHeight: 100.0,
            backgroundColor: scaffoldBackgroundColor,
            pinned: true,
            leadingWidth: 96,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/images/notification.png',
                  scale: 3,
                ),
              ),
              SizedBox(width: 8.0),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/images/qr_code.png',
                  color: Colors.grey.shade600,
                  scale: 3,
                ),
              )
            ],
            leading: Container(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: blueColor),
                  color: blueColor.withOpacity(0.1),
                ),
                child: Text(
                  'KK',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: blueColor,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ),
            expandedHeight: 175,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'BALANCE',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 10.0),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'KSH. 300,000',
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              'assets/images/hide.png',
                              scale: 5,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    'AVAILABLE FULIZA: KSH 500.69',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 10.0),
                  ),
                ],
              ),
            ),
          ),
          SliverPersistentHeader(
            delegate: SectionHeaderDelegate(),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              CarouselSlider(
                carouselController: _controller,
                options: CarouselOptions(
                    enableInfiniteScroll: false,
                    viewportFraction: 1.0,
                    height: 220.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
                items: [
                  CustomCard(
                    amount: "KSH. 15,000",
                    subTitle: "DAILY AVERAGE",
                    subAmount: "KSH 800",
                    subText: "",
                    color: greenColor,
                  ),
                  CustomCard(
                    amount: "KSH. 15,000",
                    subTitle: "GENERAL",
                    subAmount: "KSH 11,000",
                    subText: "73%",
                    color: orangeColor,
                  ),
                  CustomCard(
                    amount: "KSH. 15,000",
                    subTitle: "FAMILY AND FRIENDS",
                    subAmount: "KSH 3,500",
                    subText: "23%",
                    color: darkBlueColor,
                  ),
                  CustomCard(
                    amount: "KSH. 15,000",
                    subTitle: "WITHDRAWAL",
                    subAmount: "KSH 500",
                    subText: "3%",
                    color: redColor,
                  ),
                  CustomCard(
                    amount: "KSH. 306",
                    subTitle: "BILLS AND SERVICES",
                    subAmount: "KSH 50.0",
                    subText: "16%",
                    color: purpleColor,
                  ),
                ].map((widget) {
                  return Builder(
                    builder: (BuildContext context) {
                      return widget;
                    },
                  );
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  greenColor,
                  orangeColor,
                  darkBlueColor,
                  redColor,
                  purpleColor,
                ].asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 8.0,
                      height: 8.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            _current == entry.key ? entry.value : Colors.grey,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          )),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'M-PESA STATEMENTS',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Text(
                    'SEE ALL',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: greenColor,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              getTransactions(context),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> getTransactions(context) {
    List<Row> rows = [];
    for (var i = 0; i < 5; i++) {
      rows.add(
        Row(
          children: [
            SizedBox(width: 8.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 48,
                height: 48,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: blueColor.withOpacity(0.10),
                ),
                child: Text(
                  'JD',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: blueColor,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ),
            SizedBox(width: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'JOHN DOE',
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Text(
                  '254712345678',
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Colors.grey.shade400,
                      ),
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '-KSH 500.00',
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Text(
                  DateFormat('d MMM, HH:MM aa').format(DateTime.now()),
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Colors.grey.shade400,
                      ),
                ),
              ],
            ),
            SizedBox(width: 16.0)
          ],
        ),
      );
    }
    return rows;
  }
}

class CustomCard extends StatelessWidget {
  final String amount;
  final String subTitle;
  final String subAmount;
  final String subText;
  final Color color;

  const CustomCard(
      {Key? key,
      required this.amount,
      required this.subTitle,
      required this.subAmount,
      required this.subText,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .9,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 24.0, right: 0.0, bottom: 2.0, left: 24.0),
                  child: Text(
                    'TOTAL SPENT THIS MONTH',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Colors.grey.shade100.withOpacity(.80),
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 2.0, right: 0.0, bottom: 8.0, left: 24.0),
                  child: Text(
                    'KSH. 306.50',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 0.0, right: 0.0, bottom: 2.0, left: 24.0),
                  child: Text(
                    subTitle,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Colors.grey.shade100.withOpacity(.80),
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 0.0, right: 0.0, bottom: 2.0, left: 24.0),
                  child: Text(
                    'KSH. 50.00',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ),
                subText != ""
                    ? Padding(
                        padding: const EdgeInsets.only(
                            top: 0.0, right: 0.0, bottom: 0.0, left: 24.0),
                        child: Text(
                          subText,
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                      )
                    : Container(),
                SizedBox(height: 24.0),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 24.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SectionHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double height;

  SectionHeaderDelegate([this.height = 120]);

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomButton(
            assetUrl: 'assets/images/send_request.png',
            color: greenerColor,
            label: 'SEND AND REQUEST',
          ),
          CustomButton(
            assetUrl: 'assets/images/pay.png',
            color: darkBlueColor,
            label: 'PAY',
          ),
          CustomButton(
            assetUrl: 'assets/images/withdraw.png',
            color: redColor,
            label: 'WITHDRAW',
          ),
          CustomButton(
            assetUrl: 'assets/images/airtime.png',
            color: blueColor,
            label: 'AIRTIME',
          )
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String assetUrl;
  final Color color;
  final String label;

  const CustomButton(
      {Key? key,
      required this.assetUrl,
      required this.color,
      required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            child: Image.asset(
              assetUrl,
              scale: 3,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            label,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
