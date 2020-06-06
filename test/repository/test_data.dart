import 'package:brasileirao/model/insight.dart';
import 'package:brasileirao/model/match.dart';
import 'package:brasileirao/model/score.dart';
import 'package:brasileirao/model/team.dart';

final atleticoMG = Team(
    fullName: "Atletico_mg",
    shortName: "CAM",
    shield:
        "http://s.glbimg.com/es/sde/f/equipes/2014/04/14/atletico_mg_60x60.png");
final athleticoPr = Team(
    fullName: "Athletico-PR",
    shortName: "CAP",
    shield:
        "http://s.glbimg.com/es/sde/f/equipes/2015/06/24/atletico-pr_2015_65.png");
final avai = Team(
    fullName: "Avaí",
    shortName: "AVA",
    shield: "http://s.glbimg.com/es/sde/f/equipes/2014/04/14/avai_60x60_.png");
final chapecoense = Team(
    fullName: "Chapecoense",
    shortName: "CHA",
    shield:
        "http://s.glbimg.com/es/sde/f/equipes/2015/05/06/chapecoense_60x60.png");
final corinthians = Team(
    fullName: "Corinthians",
    shortName: "COR",
    shield:
        "http://s.glbimg.com/es/sde/f/equipes/2014/04/14/corinthians_60x60.png");
final coritiba = Team(
    fullName: "Coritiba",
    shortName: "CFC",
    shield:
        "http://s.glbimg.com/es/sde/f/equipes/2014/04/14/coritiba_60x60.png");
final cruzeiro = Team(
    fullName: "Cruzeiro",
    shortName: "CRU",
    shield: "http://s.glbimg.com/es/sde/f/equipes/2015/04/29/cruzeiro_65.png");
final flamengo = Team(
    fullName: "Flamengo",
    shortName: "FLA",
    shield:
        "http://s.glbimg.com/es/sde/f/equipes/2014/04/14/flamengo_60x60.png");
final fluminense = Team(
    fullName: "Fluminense",
    shortName: "FLU",
    shield:
        "http://s.glbimg.com/es/sde/f/equipes/2015/05/05/fluminense-escudo-65x65.png");
final figueirense = Team(
    fullName: "Figueirense",
    shortName: "FIG",
    shield:
        "http://s.glbimg.com/es/sde/f/equipes/2014/04/14/figueirense_60x60.png");
final goias = Team(
    fullName: "Goias",
    shortName: "GOI",
    shield: "http://s.glbimg.com/es/sde/f/equipes/2014/04/14/goias_60x60.png");
final gremio = Team(
    fullName: "Gremio",
    shortName: "GRE",
    shield: "http://s.glbimg.com/es/sde/f/equipes/2014/04/14/gremio_60x60.png");
final internacional = Team(
    fullName: "Internacional",
    shortName: "INT",
    shield:
        "http://s.glbimg.com/es/sde/f/equipes/2014/04/14/internacional_60x60.png");
final palmeiras = Team(
    fullName: "Palmeiras",
    shortName: "PAL",
    shield:
        "http://s.glbimg.com/es/sde/f/equipes/2014/04/14/palmeiras_60x60.png");
final pontePreta = Team(
    fullName: "Ponte_preta",
    shortName: "PON",
    shield:
        "http://s.glbimg.com/es/sde/f/equipes/2014/04/14/ponte_preta_60x60.png");
final santos = Team(
    fullName: "Santos",
    shortName: "SAN",
    shield: "http://s.glbimg.com/es/sde/f/equipes/2014/04/14/santos_60x60.png");
final saoPaulo = Team(
    fullName: "Sao_paulo",
    shortName: "SAO",
    shield:
        "http://s.glbimg.com/es/sde/f/equipes/2014/04/14/sao_paulo_60x60.png");
final sport = Team(
    fullName: "Sport",
    shortName: "SPO",
    shield: "http://s.glbimg.com/es/sde/f/equipes/2014/09/15/sport_60x60.png");
final vasco = Team(
    fullName: "Vasco",
    shortName: "VAS",
    shield: "http://s.glbimg.com/es/sde/f/equipes/2014/04/14/vasco_60x60.png");

final matches = {
  1: [
    Match(
        id: "1",
        round: 1,
        home: flamengo,
        away: atleticoMG,
        score: Score(home: 3, away: 1),
        date: "2020-05-04T11:00:00"),
    Match(
        id: "2",
        round: 1,
        home: sport,
        away: internacional,
        score: null,
        date: "2020-05-08T17:00:00"),
    Match(
        id: "1",
        round: 1,
        home: gremio,
        away: fluminense,
        score: null,
        date: "2020-05-09T16:00:00"),
  ],
  2: [
    Match(
        id: "3",
        round: 2,
        home: fluminense,
        away: palmeiras,
        score: null,
        date: "2020-05-14T11:00:00"),
    Match(
        id: "4",
        round: 2,
        home: saoPaulo,
        away: corinthians,
        score: null,
        date: "2020-05-16T16:00:00"),
    Match(
        id: "5",
        round: 2,
        home: internacional,
        away: santos,
        score: null,
        date: "2020-05-16T18:00:00"),
  ]
};

final insights = {
  "1": [
    Insight(
        minutes: 25,
        seconds: 30,
        half: MatchHalf.First,
        description: "Escanteio",
        isGoal: false),
    Insight(
        minutes: 45,
        seconds: 00,
        half: MatchHalf.First,
        description: "Gooool!",
        isGoal: true),
    Insight(
        minutes: 95,
        seconds: 0,
        half: MatchHalf.Second,
        description: "Fim de jogo!",
        isGoal: false),
  ]
};
