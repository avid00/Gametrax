import 'dart:async';

Map data = {};

//for game search
bool searching = false;
String gamenamesearch;
int resplength;
List respgamename = [];
List nameList = [];
List imageList = [];
List dateList = [];
List genreList= [];
List platformList=[];
int namelength;
var index = 0;
String gameinfo1;


//homepage (for news)------------------------------------------------------------------------------------------------------
String newsData;
String newsURL;
String newsImage;
String newsDate;
List newstitlelist = [];
List newsurllist = [];
List newsimagelist = [];
List newsdatelist = [];

//for time
var date = DateTime.now();
String time;
Timer timer;
//Lists------------------------------------------------------------------------------------------------------------------------------------
String gameNameFromFirestore;
String gameImageFromFirestore;

//popular game show page----------------------------------------------------------------------------------------------------------------------
List popularimagelist = [];
List popularnamelist = [];
List populardatelist =[];
List populargenrelist=[];
String popularGameName;
String popularGameDate;
String popularGameGenre;
String popularGameImage;