Class {
	#name : #RTMapLocationBuilder,
	#superclass : #RTBuilder,
	#category : #'Roassal2-Builder-Map'
}

{ #category : #'as yet unclassified' }
RTMapLocationBuilder >> addPoint: geoPoint value: aValue [

	| el |
	el := self elementOn: aValue.
	el translateTo: (self translateGeoPositionToPixels: geoPoint).
	el @ RTPopup.
	view add: el
]

{ #category : #'as yet unclassified' }
RTMapLocationBuilder >> createView [
	| v |
	v := super createView.
	self renderAllCountriesIn: v.
	v @ RTDraggableView.
	^ v
]

{ #category : #'as yet unclassified' }
RTMapLocationBuilder >> example01 [

	"
	self new example01
	"
	| paris london santiago b |
	paris := 48.8567 @ 2.3508.
	london := 51.507222 @ -0.1275.
	santiago := -33.45 @ -70.666667.
	
	b := RTMapLocationBuilder new.
	b shape circle 
		size: #yourself;
		color: (Color red alpha: 0.4).
	b addPoint: paris value: 10. 
	b addPoint: london value: 15.
	b addPoint: santiago value: 20.
	b open
]

{ #category : #'as yet unclassified' }
RTMapLocationBuilder >> example02 [
	"
	self new example02
	"
	| b tab |
	tab := RTTabTable new input: self seismData usingDelimiter: $,.
	tab removeFirstRow.
	tab convertColumnsAsFloat: #(2 3 4 5).
	b := RTMapLocationBuilder new.
	b shape circle
		size: [ :v | (2 raisedTo: v) / 2 ];
		color: (Color red alpha: 0.3).
	tab values do: [ :row | b addPoint: row second @ row third value: row fifth ].
	b open
]

{ #category : #'as yet unclassified' }
RTMapLocationBuilder >> renderAllCountriesIn: aView [
	| el shape |
	RTSVGPath countries
		do: [ :name | 
			shape := RTSVGPath new path: (RTSVGPath perform: name).
			shape borderColor: Color lightGray.
			el := shape elementOn: name asString.
			el @ RTPopup.
			aView add: el ]
]

{ #category : #'as yet unclassified' }
RTMapLocationBuilder >> seismData [
	^ 'time,latitude,longitude,depth,mag,magType,nst,gap,dmin,rms,net,id,updated,place,type
2014-05-25T01:39:20.040Z,-0.7851,-14.2823,10,4.5,mb,,197,7.1,0.59,us,usb000r36t,2014-05-25T02:09:12.227Z,"North of Ascension Island",earthquake
2014-05-25T01:33:15.400Z,40.3885002,-124.987999,1.11,3.52,ml,65,253,0.5418,0.17,nc,nc72226741,2014-05-25T02:34:10.843Z,"64km WSW of Ferndale, California",earthquake
2014-05-25T01:29:34.680Z,32.5268,141.5741,41.83,4.5,mb,,137,1.594,0.64,us,usb000r36i,2014-05-25T01:58:00.878Z,"177km ESE of Hachijo-jima, Japan",earthquake
2014-05-25T00:08:01.860Z,40.0084,24.2593,10,4.5,mb,,40,1.361,1.44,us,usb000r34s,2014-05-25T00:46:22.709Z,"25km ESE of Sarti, Greece",earthquake
2014-05-24T22:02:19.000Z,67.6931,-162.4102,7.2,3.1,ml,,,,0.77,ak,ak11272548,2014-05-25T01:04:55.000Z,"27km ENE of Noatak, Alaska",earthquake
2014-05-24T20:58:07.070Z,-6.2569,104.1452,60.97,5.2,mb,,60,2.225,0.91,us,usb000r2z6,2014-05-25T01:02:08.954Z,"99km SSW of Kotaagung, Indonesia",earthquake
2014-05-24T20:41:18.800Z,38.8083,-122.7987,3.6,2.5,Md,54,21.6,0,0.04,nc,nc72226676,2014-05-25T00:29:21.707Z,"5km NW of The Geysers, California",earthquake
2014-05-24T20:10:04.000Z,63.1515,-150.4677,100,2.7,ml,,,,0.85,ak,ak11272450,2014-05-24T20:33:00.118Z,"80km WSW of Cantwell, Alaska",earthquake
2014-05-24T19:06:29.000Z,59.3773,-155.7452,100,2.7,ml,,,,3.52,ak,ak11272262,2014-05-24T19:29:44.199Z,"62km SW of Old Iliamna, Alaska",earthquake
2014-05-24T18:40:48.700Z,18.516,-64.8404,20,3,Md,7,316.8,0.19493442,0.25,pr,pr14144010,2014-05-24T19:08:10.866Z,"21km NNE of Charlotte Amalie, U.S. Virgin Islands",earthquake
2014-05-24T16:50:02.480Z,40.0003,24.3356,10,4.5,mb,,40,1.42,0.86,us,usb000r2sa,2014-05-24T22:02:25.397Z,"29km SSE of Karyes, Greece",earthquake
2014-05-24T16:26:20.000Z,19.1648,-64.612,24,3,Md,8,295.2,0.87136583,0.1,pr,pr14144009,2014-05-25T00:30:43.182Z,"82km N of Road Town, British Virgin Islands",earthquake
2014-05-24T15:08:44.100Z,18.8752,-67.3619,10,2.7,Md,7,280.8,0.46892058,0.23,pr,pr14144007,2014-05-24T23:11:10.272Z,"50km NNW of San Antonio, Puerto Rico",earthquake
2014-05-24T14:49:16.100Z,40.4133,25.9081,10,4.8,mb,,38,2.635,1.01,us,usb000r2nx,2014-05-24T19:52:52.473Z,"23km N of Gokceada, Turkey",earthquake
2014-05-24T13:46:52.300Z,18.1404,-67.287,21,2.6,Md,11,194.4,0.1940361,0.1,pr,pr14144006,2014-05-24T21:49:26.175Z,"12km NW of Puerto Real, Puerto Rico",earthquake
2014-05-24T12:37:26.000Z,18.805,-68.1386,68,3.3,Md,11,241.2,0.3701059,0.25,pr,pr14144004,2014-05-24T20:39:54.439Z,"37km NE of Punta Cana, Dominican Republic",earthquake
2014-05-24T11:49:26.320Z,0.7273,-26.3481,10,5.2,mb,,48,11.55,0.57,us,usb000r2j9,2014-05-24T21:56:34.000Z,"Central Mid-Atlantic Ridge",earthquake
2014-05-24T11:33:08.650Z,40.3041,25.6303,10,4.5,mb,,37,0.671,0.78,us,usb000r2iq,2014-05-24T18:41:22.739Z,"24km SE of Kamariotissa, Greece",earthquake
2014-05-24T11:09:29.610Z,53.6116,-164.9217,26.87,4.2,mb,,158,0.727,1.16,us,usb000r2ih,2014-05-24T19:12:10.715Z,"80km SE of Akutan, Alaska",earthquake
2014-05-24T09:25:03.410Z,40.3046,25.4532,10,6.9,mwc,,25,0.745,0.74,us,usb000r2hc,2014-05-25T01:53:19.385Z,"19km S of Kamariotissa, Greece",earthquake
2014-05-24T08:24:47.560Z,16.5405,-98.1544,12,5.6,mwb,,99,2.94,1.25,us,usb000r2gj,2014-05-24T19:32:07.996Z,"8km S of San Juan Cacahuatepec, Mexico",earthquake
2014-05-24T07:50:15.790Z,-15.2933,-71.9734,115.26,4.1,mb,,114,3.435,1.44,us,usb000r2fk,2014-05-24T15:52:57.600Z,"39km E of Orcopampa, Peru",earthquake
2014-05-24T07:27:29.910Z,30.5448,35.1641,10,4.1,mb,,186,4.666,1.11,us,usb000r2f5,2014-05-24T20:36:28.015Z,"35km ESE of Mizpe Ramon, Israel",earthquake
2014-05-24T07:01:29.000Z,67.707,-162.4206,4.3,2.8,ml,,,,0.67,ak,ak11271031,2014-05-24T15:04:39.337Z,"27km ENE of Noatak, Alaska",earthquake
2014-05-24T06:58:48.200Z,19.1189,-64.817,45,3,Md,6,291.6,0.7231438,0.18,pr,pr14144002,2014-05-24T15:01:14.731Z,"80km NNW of Road Town, British Virgin Islands",earthquake
2014-05-24T06:56:56.800Z,18.5505,-64.8421,9,2.7,Md,7,223.2,0.22457882,0.25,pr,pr14144001,2014-05-24T14:59:37.684Z,"24km NNE of Charlotte Amalie, U.S. Virgin Islands",earthquake
2014-05-24T06:47:31.450Z,-15.2899,-73.8308,70.18,5.1,mb,,127,4.398,1.02,us,usb000r2eb,2014-05-24T14:50:04.601Z,"28km S of Coracora, Peru",earthquake
2014-05-24T06:33:42.600Z,36.8057,-121.5345,6.8,2.5,Md,56,39.6,0.04491576,0.07,nc,nc72226416,2014-05-24T17:12:56.370Z,"4km S of San Juan Bautista, California",earthquake
2014-05-24T06:13:44.830Z,-33.48,179.2782,262.14,4.3,mb,,104,4.149,1.12,us,usb000r2ds,2014-05-24T14:16:24.740Z,"284km SW of LEsperance Rock, New Zealand",earthquake
2014-05-24T06:09:48.000Z,52.296,-178.95,62.1,2.8,ml,,,,0.62,ak,ak11271011,2014-05-25T00:48:43.005Z,"71km NW of Tanaga Volcano, Alaska",earthquake
2014-05-24T06:04:10.000Z,63.1787,-150.3954,100,2.7,ml,,,,0.79,ak,ak11270988,2014-05-24T14:08:32.593Z,"76km WSW of Cantwell, Alaska",earthquake
2014-05-24T06:02:23.100Z,25.9181,125.748,41.8,4.7,mb,,101,2.442,0.84,us,usb000r2di,2014-05-24T14:04:56.416Z,"132km NNE of Hirara, Japan",earthquake
2014-05-24T06:02:15.000Z,51.1827,179.4489,62.8,2.9,ml,,,,0.56,ak,ak11270986,2014-05-25T00:48:46.153Z,"86km S of Semisopochnoi Island, Alaska",earthquake
2014-05-24T05:33:14.610Z,35.1357,-97.8269,4.87,2.8,mb_lg,,61,0.369,0.63,us,usa000qd4i,2014-05-24T22:51:57.129Z,"13km NE of Chickasha, Oklahoma",earthquake
2014-05-24T04:12:22.000Z,62.1386,-148.0244,17.2,2.9,ml,,,,0.6,ak,ak11270936,2014-05-24T12:15:44.795Z,"57km NE of Sutton-Alpine, Alaska",earthquake
2014-05-24T03:44:47.700Z,36.809,-121.5383,6.9,3,Ml,66,39.6,0.02694946,0.08,nc,nc72226246,2014-05-24T21:41:30.556Z,"4km S of San Juan Bautista, California",earthquake
2014-05-24T02:39:18.500Z,19.6637,-65.9586,84,3.3,Md,3,349.2,1.38789711,0,pr,pr14144000,2014-05-24T10:42:21.090Z,"133km N of San Juan, Puerto Rico",earthquake
2014-05-23T23:41:49.670Z,45.0087,-27.8674,10,5.2,mb,,28,6.289,0.8,us,usb000r26g,2014-05-24T15:56:37.000Z,"Northern Mid-Atlantic Ridge",earthquake
2014-05-23T23:36:12.230Z,45.0429,-28.0061,10,4.6,mb,,56,6.319,1.21,us,usb000r26c,2014-05-24T07:38:53.605Z,"northern Mid-Atlantic Ridge",earthquake
2014-05-23T23:12:43.250Z,50.0625,-178.6596,31.65,4.3,mb,,206,2.029,0.93,us,usb000r254,2014-05-24T07:15:21.632Z,"137km SSE of Amatignak Island, Alaska",earthquake
2014-05-23T21:55:26.920Z,25.9394,97.6454,43.52,4.2,mb,,97,4.673,0.81,us,usb000r23p,2014-05-24T06:00:52.554Z,"66km NNE of Myitkyina, Burma",earthquake
2014-05-23T21:40:40.020Z,18.9556,145.0559,551.3,4.4,mb,,34,5.338,0.67,us,usb000r226,2014-05-24T05:43:20.921Z,"67km WNW of Agrihan, Northern Mariana Islands",earthquake
2014-05-23T21:33:04.210Z,52.3992,-178.4241,87.2,4.2,mb,,161,1.19,1.34,us,usb000r21e,2014-05-24T05:35:59.159Z,"Andreanof Islands, Aleutian Islands, Alaska",earthquake
2014-05-23T21:20:06.900Z,18.9815,145.0416,557.77,5.5,mb,,23,5.364,0.8,us,usb000r209,2014-05-24T15:56:35.000Z,"Pagan region, Northern Mariana Islands",earthquake
2014-05-23T20:51:46.000Z,59.0724,-154.5241,100,2.6,ml,,,,1.28,ak,ak11270656,2014-05-24T17:12:26.000Z,"88km SSE of Old Iliamna, Alaska",earthquake
2014-05-23T20:49:22.090Z,24.926,97.809,10,5.8,mww,,32,4.477,0.93,us,usb000r1y6,2014-05-24T17:01:05.878Z,"23km NNW of Pingyuan, China",earthquake
2014-05-23T20:25:57.060Z,-16.3105,-174.6314,219.8,4.6,mb,,55,3.646,0.91,us,usb000r1wm,2014-05-24T16:09:38.265Z,"102km WSW of Hihifo, Tonga",earthquake
2014-05-23T19:57:58.510Z,-35.7717,-73.7328,11.32,4.1,mwr,,204,1.212,1.69,us,usb000r24u,2014-05-24T15:58:42.269Z,"117km NW of Tome, Chile",earthquake
2014-05-23T19:49:54.000Z,61.6525,-149.8939,25.5,2.6,ml,,,,0.66,ak,ak11270625,2014-05-24T15:10:44.000Z,"8km WNW of Houston, Alaska",earthquake
2014-05-23T19:42:28.130Z,56.0764,113.9536,10.79,5.4,mww,,27,7.515,0.69,us,usb000r1sc,2014-05-24T15:04:30.820Z,"33km ESE of Severomuysk, Russia",earthquake
2014-05-23T18:00:54.870Z,51.4002,179.2846,73.45,4.2,mb,,204,2.557,0.97,us,usb000r1jx,2014-05-24T13:49:40.812Z,"65km SSW of Semisopochnoi Island, Alaska",earthquake
2014-05-23T15:57:13.900Z,-31.334,-69.2079,204.53,4.3,mb,,172,1.363,0.95,us,usb000r1c0,2014-05-24T00:00:37.378Z,"19km E of Calingasta, Argentina",earthquake
2014-05-23T14:14:57.580Z,32.3316667,-115.1843333,10.99,3.22,ml,9,273,0.1345,0.26,ci,ci15504753,2014-05-23T15:00:43.475Z,"2km SSE of Delta, Mexico",earthquake
2014-05-23T13:20:35.250Z,12.3077,-87.3531,73.54,4.5,mb,,155,0.497,0.79,us,usb000r13u,2014-05-23T21:24:13.415Z,"27km SW of Corinto, Nicaragua",earthquake
2014-05-23T11:55:17.820Z,-7.1962,155.091,10,4.9,mb,,45,4.17,0.59,us,usb000r12e,2014-05-24T10:21:07.760Z,"106km SSW of Panguna, Papua New Guinea",earthquake
2014-05-23T11:46:42.670Z,1.5862,121.5791,48.36,4.3,mb,,112,2.869,1.27,us,usb000r12a,2014-05-24T07:32:10.129Z,"49km NNE of Kali, Indonesia",earthquake
2014-05-23T10:01:24.500Z,18.7231,-64.3312,62,2.7,Md,3,352.8,0.69619435,0.2,pr,pr14143003,2014-05-23T18:03:57.932Z,"45km NE of Road Town, British Virgin Islands",earthquake
2014-05-23T09:54:27.800Z,38.7005,-111.7483,9.5,2.8,Ml,,61.2,0.26949459,0.25,uu,uu60069702,2014-05-23T18:00:00.139Z,"29km SSE of Aurora, Utah",earthquake
2014-05-23T09:34:00.350Z,-11.5002,161.9882,18.14,5.1,mb,,45,2.867,1.06,us,usb000r0zy,2014-05-23T17:36:33.842Z,"115km S of Kirakira, Solomon Islands",earthquake
2014-05-23T09:13:34.400Z,-11.0385,161.5021,37.43,5.3,mb,,59,2.206,1.04,us,usb000r0zd,2014-05-23T17:16:08.633Z,"79km SW of Kirakira, Solomon Islands",earthquake
2014-05-23T09:06:57.500Z,-6.9444,102.5705,29.71,5.2,mb,,82,2.595,1.08,us,usb000r0z7,2014-05-23T17:09:37.754Z,"240km SW of Biha, Indonesia",earthquake
2014-05-23T08:22:25.660Z,-7.0472,102.5498,32.55,4.8,mb,,82,2.699,0.78,us,usb000r0y9,2014-05-23T16:25:01.827Z,"250km SW of Biha, Indonesia",earthquake
2014-05-23T08:22:19.490Z,35.5245,-97.2159,7.03,2.9,mb_lg,,29,0.114,0.66,us,usb000r0y7,2014-05-24T02:58:36.381Z,"5km ENE of Choctaw, Oklahoma",earthquake
2014-05-23T07:50:21.520Z,39.5397,143.6015,35,4.5,mb,,124,2.495,1.13,us,usb000r0xs,2014-05-23T15:52:56.489Z,"142km E of Miyako, Japan",earthquake
2014-05-23T07:28:33.580Z,-6.9608,102.637,29.97,4.6,mb,,106,2.602,0.84,us,usb000r0xa,2014-05-23T15:32:04.216Z,"237km SW of Biha, Indonesia",earthquake
2014-05-23T07:17:40.200Z,19.6439,-65.2289,9,3.3,Md,14,262.8,1.31154031,0.28,pr,pr14143000,2014-05-23T15:20:22.045Z,"147km NNW of Charlotte Amalie, U.S. Virgin Islands",earthquake
2014-05-23T07:05:18.000Z,62.3372,-149.0521,8.2,3.5,ml,,,,1.02,ak,ak11270189,2014-05-23T15:07:52.947Z,"45km ENE of Y, Alaska",earthquake
2014-05-23T07:00:34.940Z,-45.561,167.3252,80.68,4.3,mb,,57,0.547,1.39,us,usb000r0wn,2014-05-23T15:03:06.044Z,"34km WSW of Te Anau, New Zealand",earthquake
2014-05-23T05:58:19.110Z,-4.5434,141.6635,67.39,4.5,mb,,166,7.285,0.92,us,usb000r0u8,2014-05-23T14:00:47.070Z,"135km WSW of Ambunti, Papua New Guinea",earthquake
2014-05-23T05:02:44.800Z,4.2808,125.5354,48.61,4.5,mb,,101,3.936,0.88,us,usb000r0sy,2014-05-23T13:05:12.870Z,"124km S of Sarangani, Philippines",earthquake
2014-05-23T04:44:15.710Z,-7.8461,123.0925,276.45,4.1,mb,,152,1.153,0.6,us,usb000r0sp,2014-05-23T12:47:15.558Z,"80km NNE of Palue, Indonesia",earthquake
2014-05-23T03:21:09.610Z,-17.6555,-178.7237,562.77,4.5,mb,,79,3.074,0.73,us,usb000r0rr,2014-05-23T11:23:50.751Z,"243km SE of Lambasa, Fiji",earthquake
2014-05-23T03:20:36.400Z,18.2031,-66.8531,26,2.5,Md,17,72,0.13564561,0.12,pr,pr14143002,2014-05-23T11:23:12.513Z,"7km NW of Adjuntas, Puerto Rico",earthquake
2014-05-23T03:01:48.660Z,-17.475,-178.6977,546.47,4.5,mb,,55,3.11,0.59,us,usb000r0ri,2014-05-23T11:04:28.818Z,"235km ESE of Lambasa, Fiji",earthquake
2014-05-23T01:35:37.900Z,40.725,-124.2628,24,2.8,Md,17,198,0.3233935,0.06,nc,nc72225856,2014-05-23T09:38:09.776Z,"6km W of Humboldt Hill, California",earthquake
2014-05-22T23:41:43.000Z,67.7074,-162.5553,22,3.7,ml,,,,1.14,ak,ak11270060,2014-05-23T07:44:28.103Z,"23km NE of Noatak, Alaska",earthquake
2014-05-22T20:47:47.000Z,18.648,-67.3984,84,2.9,Md,12,198,0.27218953,0.07,pr,pr14142008,2014-05-23T04:50:18.664Z,"35km NW of Aguadilla, Puerto Rico",earthquake
2014-05-22T20:17:26.940Z,9.193,122.242,42.9,4.7,mb,,122,6.743,0.73,us,usb000r05u,2014-05-23T03:31:25.629Z,"46km SW of Colipapa, Philippines",earthquake
2014-05-22T20:00:01.570Z,2.1686,96.5833,61.13,4.8,mb,,128,1.312,1,us,usb000r03k,2014-05-23T04:03:26.578Z,"41km SSE of Sinabang, Indonesia",earthquake
2014-05-22T18:45:57.130Z,-4.5927,133.6254,30.6,4.5,mb,,134,2.156,0.62,us,usb000qzyc,2014-05-23T02:49:56.498Z,"145km NNW of Dobo, Indonesia",earthquake
2014-05-22T18:01:21.600Z,36.761,-98.362,5,2.5,ml,,,,0.65,us,usb000qzx5,2014-05-22T19:01:15.946Z,"0km NNW of Cherokee, Oklahoma",earthquake
2014-05-22T17:57:11.800Z,19.176,-64.222,24,2.9,Md,3,338.4,1.07348676,0.1,pr,pr14142006,2014-05-23T01:59:41.134Z,"93km NNE of Road Town, British Virgin Islands",earthquake
2014-05-22T16:22:13.710Z,-11.4625,161.5948,33.02,4.9,mb,,44,2.582,0.51,us,usb000qzny,2014-05-23T20:45:15.138Z,"117km SSW of Kirakira, Solomon Islands",earthquake
2014-05-22T13:34:28.000Z,67.7042,-162.3999,5.3,2.7,ml,,,,0.59,ak,ak11269668,2014-05-22T21:37:05.376Z,"28km ENE of Noatak, Alaska",earthquake
2014-05-22T11:24:00.060Z,-16.2299,-172.656,13.57,4.8,mb,,64,3.844,1.36,us,usb000qzfb,2014-05-22T19:26:41.501Z,"121km ESE of Hihifo, Tonga",earthquake
2014-05-22T10:21:36.900Z,19.4456,-67.0309,79,2.8,Md,3,306,1.43281288,0.25,pr,pr14142005,2014-05-22T18:24:04.862Z,"104km N of Isabela, Puerto Rico",earthquake
2014-05-22T08:50:29.180Z,19.0258,121.5326,34.3,4.6,mb,,124,1.787,1.14,us,usb000qzbp,2014-05-22T16:57:28.254Z,"60km NE of Namuac, Philippines",earthquake
2014-05-22T08:38:01.060Z,-55.3955,-28.3273,35,5.5,mb,,55,4.847,0.62,us,usb000qzb9,2014-05-22T16:43:51.693Z,"161km NNW of Visokoi Island, ",earthquake
2014-05-22T08:31:11.460Z,32.203,-115.2391667,10.54,2.58,ml,9,231,0.223,0.13,ci,ci15504337,2014-05-23T15:01:52.855Z,"7km WSW of Alberto Oviedo Mota, Mexico",earthquake
2014-05-22T06:33:42.800Z,35.5797,-120.8742,4.2,2.9,Md,88,43.2,0.05389892,0.07,nc,nc72225491,2014-05-22T22:38:29.592Z,"15km WNW of Templeton, California",earthquake
2014-05-22T06:30:19.040Z,37.0807,-97.8918,7.91,2.5,mb_lg,,67,0.031,0.29,us,usb000qz8a,2014-05-22T09:20:13.152Z,"14km ESE of Anthony, Kansas",earthquake
2014-05-22T05:31:59.000Z,67.6712,-162.2512,5.5,3,ml,,,,0.65,ak,ak11269452,2014-05-22T13:34:32.564Z,"32km ENE of Noatak, Alaska",earthquake
2014-05-22T05:22:54.450Z,-11.1601,161.402,28.86,5.1,mb,,61,2.23,0.67,us,usb000qz7b,2014-05-22T14:56:33.000Z,"96km SW of Kirakira, Solomon Islands",earthquake
2014-05-22T05:22:03.660Z,35.7918,0.247,9.98,4.9,mb,,50,2.053,0.91,us,usb000qz78,2014-05-22T06:27:51.801Z,"21km SE of Mostaganem, Algeria",earthquake
2014-05-22T05:15:40.500Z,18.916,-68.088,50,2.9,Md,7,255.6,0.48688688,0.31,pr,pr14142004,2014-05-22T13:18:18.380Z,"49km NE of Punta Cana, Dominican Republic",earthquake
2014-05-22T04:17:37.900Z,18.2315,-67.97,81,3,Md,8,198,0.48059868,0.18,pr,pr14142003,2014-05-22T12:20:10.763Z,"60km SE of Punta Cana, Dominican Republic",earthquake
2014-05-22T04:01:38.800Z,19.0911,-66.7957,11,2.9,Md,9,284.4,0.66026173,0.25,pr,pr14142002,2014-05-22T12:04:08.059Z,"67km N of Hatillo, Puerto Rico",earthquake
2014-05-22T03:46:58.800Z,19.059,-66.8135,40,3,Md,10,270,0.63780385,0.28,pr,pr14142001,2014-05-22T11:49:37.402Z,"63km N of Hatillo, Puerto Rico",earthquake
2014-05-22T03:04:13.800Z,19.3343,-155.1227,7,2.6,Ml,,140.4,0.03593261,0.1,hv,hv60698741,2014-05-22T18:47:30.102Z,"16km SE of Volcano, Hawaii",earthquake
2014-05-22T02:46:10.350Z,35.7869,-97.4833,10.93,3.6,mb_lg,,70,0.025,0.28,us,usb000qz4x,2014-05-24T17:15:50.535Z,"11km SSW of Guthrie, Oklahoma",earthquake
2014-05-22T02:25:10.330Z,36.6235,-97.7089,4.92,2.7,mb_lg,,71,0.25,0.37,us,usb000qz4l,2014-05-22T10:29:48.792Z,"20km S of Medford, Oklahoma",earthquake
2014-05-22T02:06:46.900Z,45.1526,-113.6125,12.2,2.7,mc,36,100.799991936001,0.6306173,0.28,mb,mb14319042,2014-05-22T23:16:19.389Z,"22km E of Salmon, Idaho",earthquake
2014-05-22T01:47:16.000Z,37.5298,-78.0702,9.9,3.2,mblg,14,75.5999939520005,0.08084838,0.31,se,se052214a,2014-05-24T12:57:51.633Z,"12km WSW of Powhatan, Virginia",earthquake
2014-05-21T23:37:38.800Z,19.6567,-66.6453,35,3.1,Md,15,273.6,1.17769134,0.15,pr,pr14141009,2014-05-22T07:40:17.925Z,"130km N of Hatillo, Puerto Rico",earthquake
2014-05-21T22:29:59.650Z,-8.9032,-74.47,127.7,4.7,mb,,103,3.851,1.01,us,usa000qcbm,2014-05-22T00:08:03.394Z,"58km S of Pucallpa, Peru",earthquake
2014-05-21T21:42:26.500Z,18.7994,-64.4229,89,2.7,Md,3,338.4,0.67193983,0.12,pr,pr14141008,2014-05-22T05:45:04.272Z,"47km NNE of Road Town, British Virgin Islands",earthquake
2014-05-21T20:17:16.850Z,18.7082,-68.601,98.65,3.2,md,,327,0.287,0.79,us,usb000qyvb,2014-05-22T04:19:56.935Z,"9km NE of Otra Banda, Dominican Republic",earthquake
2014-05-21T18:55:46.100Z,36.0493,-120.6083,9.3,2.5,Md,102,39.6,0.01796631,0.07,nc,nc72225176,2014-05-22T04:28:08.343Z,"24km WSW of Coalinga, California",earthquake
2014-05-21T18:14:29.070Z,-2.8837,128.0056,33.55,5.3,mb,,25,3.686,0.97,us,usb000qyej,2014-05-22T02:17:00.071Z,"29km NW of Piru, Indonesia",earthquake
2014-05-21T17:58:43.760Z,37.1279,-97.6415,8.53,2.7,mb_lg,,39,0.097,0.67,us,usb000qyd1,2014-05-22T02:01:10.722Z,"11km NNW of Caldwell, Kansas",earthquake
2014-05-21T17:30:06.600Z,18.8885,-64.5375,9,2.7,Md,5,316.8,0.47520879,0.07,pr,pr14141006,2014-05-22T01:32:34.776Z,"52km N of Road Town, British Virgin Islands",earthquake
2014-05-21T16:25:11.500Z,20.1438,-155.8133,25.3,2.5,Ml,,136.8,0.03593261,0.14,hv,hv60698126,2014-05-21T20:55:01.000Z,"10km S of Kapaau, Hawaii",earthquake
2014-05-21T16:21:54.050Z,18.2013,88.0192,44.3,5.9,mww,,38,7.948,0.62,us,usb000qy82,2014-05-23T13:40:03.989Z,"274km SE of Konarka, India",earthquake
2014-05-21T15:09:06.540Z,13.9307,-92.1238,50.35,4.8,mb,,156,0.719,1.03,us,usb000qy4p,2014-05-21T23:11:45.925Z,"46km SSW of Champerico, Guatemala",earthquake
2014-05-21T14:55:30.130Z,40.3008333,-124.5136667,20.62,2.94,md,30,232,0.1767,0.12,nc,nc72225101,2014-05-22T07:59:07.101Z,"37km SW of Ferndale, California",earthquake
2014-05-21T14:47:57.880Z,36.674,70.7588,67.59,4.6,mb,,69,0.473,0.67,us,usb000qy3c,2014-05-21T22:50:30.504Z,"22km SSW of Jarm, Afghanistan",earthquake
2014-05-21T14:03:17.700Z,18.9377,-64.364,43.47,2.9,md,,330,0.577,0.32,us,usb000qymz,2014-05-21T22:06:39.130Z,"63km NNE of Road Town, British Virgin Islands",earthquake
2014-05-21T13:32:32.800Z,-15.4035,-173.7676,62.49,4.7,mb,,79,2.432,0.34,us,usb000qy1b,2014-05-21T21:35:00.184Z,"60km N of Hihifo, Tonga",earthquake
2014-05-21T13:25:20.480Z,29.5364,50.8372,10,4.4,mb,,71,6.612,0.38,us,usb000qy04,2014-05-21T21:27:49.597Z,"31km E of Bandar-e Ganaveh, Iran",earthquake
2014-05-21T12:49:54.500Z,35.5941,-97.3831,5.832,2.5,ml,,51,,0.43,us,usb000qy1t,2014-05-22T12:16:32.961Z,"7km N of Spencer, Oklahoma",earthquake
2014-05-21T10:51:27.870Z,29.6719,50.8345,10,5,mb,,61,6.705,0.8,us,usb000qxxr,2014-05-21T11:34:22.948Z,"32km ENE of Bandar-e Ganaveh, Iran",earthquake
2014-05-21T10:29:47.900Z,29.4599,50.8924,10,4.5,mb,,60,6.525,0.71,us,usb000qxxc,2014-05-21T18:32:36.869Z,"38km NW of Borazjan, Iran",earthquake
2014-05-21T10:06:14.990Z,17.1865,-94.9135,127.51,5.6,mwp,,79,2.808,1.16,us,usb000qxx2,2014-05-24T19:53:56.366Z,"16km ENE of Palomares, Mexico",earthquake
2014-05-21T09:46:28.140Z,29.5,50.8799,10,5.2,mb,,42,6.56,0.81,us,usb000qxww,2014-05-21T12:48:19.000Z,"36km ESE of Bandar-e Ganaveh, Iran",earthquake
2014-05-21T09:00:55.130Z,-30.4516,-71.3157,49.83,5.3,mb,,129,0.526,0.85,us,usb000qxwk,2014-05-21T17:38:14.000Z,"19km NW of Ovalle, Chile",earthquake
2014-05-21T08:21:56.890Z,-8.8151,125.235,28.06,4.8,mb,,45,1.336,1.22,us,usb000qxw1,2014-05-21T11:11:41.178Z,"35km WNW of Ainaro, East Timor",earthquake
2014-05-21T07:38:14.000Z,19.0967,-64.8271,10,2.8,Md,7,273.6,0.7051775,0.11,pr,pr14141002,2014-05-21T15:40:42.035Z,"78km NNW of Road Town, British Virgin Islands",earthquake
2014-05-21T05:00:47.500Z,19.6075,-67.6873,36,3.1,Md,8,316.8,1.2576414,0.23,pr,pr14141001,2014-05-21T13:03:21.007Z,"136km NNE of Punta Cana, Dominican Republic",earthquake
2014-05-21T04:57:47.700Z,19.3933,-155.2728,2.3,2.5,Ml,,39.6,0,0.26,hv,hv60697896,2014-05-21T13:00:29.756Z,"5km SW of Volcano, Hawaii",earthquake
2014-05-21T04:01:17.400Z,19.1493,-156.1947,22.5,2.6,Ml,,270,0.3233935,0.06,hv,hv60697866,2014-05-21T17:47:22.996Z,"46km WNW of Hawaiian Ocean View, Hawaii",earthquake
2014-05-21T03:54:46.390Z,40.3536667,-125.2483333,3.45,2.75,md,23,300,0.706,0.3,nc,nc72224881,2014-05-22T09:10:09.946Z,"87km WSW of Ferndale, California",earthquake
2014-05-21T01:58:48.130Z,19.4705,-70.6703,26.7,3.3,ml,,112,0.069,1.32,us,usb000qxv9,2014-05-21T06:42:37.264Z,"3km NE of Santiago de los Caballeros, Dominican Republic",earthquake
2014-05-21T01:48:46.000Z,58.0839,-152.8139,66.4,3.4,ml,,,,0.56,ak,ak11267570,2014-05-21T09:51:19.349Z,"37km NNW of Kodiak Station, Alaska",earthquake
2014-05-21T01:28:25.620Z,-57.8441,-25.9645,105.36,5.1,mb,,48,6.886,0.77,us,usb000qxqm,2014-05-21T09:30:52.695Z,"136km NNE of Bristol Island, South Sandwich Islands",earthquake
2014-05-21T00:40:26.220Z,-7.7614,104.6756,51.4,4.5,mb,,113,3.118,0.59,us,usb000qxp9,2014-05-21T08:42:56.403Z,"148km SW of Tugu Hilir, Indonesia",earthquake
2014-05-21T00:21:13.290Z,23.7323,121.471,11.69,5.6,mb,,22,0.374,1.26,us,usb000qxnd,2014-05-22T08:22:19.943Z,"30km SSW of Hualian, Taiwan",earthquake
2014-05-21T00:09:22.700Z,18.8878,-64.4449,39,3.3,Md,8,302.4,0.49587004,0.31,pr,pr14141000,2014-05-21T01:43:34.371Z,"55km NNE of Road Town, British Virgin Islands",earthquake
2014-05-20T23:59:58.700Z,18.9584,-64.5391,38,2.7,Md,5,331.2,0.71955054,0.05,pr,pr14140010,2014-05-21T08:02:28.050Z,"60km N of Road Town, British Virgin Islands",earthquake
2014-05-20T23:30:46.550Z,39.5224,24.1875,17.18,4.4,mb,,46,1.429,0.97,us,usb000qxle,2014-05-21T04:45:19.604Z,"49km NNE of Patitirion, Greece",earthquake
2014-05-20T23:25:02.660Z,-56.867,-24.8899,41.89,4.6,mb,,79,7.066,0.6,us,usb000qxm0,2014-05-21T07:27:39.160Z,"142km E of Visokoi Island, ",earthquake
2014-05-20T21:57:47.000Z,63.3716,-149.0106,97.2,3,ml,,,,0.62,ak,ak11267442,2014-05-21T06:00:23.312Z,"3km SW of Cantwell, Alaska",earthquake
2014-05-20T21:43:14.000Z,60.2706,-151.8511,55.7,2.7,ml,,,,0.63,ak,ak11267433,2014-05-21T05:46:16.819Z,"32km WSW of Cohoe, Alaska",earthquake
2014-05-20T21:19:07.730Z,17.6225,-94.3974,167.13,4.8,mb,,152,2.541,1.11,us,usb000qxe7,2014-05-21T11:02:11.186Z,"30km SE of Hidalgotitlan, Mexico",earthquake
2014-05-20T21:11:16.390Z,-17.8122,-69.3731,152,4.5,mb,,69,0.535,1.13,us,usb000qxe5,2014-05-21T05:13:55.873Z,"47km NNE of Putre, Chile",earthquake
2014-05-20T21:10:07.100Z,35.4931,-97.2362,7.42,2.6,ml,,71,,0.55,us,usb000qxgq,2014-05-21T02:34:06.401Z,"3km E of Choctaw, Oklahoma",earthquake
2014-05-20T21:07:08.940Z,19.0543,-69.6393,80.99,3.9,ml,,81,0.36,0.72,us,usb000qxcr,2014-05-21T06:21:59.665Z,"16km NE of Gonzalo, Dominican Republic",earthquake
2014-05-20T20:16:15.700Z,-19.1832,-177.4709,575.46,4.6,mb,,88,4.482,0.78,us,usb000qx8p,2014-05-21T15:14:06.902Z,"207km NE of Ndoi Island, Fiji",earthquake
2014-05-20T20:05:08.930Z,-68.7324,170.6679,15.7,5,mb,,43,9.177,0.82,us,usb000qx7z,2014-05-21T14:40:54.291Z,"Balleny Islands region",earthquake
2014-05-20T17:29:41.000Z,60.0743,-152.6402,99.8,2.9,ml,,,,0.67,ak,ak11267355,2014-05-21T13:55:55.000Z,"46km SSE of Redoubt Volcano, Alaska",earthquake
2014-05-20T17:16:30.900Z,19.1998,-66.8133,17,2.8,Md,13,234,0.76716125,0.28,pr,pr14140008,2014-05-21T13:27:40.000Z,"78km N of Hatillo, Puerto Rico",earthquake
2014-05-20T15:48:33.900Z,-57.143,-25.5071,53.4,5,mb,,115,6.833,0.74,us,usb000qwmp,2014-05-20T23:51:00.880Z,"114km ESE of Visokoi Island, ",earthquake
2014-05-20T15:05:25.860Z,-4.2728,122.848,13.49,4.5,mb,,55,3.172,0.85,us,usb000qwkd,2014-05-20T23:08:02.271Z,"53km SE of Kendari, Indonesia",earthquake
2014-05-20T13:59:28.200Z,35.4984,-97.2409,6.884,3.1,ml,,70,,0.64,us,usb000qwfv,2014-05-20T22:18:57.642Z,"2km E of Choctaw, Oklahoma",earthquake
2014-05-20T13:24:37.800Z,19.1669,-66.7703,40,2.8,Md,12,255.6,0.7231438,0.23,pr,pr14140005,2014-05-20T21:27:08.251Z,"75km N of Hatillo, Puerto Rico",earthquake
2014-05-20T13:15:34.400Z,19.0639,-66.7553,15,3.2,Md,21,216,0.62073586,0.43,pr,pr14140004,2014-05-20T21:18:07.128Z,"64km N of Hatillo, Puerto Rico",earthquake
2014-05-20T12:54:46.500Z,18.7991,-64.2505,20,2.8,Md,12,320.4,0.51383634,0.2,pr,pr14140003,2014-05-20T20:57:22.105Z,"57km NE of Road Town, British Virgin Islands",earthquake
2014-05-20T10:32:19.200Z,19.1576,-66.8356,28,2.9,Md,14,277.2,0.73302527,0.34,pr,pr14140001,2014-05-20T18:34:52.600Z,"74km N of Hatillo, Puerto Rico",earthquake
2014-05-20T07:59:47.000Z,63.1923,-150.3887,100,2.9,ml,,,,0.92,ak,ak11267040,2014-05-20T16:02:47.768Z,"75km WSW of Cantwell, Alaska",earthquake
2014-05-20T07:39:34.560Z,-20.1896,-177.6313,511.44,4.4,mb,,96,4.753,0.81,us,usb000qw4w,2014-05-20T15:42:01.870Z,"122km ENE of Ndoi Island, Fiji",earthquake
2014-05-20T07:30:19.580Z,35.5261,-97.2197,8.15,3.6,mb_lg,,32,0.11,0.43,us,usb000qw49,2014-05-21T05:24:25.111Z,"5km NE of Choctaw, Oklahoma",earthquake
2014-05-20T05:42:38.600Z,35.4815,-97.2476,7.552,3.3,ml,,107,,0.7,us,usb000qwiq,2014-05-21T16:26:22.315Z,"2km SE of Choctaw, Oklahoma",earthquake
2014-05-20T05:39:49.200Z,35.4842,-97.2451,7.595,2.7,ml,,106,,0.57,us,usb000qw2d,2014-05-21T06:03:20.376Z,"2km SE of Choctaw, Oklahoma",earthquake
2014-05-20T04:43:26.740Z,40.9129,19.8857,10,4.5,mb,,62,0.434,0.82,us,usb000qw19,2014-05-20T05:01:15.030Z,"12km NNW of Kucove, Albania",earthquake
2014-05-20T03:58:32.310Z,35.4727,-97.2715,7.03,3,mb_lg,,41,0.121,0.49,us,usb000qw05,2014-05-21T06:02:55.117Z,"2km S of Choctaw, Oklahoma",earthquake
2014-05-20T02:30:07.000Z,67.7078,-162.391,4,3.1,ml,,,,0.73,ak,ak11266747,2014-05-20T10:32:38.882Z,"28km ENE of Noatak, Alaska",earthquake
2014-05-20T02:20:47.000Z,60.7278,-149.4964,18.9,2.5,ml,,,,0.77,ak,ak11266736,2014-05-20T10:23:21.101Z,"44km W of Whittier, Alaska",earthquake
2014-05-20T02:00:30.000Z,59.9031,-152.968,100,2.5,ml,,,,1.06,ak,ak11266725,2014-05-20T10:03:01.602Z,"65km WNW of Anchor Point, Alaska",earthquake
2014-05-20T01:39:14.490Z,18.1568,-99.9519,62.74,4.9,mb,,126,1.378,1.01,us,usb000qvxw,2014-05-21T01:01:23.262Z,"9km W of Apaxtla de Castrejon, Mexico",earthquake
2014-05-19T22:47:21.120Z,-57.085,-25.3856,62.81,5.4,mb,,69,6.876,1.37,us,usb000qvt4,2014-05-20T21:40:26.000Z,"118km ESE of Visokoi Island, ",earthquake
2014-05-19T22:41:10.740Z,34.1605,-116.4348333,11.78,2.79,ml,86,20,0.04346,0.12,ci,ci15503417,2014-05-20T18:00:50.776Z,"5km N of Yucca Valley, California",earthquake
2014-05-19T21:50:28.900Z,17.5643,-67.9606,68,3.2,Md,8,309.6,0.92167148,0.2,pr,pr14139008,2014-05-20T05:53:05.055Z,"93km WSW of Pole Ojea, Puerto Rico",earthquake
2014-05-19T20:33:47.500Z,19.4135,-155.3153,5.1,2.5,Ml,,79.2,0.01796631,0.09,hv,hv60697006,2014-05-21T22:40:11.000Z,"8km WSW of Volcano, Hawaii",earthquake
2014-05-19T20:08:51.620Z,34.2533333,-116.8248333,7.53,3.84,ml,112,18,0.04125,0.15,ci,ci15503377,2014-05-21T22:58:40.000Z,"2km ESE of Big Bear City, California",earthquake
2014-05-19T20:01:15.000Z,63.3536,-145.0138,2.2,3.2,ml,,,,0.96,ak,ak11266575,2014-05-24T00:17:42.940Z,"58km S of Deltana, Alaska",earthquake
2014-05-19T19:33:05.610Z,12.7759,-89.5982,63.54,4.6,mb,,206,0.973,0.36,us,usb000qvc1,2014-05-21T23:24:38.243Z,"84km SSW of La Libertad, El Salvador",earthquake
2014-05-19T19:27:22.420Z,15.3598,-91.3355,22.06,4.7,mb,,74,0.167,0.99,us,usb000qvbi,2014-05-22T15:27:13.531Z,"3km NW of Aguacatan, Guatemala",earthquake
2014-05-19T18:50:54.680Z,52.803,159.4736,72.5,4.6,mb,,161,0.545,0.79,us,usb000qv82,2014-05-22T15:48:08.144Z,"61km ESE of Petropavlovsk-Kamchatskiy, Russia",earthquake
2014-05-19T18:21:04.470Z,-49.4572,126.0391,10,4.8,mb,,127,16.1,1.61,us,usb000qv5e,2014-05-22T15:59:32.395Z,"Western Indian-Antarctic Ridge",earthquake
2014-05-19T18:20:53.000Z,60.2515,-150.7875,58.6,2.7,ml,,,,0.71,ak,ak11266564,2014-05-24T00:18:12.121Z,"30km SSE of Soldotna, Alaska",earthquake
2014-05-19T18:07:30.500Z,35.774,-97.487,7.6,2.5,ml,,,,0.26,us,usb000qvlt,2014-05-22T18:52:12.227Z,"12km SSW of Guthrie, Oklahoma",earthquake
2014-05-19T16:58:31.000Z,19.1837,-66.4172,8,2.8,Md,9,295.2,0.70966907,0.2,pr,pr14139005,2014-05-20T01:01:01.906Z,"79km N of Brenas, Puerto Rico",earthquake
2014-05-19T15:50:32.100Z,19.3878,-155.2787,2.8,2.7,Ml,,43.2,0,0.23,hv,hv60696836,2014-05-19T23:54:59.471Z,"6km SW of Volcano, Hawaii",earthquake
2014-05-19T15:26:52.000Z,51.334,-172.1642,25.3,2.6,ml,,,,0.43,ak,ak11266416,2014-05-24T00:15:57.166Z,"Andreanof Islands, Aleutian Islands, Alaska",earthquake
2014-05-19T15:26:22.000Z,53.9488,-164.7404,46.4,2.7,ml,,,,0.38,ak,ak11266414,2014-05-24T00:15:07.755Z,"Unimak Island region, Alaska",earthquake
2014-05-19T14:16:47.520Z,-35.3854,-175.5756,10,4.6,mb,,167,8.338,0.69,us,usb000qupk,2014-05-19T22:19:20.729Z,"East of the North Island of New Zealand",earthquake
2014-05-19T13:53:11.000Z,52.1779,-172.8898,74.8,3.6,ml,,,,0.64,ak,ak11266404,2014-05-24T00:17:19.542Z,"89km E of Atka, Alaska",earthquake
2014-05-19T13:12:15.190Z,30.042,140.3414,137.13,4.7,mb,,98,3.096,0.62,us,usb000qumd,2014-05-19T21:14:53.159Z,"Izu Islands, Japan region",earthquake
2014-05-19T12:02:30.390Z,41.0504,142.0779,74.74,4.5,mb,,137,1.259,0.54,us,usb000qula,2014-05-19T21:18:57.829Z,"72km NE of Misawa, Japan",earthquake
2014-05-19T10:05:27.600Z,18.2443,-67.9937,96,3.3,Md,8,198,0.45544585,0.5,pr,pr14139002,2014-05-19T18:07:57.065Z,"57km SE of Punta Cana, Dominican Republic",earthquake
2014-05-19T10:05:27.400Z,18.236,-68.0008,98,3.4,Md,8,201.6,0.45364922,0.52,pr,pr14139004,2014-05-19T18:08:00.713Z,"57km SE of Punta Cana, Dominican Republic",earthquake
2014-05-19T09:29:47.300Z,-32.0422,57.0823,10,4.7,mb,,61,15.712,0.81,us,usb000quh2,2014-05-19T17:32:14.515Z,"Southwest Indian Ridge",earthquake
2014-05-19T09:28:44.000Z,63.4532,-152.7059,16.3,2.6,ml,,,,0.74,ak,ak11266263,2014-05-24T00:18:57.601Z,"155km ENE of McGrath, Alaska",earthquake
2014-05-19T08:53:12.480Z,-21.1469,-178.4064,455.48,4.3,mb,,103,4.755,1.26,us,usb000qug1,2014-05-19T16:55:39.208Z,"62km SSE of Ndoi Island, Fiji",earthquake
2014-05-19T06:29:08.620Z,36.137,-97.1345,4.26,3,ml,,55,0.427,0.95,us,usb000qud6,2014-05-21T05:12:26.360Z,"7km WNW of Stillwater, Oklahoma",earthquake
2014-05-19T05:28:48.880Z,26.4569,142.3864,34.17,4.7,mb,,102,7.001,0.6,us,usb000quch,2014-05-19T13:31:27.214Z,"71km SSE of Chichi-shima, Japan",earthquake
2014-05-19T05:06:02.000Z,19.4701,-65.3677,74,3,Md,4,316.8,1.15882672,0.21,pr,pr14139001,2014-05-19T13:08:42.669Z,"125km NNE of Vieques, Puerto Rico",earthquake
2014-05-19T04:16:03.840Z,36.1213,-97.4487,3.78,3.1,mb_lg,,67,0.324,0.32,us,usb000quau,2014-05-19T18:58:06.373Z,"22km NE of Crescent, Oklahoma",earthquake
2014-05-19T03:56:47.530Z,-57.0825,-25.0162,35,5,mb,,69,7.065,1.07,us,usb000quai,2014-05-19T13:56:36.000Z,"139km ESE of Visokoi Island, ",earthquake
2014-05-19T03:51:05.890Z,-19.2711,-177.6298,557.16,4.4,mb,,129,4.368,1.05,us,usb000quad,2014-05-19T11:53:40.238Z,"189km NE of Ndoi Island, Fiji",earthquake
2014-05-19T02:43:26.410Z,-5.5361,146.4665,126.73,4.7,mb,,68,3.904,1.02,us,usb000qu9b,2014-05-19T10:46:04.073Z,"81km ESE of Madang, Papua New Guinea",earthquake
2014-05-19T02:39:21.700Z,32.9404,-100.8942,5,2.7,mb_lg,,97,1.1,0.64,us,usb000qu93,2014-05-19T10:41:52.959Z,"24km N of Snyder, Texas",earthquake
2014-05-19T01:53:56.990Z,-4.6699,-105.4588,10,5.2,ms_20,,149,15.665,0.73,us,usb000qu81,2014-05-19T13:56:34.000Z,"Central East Pacific Rise",earthquake
2014-05-19T01:37:23.380Z,36.1014,-97.0333,1.03,3,mb_lg,,45,0.438,0.53,us,usb000qu7c,2014-05-20T02:53:06.533Z,"2km SE of Stillwater, Oklahoma",earthquake
2014-05-19T01:08:41.700Z,17.9757,-65.4048,13,2.5,Md,9,158.4,0.18505295,0.2,pr,pr14139000,2014-05-19T09:11:17.082Z,"15km SSE of Esperanza, Puerto Rico",earthquake
2014-05-19T00:59:19.980Z,40.9774,19.8788,10,5.1,mb,,33,0.369,1,us,usb000qu5r,2014-05-20T02:52:43.228Z,"10km SW of Cerrik, Albania",earthquake
2014-05-18T23:47:04.600Z,-4.385,-105.8958,10,5.3,mb,,106,16.022,0.84,us,usb000qu45,2014-05-20T23:09:41.000Z,"Central East Pacific Rise",earthquake
2014-05-18T21:16:45.610Z,-19.1194,169.6317,271.23,4.9,mb,,88,4.188,0.84,us,usb000qty5,2014-05-19T05:19:17.085Z,"61km NE of Isangel, Vanuatu",earthquake
2014-05-18T19:09:14.150Z,-17.6915,-174.8876,265.23,4.7,mb,,98,4.806,0.86,us,usb000qtt2,2014-05-19T03:11:53.647Z,"142km NW of Neiafu, Tonga",earthquake
2014-05-18T18:53:47.570Z,36.5811,-97.815,3.44,3,mb_lg,,81,0.835,0.79,us,usb000qts5,2014-05-19T18:54:34.572Z,"21km NNE of Enid, Oklahoma",earthquake
2014-05-18T16:46:38.000Z,67.71,-162.3479,22.4,2.8,ml,,,,0.98,ak,ak11265635,2014-05-19T03:48:44.573Z,"30km ENE of Noatak, Alaska",earthquake
2014-05-18T15:57:03.000Z,60.8224,-151.6884,73.1,3.2,ml,,,,0.87,ak,ak11265561,2014-05-18T23:59:37.589Z,"26km NW of Nikiski, Alaska",earthquake
2014-05-18T15:22:12.960Z,-18.2831,-178.2533,634.25,4.9,mb,,39,3.555,0.67,us,usb000qtji,2014-05-18T23:25:28.203Z,"266km N of Ndoi Island, Fiji",earthquake
2014-05-18T14:31:20.000Z,51.9618,-171.5207,27.8,2.9,ml,,,,0.5,ak,ak11265539,2014-05-18T22:34:02.104Z,"61km SSW of Amukta Island, Alaska",earthquake
2014-05-18T13:59:36.000Z,36.0925,-97.068,4.371,2.5,ml,,71,,0.44,us,usb000qti1,2014-05-20T02:52:20.065Z,"2km SSW of Stillwater, Oklahoma",earthquake
2014-05-18T13:09:18.100Z,18.4353,-66.3097,125,3,Md,16,169.2,0.21290072,0.2,pr,pr14138003,2014-05-18T21:11:51.717Z,"1km SSW of San Antonio, Puerto Rico",earthquake
2014-05-18T12:08:06.800Z,34.9249,26.0714,10,4.3,mb,,144,1.034,1.1,us,usb000qtfv,2014-05-20T02:51:59.491Z,"16km SE of Makry Gialos, Greece",earthquake
2014-05-18T12:00:29.500Z,13.6955,-92.0638,35,4.2,mb,,192,0.895,1.3,us,usb000qtfl,2014-05-18T20:03:09.819Z,"68km SSW of Champerico, Guatemala",earthquake
2014-05-18T11:57:53.140Z,-57.0358,-24.9233,48.93,4.7,mb,,115,7.099,0.89,us,usb000qtfn,2014-05-18T20:00:24.907Z,"143km ESE of Visokoi Island, ",earthquake
2014-05-18T10:59:21.840Z,3.1118,93.7744,10,5.1,mb,,130,3.799,1.24,us,usb000qteu,2014-05-18T19:01:58.438Z,"285km WSW of Meulaboh, Indonesia",earthquake
2014-05-18T08:50:47.900Z,19.0428,-67.1958,12,2.8,Md,7,302.4,0.57761673,0.05,pr,pr14138001,2014-05-18T16:53:18.734Z,"61km N of San Antonio, Puerto Rico",earthquake
2014-05-18T08:29:26.020Z,35.8416,-96.9292,3.64,3,mb_lg,,56,0.299,0.45,us,usb000qtc7,2014-05-20T02:51:36.678Z,"16km NNW of Chandler, Oklahoma",earthquake
2014-05-18T07:48:16.000Z,55.2714,-163.2957,86.8,3,ml,,,,0.91,ak,ak11265355,2014-05-18T17:40:36.203Z,"37km WNW of Cold Bay, Alaska",earthquake
2014-05-18T06:38:48.980Z,-14.7235,-176.1437,78.63,4.9,mb,,78,6.332,0.65,us,usb000qt9y,2014-05-18T17:56:33.000Z,"159km S of Mata-Utu, Wallis and Futuna",earthquake
2014-05-18T06:29:51.500Z,18.6895,-66.8884,24,2.9,Md,14,234,0.3054272,0.18,pr,pr14138000,2014-05-18T14:32:49.259Z,"23km NNW of Hatillo, Puerto Rico",earthquake
2014-05-18T04:47:09.810Z,32.9253,-100.8292,5,2.5,mb_lg,,94,1.043,0.76,us,usb000qt87,2014-05-18T12:49:41.938Z,"24km NNE of Snyder, Texas",earthquake
2014-05-18T04:35:39.000Z,51.8092,-173.4377,15.8,2.5,ml,,,,0.57,ak,ak11265270,2014-05-18T12:38:50.952Z,"67km SE of Atka, Alaska",earthquake
2014-05-18T04:19:21.160Z,-21.3071,169.7352,89.33,5.3,mb,,50,3.154,0.8,us,usb000qt7u,2014-05-18T16:56:36.000Z,"193km E of Tadine, New Caledonia",earthquake
2014-05-18T04:04:56.270Z,-18.7257,-177.7427,425.25,4.4,mb,,79,4.113,0.75,us,usb000qt7n,2014-05-18T12:07:28.734Z,"235km NNE of Ndoi Island, Fiji",earthquake
2014-05-18T03:56:34.490Z,24.4223,141.7353,113.15,4.7,mb,,99,8.823,0.95,us,usb000qt7b,2014-05-18T11:59:06.727Z,"57km SE of Iwo Jima, Japan",earthquake
2014-05-18T03:27:39.600Z,51.218,178.7704,66.81,4.3,mb,,90,2.914,1.21,us,usb000qt6z,2014-05-18T11:30:20.341Z,"83km SSE of Little Sitkin Island, Alaska",earthquake
2014-05-18T03:24:49.100Z,36.1187,-97.2501,5,2.5,mb_lg,,43,0.361,0.61,us,usb000qt6n,2014-05-20T02:51:14.105Z,"17km W of Stillwater, Oklahoma",earthquake
2014-05-18T02:46:10.380Z,-14.9248,-174.847,10,4.7,mb,,173,3.14,1.33,us,usb000qt6i,2014-05-18T10:48:47.161Z,"163km NW of Hihifo, Tonga",earthquake'
]

{ #category : #'as yet unclassified' }
RTMapLocationBuilder >> translateGeoPositionToPixels: point [
	"From https://github.com/thebyrd/world-news"
	
	| longitud latitud xFactor xoffset yFactor yoffset |
	latitud := point x.
	longitud := point y.
	
	xFactor := 2.6938.
	xoffset := 465.4.
	
	yFactor := -2.6938.
	yoffset := 227.066.
	^ ((longitud * xFactor) + xoffset) @ ((latitud * yFactor) + yoffset)
]