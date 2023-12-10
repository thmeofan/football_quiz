class NewsModel {
  final String imageUrl;
  final String title;
  final String text;
  final String date;

  NewsModel({
    required this.imageUrl,
    required this.title,
    required this.text,
    required this.date,
  });
}

final news = [
  NewsModel(
      date: '05/12/2023',
      imageUrl:
          'https://assets.bwbx.io/images/users/iqjWHBFdfxIU/iRA76KLa8MBc/v1/1200x800.jpg',
      title:
          'Premier League\'s Clever Play Nets \$8.4 Billion for Football Rights',
      text:
          'In football terms, the Premier League’s sale of the rights to broadcast the top UK division’s games for four years for £6.7 billion (\$8.4 billion) is more of a 1-0 win eked out through solid strategy and disciplined execution than a jaw-dropping 5-0 display of sporting superiority. It’s a good result nonetheless.\Under the deal announced by the league Monday, Comcast Corp.’s Sky Sports will remain the dominant live broadcaster after successfully bidding for four of the five packages on offer. TNT Sports, a joint venture between Warner Bros Discovery Inc. and BT Group Plc, took the fifth. The outcome reduces the number of live broadcasters to two from three, with Amazon.com Inc. dropping out. DAZN, a streaming service backed by billionaire Len Blavatnik that had expressed ambitions to screen Premier League matches,'),
  NewsModel(
      imageUrl:
          'https://assets.goal.com/v3/assets/bltcc7a7ffd2fbf71f5/blt52a3dcd539157ed8/657101ee125eba040a7407d0/Rashford_Ten_Hag_Chelsea_GFX.jpg?auto=webp&format=pjpg&width=640&quality=60',
      title:
          'Man Utd are a better team without Marcus Rashford - and finally Erik ten Hag can see it! Winners and losers as Red Devils come out fighting without misfiring forward to leave sorry Chelsea in the dust',
      text:
          'The England star was benched at Old Trafford on Wednesday, and in his absence, the Red Devils put in an energetic displayAfter events of the past week, Erik ten Hag desperately needed a performance from his Manchester United team against Chelsea. Anything less than an improved display from Saturday\'s pathetic showing at Newcastle, and the knives would have started to sharpen for the Dutch coach.',
      date: '07/12/2023'),
  NewsModel(
      imageUrl:
          'https://i.guim.co.uk/img/media/d90ef588f25db6dc90ea5930e31f80b83269b3f8/0_170_3500_2100/master/3500.jpg?width=620&dpr=1&s=none',
      title:
          'Pep Guardiola admits Manchester City are ‘struggling a little bit’',
      text:
          'Pep Guardiola conceded Manchester City are “struggling a little bit” and insisted Aston Villa should be classed as title contenders after they inflicted defeat on his side, extending the champions’ winless run in the Premier League to four matches.Villa leapfrogged City into third in the table after a record-equalling 14th successive home win courtesy of Leon Bailey’s second-half strike. Victory hoisted Villa to within four points of the leaders Arsenal, whom Villa host on Saturday.',
      date: '06/12/2023'),
  NewsModel(
      imageUrl:
          'https://i.guim.co.uk/img/media/83d6318f0adf4335901a061fb414922d0691f158/0_80_3886_2332/master/3886.jpg?width=1140&dpr=1&s=none',
      title:
          'Ten Hag’s gamble pays off against Chelsea as McTominay steals show',
      text:
          'It was also a game that felt more chaotic than it really was. In fact the slippery, slingy nature of the play was largely by design: United hollowing out their midfield in order to throw bodies forward, Chelsea hollowing out theirs in order to leave men up for the breakaway. It was a game that hung on United’s determination to keep allowing Chelsea counterattacks, and Chelsea’s determination to keep messing them up. It was a game, above all, that hung on the curious main character energy of Scott McTominay.United fans will no doubt note the rich irony in the fact that these days McTominay is basically doing the job they once paid Paul Pogba to do. Marauding midfield engine and late-running goal threat; the all-action superhero who can chip in with 10 goals a season and pull off slide tackles that make the highlight reels. It never quite worked out for Pogba at United, largely – if you believe his most vehement critics – on account of his hair. McTominay is a different kind of player with a different kind of skillset. But for all the undoubted leadership qualities of Bruno Fernandes and Harry Maguire, tactically it is McTominay running the show right now: a development with numerous interesting consequences.',
      date: '08/12/2023'),
  NewsModel(
      imageUrl:
          'https://i.guim.co.uk/img/media/c55da435d14507ae6de542408cb00ae70c795e7c/0_269_4420_2653/master/4420.jpg?width=1140&dpr=1&s=none',
      title:
          'Dejan Kulusevski is the ideal winger for Spurs under Ange Postecoglou',
      text:
          'A number of players have been singled out for praise during Ange Postecoglou’s exciting start at the club, with Son Heung-min, James Maddison and Destiny Udogie hogging most of the limelight. Kulusevski has gone a little under the radar but he has excelled under the new manager. “I love the gameplan,” said Kulusevski after the entertaining 3-3 draw on Sunday. It’s easy to see why he is so happy. After struggling with various injuries last season and having to play under three managers who tended to restrict the team’s attacking players, Kulusevski has been instrumental in Spurs’ flying start this season. Despite a recent dip in form, the team is fifth in the table, just three points off the top four.',
      date: '09/12/2023'),
  NewsModel(
      imageUrl:
          'https://i.guim.co.uk/img/media/a2e4115c8ed73c923ab412dbf2110a3473158d8b/0_0_3169_2113/master/3169.jpg?width=620&dpr=1&s=none',
      title:
          'Dejan Kulusevski is the ideal winger for Spurs under Ange Postecoglou',
      text:
          'The gameplan last season was regimented and reactive, but Postecoglou has given his team freedom. They now rank third for shots per game (15.6), third for key passes per game (12.1) and third for successful dribbles per game (10.4) in the Premier League this season. For context, they ranked seventh for shots, seventh for key passes and 12th for successful dribbles last season.Kulusevski’s work on and off the ball make him Postecoglou’s ideal winger. Spurs ranks fourth for possession won in the attacking third (88) in the Premier League this season. Kulusevski has won back the ball 11 times in the final third – only Son (13) and Pape Matar Sarr (12) have recovered possession more. His tally of 20 tackles is the fifth in the squad and the players who have made more tackles – Pedro Porro, Yves Bissouma, Udogie and Cristian Romero – are all more defensive.',
      date: '08/12/2023'),
];
