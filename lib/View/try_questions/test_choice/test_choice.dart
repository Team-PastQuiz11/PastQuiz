import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:past_questions/View/try_questions/test_choice/result.dart';

class TestChoiceScreen extends StatefulWidget {
  const TestChoiceScreen({super.key});

  @override
  State<TestChoiceScreen> createState() => _TestChoiceScreenState();
}

class _TestChoiceScreenState extends State<TestChoiceScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  static const List<Tab> myTabs = <Tab>[
    Tab(text: '中断'),
    Tab(text: '通常'),
    Tab(text: '回答率'),
    Tab(text: '後で見る'),
    Tab(text: 'PASS'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("過去問を解く"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                //
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TitleFrame('年度'),
                    AllChoinceFrame(),
                  ],
                ),
                YearQuestionFrame(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: YearQuestionFrame(height: 30),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          //
          Divider(height: 5),
          Expanded(
            child: Column(
              children: [
                //
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TitleFrame('カテゴリ'),
                    AllChoinceFrame(),
                  ],
                ),
                YearQuestionFrame(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: YearQuestionFrame(height: 30),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          //
          Expanded(
            child: DefaultTabController(
              length: myTabs.length,
              child: Container(
                color: Colors.amber,
                child: Column(
                  children: [
                    SizedBox(
                      height: 25,
                      child: TabBar(
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.label,
                        // indicatorWeight: 20,

                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.greenAccent,
                        ),
                        labelColor: Colors.blue,
                        unselectedLabelColor: Colors.black,
                        controller: _tabController,
                        tabs: myTabs,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          BottomScreenFrame(
                            questionPattern: QuestionPattern.savedata,
                          ),
                          BottomScreenFrame(
                            questionPattern: QuestionPattern.nomal,
                          ),
                          BottomScreenFrame(
                            questionPattern: QuestionPattern.correct_per,
                          ),
                          BottomScreenFrame(
                            questionPattern: QuestionPattern.after_pass,
                          ),
                          BottomScreenFrame(
                            questionPattern: QuestionPattern.unCorrect_q,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class YearQuestionFrame extends StatefulWidget {
  const YearQuestionFrame({required this.height, super.key});
  final double height;

  @override
  State<YearQuestionFrame> createState() => _YearQuestionFrameState();
}

class _YearQuestionFrameState extends State<YearQuestionFrame> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        color: Colors.lightBlue.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 10),
          Expanded(flex: 3, child: Text("2019")),
          Expanded(flex: 1, child: Text("4")),
          Expanded(flex: 1, child: Text("1")),
          Expanded(
            flex: 1,
            child: RichText(
              text: TextSpan(
                text: '15 ',
                style: DefaultTextStyle.of(context).style,
                children: const <TextSpan>[
                  TextSpan(text: '%', style: TextStyle(fontSize: 10)),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: RichText(
              text: TextSpan(
                text: '15 ',
                style: DefaultTextStyle.of(context).style,
                children: const <TextSpan>[
                  TextSpan(text: '%', style: TextStyle(fontSize: 10)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget TitleFrame(String name) {
  return Container(
    width: 150,
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Center(
      child: Text(
        name,
        style: TextStyle(color: Colors.white, fontSize: 15),
      ),
    ),
  );
}

Widget AllChoinceFrame() {
  return Container(
    width: 150,
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Center(
      child: Text(
        "すべて選択",
        style: TextStyle(color: Colors.white, fontSize: 15),
      ),
    ),
  );
}

class BottomScreenFrame extends StatefulWidget {
  const BottomScreenFrame({required this.questionPattern, super.key});

  final QuestionPattern questionPattern;

  @override
  State<BottomScreenFrame> createState() => _BottomScreenFrameState();
}

class _BottomScreenFrameState extends State<BottomScreenFrame> {
  final TextEditingController qustion_amount = TextEditingController();
  RangeValues _currentRangeValues = const RangeValues(0, 80);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        (widget.questionPattern == QuestionPattern.savedata)
            ? ElevatedButton(
                onPressed: () {},
                child: Text("前回のデータの続きから"),
              )
            : Container(),
        (widget.questionPattern == QuestionPattern.correct_per)
            ? Column(
                children: [
                  Text(
                      "${_currentRangeValues.start.toStringAsFixed(0)}% - ${_currentRangeValues.end.toStringAsFixed(0)}%"),
                  RangeSlider(
                    max: 100.0,
                    divisions: 20,
                    labels: RangeLabels(
                      _currentRangeValues.start.round().toString(),
                      _currentRangeValues.end.round().toString(),
                    ),
                    values: _currentRangeValues,
                    onChanged: (RangeValues values) {
                      setState(() {
                        _currentRangeValues = values;
                      });
                    },
                  ),
                ],
              )
            : Container(),
        (widget.questionPattern != QuestionPattern.savedata)
            ? Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      child: ElevatedButton(
                        child: Text("選択した問題をすべて解く"),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        color: Colors.blue,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                color: Colors.white,
                                child: TextFormField(
                                  controller: qustion_amount,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ),
                            Text('/??問をランダムで解く'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Container(),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResultScreen()),
              );
            },
            child: Text("解答を開始する"))
      ],
    );
  }
}
