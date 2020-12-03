# Input: height = [1,8,6,2,5,4,8,3,7]
# Output: 49
# Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.
=begin
  

[1,8,6,2,5,4,8,3,7]
   b
    e

two pointers, one on either end

max area 

=end
require 'pry'

def max_area(heights)
  first = 0
  last = heights.length - 1
  max = area(heights, first, last)
  while last > first
    if heights[first] > heights[last]
      last -= 1
    else
      first += 1
    end
    # binding.pry
    area = area(heights, first, last)
    max = area if area > max
  end

  max
end

def area(heights, first, last)
  (last - first) * [heights[first], heights[last]].min
end

p max_area([1,8,6,2,5,4,8,3,7]) == 49
p max_area([4,3,2,1,4]) == 16
p max_area([1, 1]) == 1
p max_area([1,2,1]) == 2
p max_area([2,3,4,5,18,17,6]) == 17

heights = [1454,2249,4922,5151,7349,1022,8655,8124,2157,2303,5213,3217,4372,4073,1152,2494,4259,8331,7822,7899,5989,8859,8155,2390,2616,368,9960,4007,2016,9526,8767,9822,1775,3689,4974,5476,1063,3629,9952,3220,2284,1518,2789,6656,5591,3942,9151,9851,8625,6973,4102,4614,2184,8609,3356,4800,8977,9668,5159,7346,9194,3926,7168,7321,3967,2142,9149,1383,2123,9102,4603,4407,620,3745,1064,2563,4039,215,8766,2664,3540,2869,7279,5725,7830,6987,6877,3160,6656,2037,506,2202,2315,7674,5876,2635,9817,5025,4018,8292,479,4973,2700,7451,8718,116,15,2757,6683,8781,1774,6575,8002,5405,2300,5833,2392,5530,8993,9048,3919,9499,1251,6234,3525,3479,8869,3342,8504,2887,7987,5336,7861,7039,2787,2931,7155,2802,2041,190,7936,3815,6765,5938,9220,5418,8123,1612,948,3468,7013,4867,9319,8264,1101,2845,8095,6323,2539,6599,5562,526,8287,9775,7565,1075,2707,1072,229,4748,1262,8165,8563,8028,456,4135,3446,8579,5747,4394,2048,2760,9261,1367,7376,6714,564,5471,9389,3104,8423,4952,3630,6710,4727,7548,7785,3786,8620,4367,8534,9883,2532,3449,7911,9340,7584,7709,7920,9684,2103,6320,2444,7716,4039,6173,782,4604,1644,172,7708,67,1476,7690,3130,6203,5238,915,9990,3859,5282,4876,94,4167,8326,4357,3507,2262,2066,7779,1946,521,451,743,4589,4491,6916,5371,5447,4912,1895,9507,4980,3371,7197,4462,9575,2436,1729,5917,2647,3364,793,2741,7531,5471,7098,7390,4086,5516,1522,2384,6037,1973,3127,626,2816,6395,5997,8263,1308,4245,7770,2640,7616,1320,7102,3543,108,8831,9460,2755,2195,6606,1848,6078,8429,5298,9821,2515,814,1343,4900,6851,3316,4379,7477,6133,775,9826,748,8435,4071,4871,1075,8040,6191,4529,1583,6299,9712,1044,5406,1908,4002,7254,4338,2431,2552,4159,4947,9718,5502,6199,6569,8819,6930,398,1304,4057,224,2052,2492,648,6923,9919,8688,9466,4448,271,5765,4161,7667,1171,2421,1669,4777,6759,453,3681,919,1752,3399,2773,7951,9968,7944,4881,6718,9248,5291,3295,7653,7783,3943,928,4055,8983,395,8503,5606,2512,9016,3274,36,1437,1295,4813,4549,1748,8495,1820,3500,8246,4593,7803,4567,2538,9037,1285,8138,4328,4580,2143,8463,4875,3072,2518,3858,3467,7374,9465,2331,6390,9091,2367,4180,6738,7181,5081,4839,2028,6901,4691,274,7846,8847,4841,6736,4236,2479,4875,8564,7059,7018,3379,1935,6442,2250,2145,6261,9624,7962,8593,2366,3405,960,2898,6496,4493,7979,1335,2873,1232,2378,9500,9079,1225,693,5815,5461,3172,7042,377,232,413,109,8519,3207,2359,664,9469,1983,4979,8062,701,8384,5374,3600,4880,6220,1579,2567,9093,2812,4946,8593,1891,2523,9287,4058,4337,2459,7453,1066,9043,4218,1175,7562,7425,3534,4579,6894,1869,9558,1308,2571,4294,3035,2523,9175,9255,4102,1742,8348,3266,3040,3294,5157,5564,2581,5568,6253,1392,9373,7319,436,3591,4847,4350,7368,4733,5281,615,6603,1191,1923,5526,5486,4958,8049,4661,565,8503,2755,5266,1770,5796,8560,3279,7712,7493,8847,317,8885,4572,7636,5673,4515,8835,6376,1884,3569,1657,2499,172,2849,774,2050,4687,2085,6451,9348,2650,4954,8455,7916,6724,603,2828,4,4667,321,5203,4984,9207,6128,8973,1232,643,7808,7608,2527,7729,5618,1378,7901,4819,2153,6303,9506,4238,2754,5206,3240,7709,3661,7509,785,617,337,7141,5284,659,2345,6621,6218,8473,1946,7450,5468,6106,1411,7996,3836,7029,5726,8089,1848,4231,4393,7706,8469,3499,2912,8062,1208,2925,5571,8346,3542,2260,5487,5179,2919,7832,8152,5489,2657,98,2940,8126,2556,703,2474,6392,7732,4552,4482,5932,8784,5227,3638,3605,8726,6550,1667,6287,5827,3590,4633,9370,5851,120,901,5122,4305,9053,612,6962,5503,9904,1440,8059,6959,266,4452,4691,4819,5286,6975,9955,513,613,3560,9239,3515,5228,5526,9342,5170,6511,8712,7373,6632,5965,2496,937,5018,9460,4251,521,5716,2044,4933,2675,8662,5737,3718,3481,1023,693,9788,7888,1306,3349,7127,1173,4929,9006,515,99,5517,5580,7473,8501,1545,6321,9438,6564,2133,42,3437,7849,8438,8370,6876,7100,459,6946,6934,1482,7639,6722,9370,5297,71,2850,6470,5000,8208,6985,1452,3725,2565,8925,8579,4111,1598,8017,7027,3731,4411,6816,7932,2849,1539,1160,9950,1998,8106,3236,3481,5745,9958,9203,1042,30,2053,3864,1382,261,849,2834,339,9767,8111,8918,3878,9709,3287,7257,3440,7699,4073,7724,6900,1964,8884,3202,3963,6990,6438,7444,2735,6397,2999,129,2779,5053,3993,4161,1666,1195,3348,2005,962,1459,923,1192,1169,563,4801,961,4614,5226,5038,1514,7191,3922,1069,1154,913,7507,4950,0,256,7949,6482,3035,9354,6827,3549,1021,4374,3249,9378,1688,4708,302,2880,2229,7217,4033,9543,1831,9260,4581,3345,6451,4855,766,7605,5768,8274,8907,2121,4882,6856,4955,4270,2563,1782,7819,3584,6157,7420,2962,4197,8480,9616,7078,710,6833,7463,6605,8664,6723,7538,8362,3174,2393,5480,7131,8162,3754,2390,6635,8637,9247,1590,2907,1810,9724,7078,1746,2233,850,1060,6431,9330,677,9861,6392,3862,7324,2997,8879,400,535,3593,9926,2929,9073,7058,7443,9180,9448,430,7817,5047,8372,7076,3209,8096,506,1307,6682,7708,2368,3113,7038,9397,9326,3431,3259,3002,2780,2138,3402,9668,2083,3329,8949,1157,6739,2744,337,2539,3174,4506,3939,1546,7934,7148,5994,4792,4808,9028,2500,7176,8493,5890,6573,7819,5673,6184,822,8454,4675,576,4474,6758,3905,3423,7915,6996,2519,4604,9536,5693,5462,3475,3591,3396,6975,5937,4540,1783,4966,3392,8959,9811,9283,1884,7631,4956,8069,4805,9762,2744,5381,588,9502,5639,4011,3770,2635,2882,4726,8523,8575,189,1998,8518,9937,8974,808,4478,7109,2126,4222,6069,1937,3505,4305,5920,4814,2374,725,928,1470,2459,1517,7325,4450,1880,7447,3437,4763,2173,1961,9690,8714,3959,4561,8652,9285,5369,9482,6395,7495,56,8816,9432,3562,3121,5353,4728,1848,2430,5656,9670,1241,3525,6995,2043,5406,4442,5481,6521,2968,7442,6211,1682,7753,772,6686,3391,2493,2520,6138,6340,2577,4954,5773,2491,4427,7478,7219,2627,6260,9227,2298,3854,2753,9293,5897,4511,88,1378,1032,3056,5172,3595,1090,9278,720,4129,9021,3213,6649,5159,9554,9226,113,1679,8069,892,5509,5288,3520,1769,868,5818,1975,3621,1463,7873,8132,1551,5603,5516,959,7128,9111,2050,2758,9831,2531,1779,3045,9180,6938,8951,4759,3403,630,2828,4295,6139,4469,7815,4260,5337,9985,6236,5310,1449,461,9794,3000,2416,5310,312,5896,4421,8714,8654,4253,1245,6785,3650,425,3723,2601,1536,7126,9583,717,7774,5722,5186,1941,6334,6875,1927,8922,2185,3376,5735,1979,2728,4504,3641,9392,400,8062,8106,5407,8667,9351,2192,8669,9777,5916,7622,7665,9394,7205,8382,3520,2927,9920,5462,5614,6795,7389,4536,5332,7117,6624,3663,6197,1128,7304,5590,1528,1719,3696,3287,6738,9400,5480,5408,5529,7748,3030,3194,3494,236,1577,7015,9515,1497,2477,5129,4645,6218,6018,9977,9687,8994,9993,2236,122,7297,7826,8002,5368,7875,1290,2107,7275,6770,7515,9156,870,6897,2350,4364,7133,279,1379,3001,8129,208,4482,2774,2778,6852,9103,2465,5846,5448,4702,5968,9098,8880,3971,4466,3107,5261,6573,6734,8383,440,5890,9253,7338,8241,3617,823,4872,1349,3824,3001,1557,4659,2127,4336,1511,1231,3153,7358,6679,7855,3326,5777,3088,3649,6596,6195,8910,9521,2930,7293,9962,8820,6546,3652,3413,6516,827,8286,7865,1004,1287,5774,5663,3415,6462,7174,998,9616,4532,4029,3823,4211,6159,6911,7860,2755,3107,3123,2276,2389,416,8590,7561,3315,8594,975,6183,9422,5613,4048,426,3252,6174,2441,3019,2637,9615,369,2253,500,4399,6076,1063,6910,9340,5275,6017,8799,8398,4645,1188,5167,9588,8749,8482,8182,6076,4665,3956,8041,5065,734,1294,1239,3175,665,3876,9143,1035,2481,5995,1786,4910,7058,5048,4250,2333,1065,3049,732,2062,589,5899,1650,5690,733,9833,8119,5398,141,6160,6815,876,3806,8054,403,824,8283,9546,1859,764,5541,9997,2026,2599,5045,6276,1285,2462,5677,2017,4524,6266,4268,2527,1957,5001,2360,76,6751,8853,6236,3566,9729,6395,7972,133,7219,2607,6031,5430,3372,1573,5427,5398,524,6824,8027,8161,5638,3704,178,6514,9971,798,9041,1928,5799,7753,8356,8902,6607,944,8820,2688,7339,3145,9173,4558,5752,5205,9988,5476,3130,1767,7227,6,4943,5254,8168,581,5310,4698,3448,5281,5497,2489,3561,7648,243,8269,6551,6850,9214,1723,9538,6553,4868,5064,7464,621,269,3804,2449,9751,1924,9676,9757,6867,1282,4277,3801,6593,8976,7249,8226,4473,9738,8140,8473,9981,6409,5024,3183,5623,3100,9074,2177,7968,4138,5993,4941,759,9797,7391,510,1721,7067,6619,4941,8350,897,8742,1295,6225,5991,9521,7050,2081,7661,5523,8415,4071,548,1598,9694,3648,7024,8223,7968,7514,568,2910,4625,366,301,1487,8439,3720,8107,3380,8422,5356,2122,9717,1581,4465,5591,8631,6547,3252,4154,1314,3675,1054,9264,9722,1054,6289,4297,9023,155,4866,8285,4781,1584,8586,6268,6375,8658,727,9756,7081,6083,8230,3150,4016,9048,8741,8999,1947,8346,9506,3261,8373,6912,2525,8095,7967,5166,8745,3342,5322,9963,1627,103,1547,6565,6371,7922,5223,7099,4030,8656,9534,8613,8159,9903,7661,3252,8902,9608,1598,8408,9221,6324,1673,1746,771,9640,6913,9516,9334,8587,9479,961,8690,7378,7526,1413,1653,9101,4864,5683,4110,751,4296,2269,654,8309,5521,9556,7917,3472,4317,3490,9796,5990,5237,567,1982,8502,6436,1316,7089,2267,8629,2131,9646,2507,9896,7651,1608,4761,3334,2070,5512,3983,4339,2518,8644,6213,2074,2914,9685,2743,6404,5833,5085,1641,6400,7067,6495,9188,4735,9936,1456,3364,2067,1102,5871,8316,8753,7480,3077,8439,5902,4941,8774,242,7459,3771,6455,5885,6685,2492,4981,3089,8325,66,1083,4725,3486,7578,3914,8221,3867,1722,1586,2286,9176,7457,602,7929,1289,31,2720,7192,4972,7847,3786,8783,1618,241,1021,8303,9085,6002,7744,7410,2420,8827,8487,5906,2758,8753,480,2977,475,2066,5263,9651,5875,5866,3932,7165,5897,6653,709,7222,852,4495,6005,8822,1088,3378,3477,173,5732,1221,7583,8153,6401,6070,411,5511,4824,891,8488,1651,9309,3751,1303,5185,9617,5235,8702,1867,8240,9411,9089,9092,258,1446,4266,1346,4825,7743,7871,6909,5317,1806,1414,1718,4228,1826,3581,5404,9069,2069,7056,8379,2172,8359,9916,8142,3594,8618,9,1835,4381,5450,7279,4639,6896,1546,2337,8073,5641,208,4983,958,8366,6397,9028,2594,4575,2609,7999,9997,1030,5055,4728,9555,3414,4644,7697,3360,3262,4058,1547,3995,5860,8827,8634,2756,6725,7323,830,8718,3883,2165,9677,2249,4914,8705,1195,9490,7667,9194,9487,8697,4249,4215,4604,4015,5211,2301,7376,4825,2711,8923,8820,8571,4102,3806,7680,7179,1129,4862,5898,1364,7027,5575,3613,1941,632,4808,7783,8299,355,3622,3349,4604,4189,7953,4972,9400,6607,8700,4225,5670,7623,3045,594,8078,3203,8274,5257,4332,3136,1155,5696,6515,3082,5661,8456,3715,6822,6240,8366,7177,6214,8067,8133,404,6021,3105,9804,8980,1805,382,4650,5781,9779,5244,211,2983,9870,5468,3667,9358,2976,9364,5873,6058,1377,4330,9773,8199,6922,4492,1728,3136,2559,9862,3540,4932,9319,9697,3912,7477,79,4915,3258,9858,6511,9821,2841,6382,5289,6509,2092,8265,2225,7966,676,9954,2296,449,4506,5570,1293,6234,8706,3853,6096,8599,5137,5416,4648,9050,2893,1079,317,2503,937,6828,2324,131,9562,3965,2992,1655,8583,1569,9621,9259,1523,8269,6060,6029,191,7354,8616,8897,7559,4712,3848,2696,6480,4848,8098,5725,5927,8415,8228,6865,1596,6904,3348,7510,7222,2692,5517,5805,4261,1490,5064,2136,9759,7476,4518,9950,1182,3134,5200,8741,4198,5400,7790,679,249,5888,6404,6176,656,985,9393,2252,4241,9093,6114,1463,1785,1632,7268,2398,3122,8684,887,9234,2513,5405,5536,3695,4891,736,8789,9089,2489,6579,9768,9090,2467,2525,1618,9475,3510,7364,1727,4103,6457,7842,5567,4595,5826,9187,3345,8948,4224,4232,8182,6737,5989,3719,6784,880,807,5573,6322,9648,2152,2442,8738,972,4967,357,447,4829,7721,8527,8933,530,2721,852,1477,8547,39,4823,7495,4263,5407,2030,7352,1397,2101,4137,8629,2908,9710,4951,2557,8215,7394,7647,9187,8713,8004,5986,9895,2077,4513,5180,2608,7234,6032,437,5781,6071,5260,9629,6687,668,1659,391,8417,3760,880,3398,3020,591,8350,5577,5158,2096,3225,4345,7161,7581,331,7056,6011,1197,2236,4971,8431,8268,5408,565,692,669,194,3731,7689,8205,474,2458,1965,1355,5856,4985,8298,558,6915,3456,9006,6492,7801,6168,425,4484,9576,6436,5681,8165,1407,465,2785,6816,1030,9829,3837,7576,3560,7878,5781,4035,6688,7746,1742,2544,9083,40,9455,2350,3496,4813,5194,7649,7333,5620,8485,6910,8408,519,1427,9816,984,4212,2984,8366,4042,3173,5942,3954,1051,1723,4341,4091,5821,6083,2987,1256,6123,2442,3607,5971,7256,5153,3620,4589,773,2106,7851,5534,8977,9278,5350,9961,9843,4686,4679,237,7859,621,4191,5262,8696,4885,9353,869,7320,2340,8477,9796,1135,8436,5767,8391,3590,5740,9332,715,4198,7184,6249,3175,2814,7951,9488,2657,2637,4167,2894,496,1140,3438,2110,6188,4675,1463,3409,1995,156,1886,1791,1291,323,3911,6034,3913,9651,5366,4628,201,8902,7230,3376,8069,5181,2864,7078,7819,3383,9973,4667,875,9763,3130,7063,4438,4593,472,2785,4749,2358,4577,2392,2681,4840,8426,2946,4491,3793,7575,4692,9047,1157,4420,7116,6338,3636,4195,509,7019,520,5177,7894,6635,8307,1309,1073,9252,1781,3858,354,491,4787,9098,9525,9627,7525,2471,470,7670,6398,1514,6717,7555,5934,186,3894,9570,733,4403,2941,1253,5932,7187,4240,591,8496,5313,6196,6629,5523,2902,3473,6663,2000,2998,2642,9525,1821,3113,7195,8220,4627,265,2127,6914,6803,2373,2836,7536,3129,5778,5141,9061,2965,9381,6005,7814,1046,8553,795,2921,1455,4268,5936,9807,3618,8579,9333,5440,8044,2880,12,9023,9497,2139,5937,6300,4513,8774,188,7642,904,5329,3055,221,1062,5412,8035,2108,3965,8831,1382,1772,9451,7318,1580,3070,5897,7265,8510,3941,6497,8522,9317,5995,7013,5254,8647,1526,380,8836,5520,1284,517,8576,1506,1580,340,5893,40,658,1076,1422,2430,528,5093,362,9950,990,7627,8460,1284,477,3334,601,6472,347,2207,1471,8226,2588,6659,3746,224,3529,8674,8082,5109,9015,3976,1501,9673,1404,9276,8455,8284,4369,8818,8234,1711,2797,3046,9347,3274,2732,9948,6098,3080,8508,3922,7658,1096,581,1404,7672,4110,6431,5755,5571,1798,6083,7073,1471,7487,2701,6278,2124,7070,1448,358,5133,598,9757,4481,3872,2489,4429,6323,1921,9289,245,9579,6737,7178,7336,4410,1289,3767,6517,3212,5565,2600,6637,3388,6439,9338,9666,8563,2760,7467,5274,7894,8065,5031,2375,8289,7520,3156,4612,9442,2446,1209,9021,9183,8388,6357,9945,6029,6476,6462,9241,2041,5414,5879,5429,1854,1569,1448,6769,682,8915,2043,8576,6980,7074,7303,5269,947,459,6234,389,9257,7443,5762,4793,2183,8472,4738,8212,4948,7553,7454,6990,2967,9685,8771,4821,7606,6571,7943,8288,5486,9986,3216,8818,3413,519,440,712,7331,6674,1101,6588,469,3215,1381,2653,1687,2472,865,2988,25,4671,6330,2992,708,5101,4166,4667,1673,8461,2955,3511,8447,6172,2330,8212,3043,9122,8924,374,2148,6377,3315,2617,9593,1048,5270,7632,3520,2488,620,9897,3511,6950,9242,4220,8404,9760,8887,6429,8221,8194,9940,6668,718,8622,1233,3762,7744,157,4136,9892,2887,7451,8862,2480,8500,4132,6464,8372,2972,3437,8270,6484,6739,3864,704,5143,3624,5943,1572,1845,4137,7865,4865,1208,6487,6098,4970,584,2608,5458,476,5495,9262,9338,4327,7762,9823,791,2486,2795,580,7108,5631,7320,972,2687,8815,4596,8630,388,2793,9120,4605,7659,328,1092,3757,1650,8028,2717,7108,8505,8212,6370,4195,8891,484,370,9683,2971,9518,6615,6431,5149,3935,7404,7837,2751,8352,2819,9491,1146,8291,4096,8805,8619,1540,8914,6621,9569,1632,3730,4426,6196,100,4973,5088,6937,5344,1123,6260,1214,7738,2691,6363,1674,6447,552,777,1152,9724,268,2298,8015,716,7455,2987,8608,2721,9608,8177,705,3338,8955,6902,9791,3929,1990,6728,5625,3113,2988,6839,7203,2031,9554,5229,8479,6459,6006,9631,6183,2626,8281,550,9694,2088,3537,8303,4809,3146,6480,1867,2836,1788,8769,2627,5717,7111,5707,7694,6576,8695,885,3779,7079,6791,9009,5558,3250,1367,1541,5785,346,9822,6336,40,1910,9873,8343,3071,9371,1176,4938,2208,9316,59,4835,5033,7170,6895,9079,3746,1942,9964,7526,9021,6755,2887,4579,6358,606,6120,2143,952,2294,4831,993,556,1057,5688,3628,428,3216,4918,8988,2532,4978,176,3917,8500,7071,2996,2247,9013,9312,6125,8035,2420,5364,8966,8778,5970,5087,7273,6923,3733,2105,4268,4290,3162,6308,4270,9942,9525,9188,8931,8409,518,9107,8679,9019,2530,8027,7618,1543,7340,3743,5930,9760,9107,4897,4890,1429,6336,2163,8352,69,4268,8972,711,3782,5281,4981,77,1158,522,5360,5919,7392,819,4598,2763,3349,2626,381,4892,6318,476,7175,2430,5935,2072,3672,7365,8408,5835,5717,4829,6456,1042,5541,6590,6323,522,6667,7481,7396,2027,3400,4789,2846,4351,7552,2547,6977,4286,7440,9647,4762,4615,8429,698,3039,2101,4415,1447,4288,6484,2628,744,7526,8169,7335,3849,5044,354,7682,2440,8734,1083,3581,1580,5434,7486,4128,8763,1772,7920,4762,6534,8887,3191,3584,8278,1644,4351,6077,5932,836,8705,3029,8362,6875,364,8564,1919,7070,6246,711,5804,7329,4293,3737,9115,1779,4217,7878,9903,8489,8992,2789,7376,8535,2726,2006,179,7077,8083,6112,7913,6788,5493,6276,3663,2209,1192,1934,9279,7438,2646,1436,1120,3291,5173,235,1422,9390,4466,1325,4231,3458,466,1607,1994,3192,9965,8525,270,8048,989,8183,4836,6482,811,8500,8691,2003,6786,7971,5794,9432,9407,6914,9075,932,7149,497,6674,1615,8174,905,1426,8641,8864,9772,1833,8829,8297,2103,6877,5639,6639,1713,2121,3802,6565,813,5806,9704,5136,1600,9136,895,8514,4564,8179,2015,1413,4853,9983,9588,5758,1409,4581,974,7533,6414,9803,5830,4870,3032,7821,7861,1097,9943,1663,4015,7108,3821,3719,8596,1773,9207,9491,6639,3771,7670,8655,5185,8875,8638,1125,985,6399,5706,1959,284,8472,8114,6114,9694,1146,288,7555,2243,231,5571,6258,7339,9392,9977,5935,7518,9185,1778,4157,9308,5800,2812,4493,1027,7802,5618,2012,553,7676,3971,837,2501,8437,3304,2195,9583,3592,6103,8178,3823,1674,4437,7514,7418,766,9801,4936,6303,7931,9094,5612,3731,8258,105,1110,2413,2076,3122,2966,6104,3445,156,8605,1882,3460,801,7817,3404,3256,5995,3579,4930,6784,7445,8700,7551,7246,3637,3854,1529,9083,9466,1612,7341,5924,2722,6106,4352,5844,9073,456,9289,5581,9062,7523,5393,6215,5340,8797,9471,7687,8728,753,4472,6173,5805,8375,9771,9442,2229,1300,4877,8048,2912,2219,324,5634,4677,4676,7830,3750,1484,3471,5683,546,994,1076,3113,2686,6225,8936,373,4953,9689,1197,7478,5495,9572,7249,1289,8154,4901,6167,2554,7813,4738,2878,9799,9415,3906,7629,9518,5390,1100,5201,2289,8446,2630,5402,7484,5207,4339,7858,161,380,5407,7639,2227,4980,1241,9869,3134,6142,2388,5688,308,7126,4918,107,2893,8824,7737,8763,566,5189,317,2855,3636,2947,4610,1120,8154,5301,5330,4667,2033,738,8659,4261,2070,9900,482,1556,2394,2870,3596,2702,6348,8514,2810,5593,3690,6899,4357,4256,8440,4674,7112,8428,7621,8074,5901,2127,3375,1231,6795,5408,8321,1806,6021,6743,1706,2855,8299,4100,5725,1895,3155,8425,6761,5965,4019,451,9216,8376,1060,7656,3050,4524,6085,7023,2598,1986,5502,2325,9569,8649,7733,4243,455,107,986,8513,2962,5638,2614,5040,3885,5769,3465,647,8086,7484,7450,7302,2212,4862,1310,1614,9386,7395,8637,8336,5733,4140,661,5303,9141,4747,9546,9597,4854,6884,8110,4168,2522,7076,9208,6408,9197,2674,3407,7283,6510,7209,937,5075,8424,2248,6689,7810,5995,5327,2499,1729,5819,3160,7032,4960,4259,2930,909,5465,9814,9020,9634,8689,2448,8842,1449,1646,7868,4856,8929,731,8417,6219,5806,6841,8467,2495,1004,814,4174,3503,2543,6345,3015,5927,7658,3627,8857,8567,9092,5024,3939,8726,3713,6388,3921,5162,8034,1789,6370,3315,8872,1139,9534,4678,4333,4353,3526,5337,5168,7700,5192,7711,4046,4559,9991,8056,8186,8848,6623,7279,224,6915,6005,289,3303,6278,1803,1337,4420,4525,1004,3292,5665,539,7971,9998,1244,7849,1687,6412,5549,6879,476,5947,1438,467,355,9625,5667,6979,3256,5892,246,5613,2533,3549,1892,4337,1238,6312,8862,2242,9604,879,9133,3927,7229,378,1776,8916,6790,3678,2147,3618,5977,9938,4085,6333,5915,6105,9664,9171,8349,9910,4784,882,9811,6676,1571,1049,9340,6786,9643,5297,7665,8777,9224,1247,9155,7353,6515,2297,7383,8663,2268,9712,4953,2705,6045,868,8810,2061,39,3511,8323,1175,4394,8134,4204,2317,9183,3544,9103,8827,8841,3121,7604,4418,4368,3111,8123,883,1760,5506,5898,4028,5218,851,6734,7616,8071,1896,6029,8110,5408,4353,5638,6154,2487,9842,8471,1671,9738,7575,6850,8580,696,806,9350,1416,269,7473,2299,2029,9331,4550,2410,901,5401,5496,4869,3473,7392,899,7935,2800,5252,9925,5306,7739,9767,3778,5762,5858,7705,8964,790,4753,9770,140,6169,39,3965,4820,8421,3296,9370,831,4197,1124,2679,9067,4597,71,9966,8884,9224,1570,8810,4530,5661,4929,4660,7776,787,2365,6740,7929,7118,6511,8069,3287,2902,2034,4460,7675,5330,3830,4858,5880,4954,7537,4947,5903,7609,1265,4788,3185,2835,9950,4067,8496,1231,8728,6272,8371,1093,9365,6300,4564,2228,4370,4203,5130,2756,8663,2806,8087,8846,4016,319,3800,1554,5266,6056,5515,2883,844,8700,2070,7146,2767,566,8377,7847,3191,6748,8941,8908,9401,9857,1136,3771,4060,6266,6527,2724,5424,966,1570,5793,7637,1722,7347,2903,7778,2862,2138,4974,7914,4208,8472,7033,1127,3202,4881,670,6302,174,9578,5703,31,714,9474,4091,3332,2354,3167,5109,9672,1089,902,7310,9164,8249,6565,3294,7463,5056,8269,5377,9264,3093,8762,391,6295,3643,1061,2598,3817,6991,8301,3848,4057,4128,4292,7390,2834,3811,8851,2506,4901,9753,6168,4065,4354,9086,7359,8169,4142,1980,9898,3406,5074,8660,150,7721,2304,7563,319,2473,4555,8621,6322,8612,9101,6966,2354,1935,777,1205,793,5678,7310,6962,6095,8016,2400,9807,6185,6542,8139,2435,6300,9565,1096,6450,7287,9752,4014,7606,2225,4921,2579,4899,9885,1680,1865,2240,9967,2643,3445,761,4673,7108,4075,7121,5124,6475,3280,7662,9369,1419,97,5669,985,1193,8472,4624,945,8838,2230,9523,111,1162,4422,9996,9194,6288,2236,9162,5283,2034,6275,9956,9142,350,7077,618,3177,6709,8280,8898,8129,8378,919,5466,5923,9391,90,3221,4581,8672,2744,4692,6186,7166,4689,5381,3454,3277,895,8737,1663,7170,5046,7157,3872,8475,7776,3401,5185,2408,2299,3314,786,3218,5132,3062,8962,1574,6283,3543,246,9027,8236,2785,6193,9277,4518,6000,8906,5413,4737,570,8935,9783,7727,2807,8259,1855,6208,9796,4264,4859,3110,1402,8077,4594,4464,7039,6168,747,583,2766,6126,5171,5551,2320,800,69,8320,9706,1834,9409,6628,769,5545,708,9928,156,2563,2488,9952,3179,7347,9414,4582,5425,4008,5398,8816,176,6146,9399,2942,2272,922,8494,944,8074,4915,5616,4133,6750,5026,761,3871,6923,7821,3800,3431,6737,6288,3383,9916,3636,2797,850,5413,3157,6249,4229,3333,8747,9981,6275,7371,903,1121,8316,5330,2389,3932,9463,9139,5310,6576,3010,8585,4398,3162,2016,7487,9451,1751,3755,9439,4548,4606,4852,7705,855,9081,7390,5954,9062,18,3325,6318,1139,1641,1648,9880,1926,7463,5371,3588,4039,8382,8526,4789,7896,542,8628,7347,2294,2384,6786,3194,6990,7990,7252,4197,7072,4642,151,2486,4660,9828,5156,2152,1470,3156,8384,9748,619,3756,9688,1011,8490,8214,2152,6386,5109,781,3734,3755,3165,6872,6949,155,1215,553,704,8287,5196,855,7125,6208,683,2282,4712,8505,5438,3097,4605,2410,6853,646,3421,5343,5212,5573,1729,321,6354,1815,4076,9519,5040,7378,6026,6255,7931,6730,894,9479,3937,4371,5688,973,3005,6752,5830,4796,9849,6788,7206,6702,7434,6979,8397,2646,2552,6479,9320,5259,4646,3396,1130,9686,7126,3509,2293,5058,239,9539,4537,529,3911,6577,1502,6916,3330,3684,1712,9531,472,5270,2586,4258,2249,983,6905,1154,7462,6225,6413,8461,5973,3895,8147,3100,7404,6793,4510,7644,6332,5399,4525,6595,1977,2379,9864,1659,6063,1576,1190,2888,6847,3776,7146,9096,1112,4051,250,4926,6628,3015,3387,8954,6911,7887,2054,4315,4680,2916,8311,7364,8315,9188,3960,6644,1567,176,8303,7631,1752,5846,6871,4951,9622,4017,400,7086,4421,7002,2013,1049,6370,5400,6355,3281,3287,8409,3948,4319,7677,8612,8036,5993,7800,8348,8989,5720,8524,3645,9703,6628,9491,6574,1580,5465,591,8332,2552,5012,5334,4565,2414,1704,6317,8769,1337,5957,3531,1638,6628,7560,250,4664,3553,4402,3012,8895,122,1536,2540,9825,4517,2031,6399,6097,3848,3343,4429,6400,4707,6115,7317,7121,4172,9987,2243,5509,2296,2126,7147,8924,9686,3749,3589,9592,8152,2953,8487,4626,842,7379,804,5359,9410,7203,7808,9610,6898,2237,2363,1606,4704,9680,5079,8876,6019,3674,4386,8315,5800,7885,7240,1839,1635,7181,7783,6139,134,6270,7117,976,1,7921,2687,9411,1477,495,5373,8375,9084,7736,6333,3789,3769,1413,2665,9788,5087,3403,8104,7240,1289,1696,5431,9276,8877,3214,1767,5363,5836,5236,2692,5837,3158,5379,1600,4635,2227,6973,9362,1311,4710,5696,5100,8479,3461,4118,8267,8548,7521,2723,2140,5162,771,7571,790,6000,785,8909,7716,6621,4146,408,2458,7304,2139,4058,8291,4366,1032,4005,5678,2094,9701,7130,573,3162,1248,5192,8063,5122,4268,6555,6636,1391,4127,7427,7392,1264,6336,5108,4238,6834,1868,3048,4138,359,3459,8781,4726,843,2787,6756,2937,8840,238,9862,8355,7839,5054,2770,2961,5674,9325,9597,7066,9804,3376,810,7421,6065,5918,1659,2899,4138,4707,3390,4497,8166,8523,5575,9009,1310,8683,8298,151,5274,8160,4858,3113,3215,7628,2426,8889,6953,8375,2307,3110,1752,3117,531,4169,5387,2190,7068,9525,3249,6810,375,7768,5334,2302,6777,6644,7338,5076,3147,2612,3236,8005,5725,2803,1985,4503,8045,8939,2878,352,8401,4630,9822,8932,8799,5209,1122,2220,1087,723,9030,7814,8491,4364,116,1621,7361,3806,6697,6860,6418,6285,1218,8495,5441,3203,9350,9838,8494,2229,6542,6895,6859,6364,5827,2011,1574,3301,583,9013,4025,9613,6827,8868,330,3295,489,4043,3454,3538,903,9872,9824,8473,4720,1617,1677,4070,1455,6523,2651,7997,3419,9511,4362,5598,7874,2288,8900,8457,7653,9277,4422,4480,4497,1104,4127,4987,5147,7581,8525,2403,3806,4701,876,4878,6318,8905,5300,7773,5429,7952,2123,5200,3815,2837,7150,8041,5125,2402,2850,2778,1679,7272,3610,6177,8377,4089,7516,9876,8023,6041,8631,1829,743,5860,3059,3413,4765,4711,1187,6546,2663,9662,8098,6478,2499,5249,871,7624,7651,3721,6754,5683,994,6716,8212,5723,7157,5728,1951,5180,8121,583,3361,8864,6443,2772,8630,7560,7484,9817,4107,147,5831,8557,2978,8330,3806,3849,2306,7810,7571,5412,3493,4917,2128,8057,6992,5637,137,8943,818,8258,5878,531,3475,2321,3304,2105,9882,788,8274,341,7287,4105,5250,265,8787,9057,467,1093,3219]

p max_area(heights) == 49024602