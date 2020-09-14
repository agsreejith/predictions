# predictions
The height.m (matlab) file calculates the height wrt time for balloon specifications provided.
The lateral.pro (idl) files uses the hieght data and wind data from NOMADS to calculate lateral displacement

Instructions for obtaining data from the NOMADS site

1. Useful url for info:  http://nomads.ncdc.noaa.gov/guide/index.php?name=advanced#adv-gdsascii
2. Go to: http://nomads.ncep.noaa.gov/
3. Click on "GFS 1.0x1.0 Degree - OpenDAP"
4. Click on latest forecast at bottom: e.g. "30: gfs20110406/: dir"
5. Click on latest "gfs_*z:" link, e.g."3: gfs_06z: GFS fcst starting from 06Z06apr2011. 
6. Cut and paste base url under "OPeNDAP/DODS Data URL:", e.g. http://nomads.ncep.noaa.gov:9090/dods/gfs/gfs20110406/gfs_06z"
7. This is 12am forecast on 24th July 2012.
8. Now add the parameters to download the data. Parameters we want are
i. ugrdprs (m/s wind speed in E-W direction)
ii. vgrdprs (m/s wind speed in N-S direction)
iii. hgtprs (geopotential height in m, i.e.altitude  corresponding to pressure
1000 975 950 925 900.. 7 5 3 2 1)
Longitude: 0.00000000000E to 359.00000000000E (360 points, avg. res. 1.0 deg)
Latitude: -90.00000000000N to 90.00000000000N (181 points, avg. res. 1.0 deg)
Altitude: 1000.00000000000 to 10.00000000000 (26 points, avg. res. 39.6)
Values for brackets:
Latitude: x = 13+90.0 / 1.0 = 103
Longitude = 77-0.0 / 1.0 = 77
Altitude - we want all values, so 0:25
So the url we require is:
http://nomads.ncep.noaa.gov:9090/dods/gfs/gfs20120624/gfs_00z.ascii?ugrdprs[4][0:25][103][77]
This gives the following output at the foot of the page:
time, [1]
734663.25
lev, [26]
1000.0, 975.0, 950.0, 925.0, 900.0, 850.0, 800.0, 750.0, 700.0, 650.0,600.0, 550.0, 500.0, 450.0, 400.0, 350.0, 300.0, 250.0, 200.0, 150.0,100.0, 70.0, 50.0, 30.0, 20.0, 10.0
lat, [1]
13.0
lon, [1]
77.0
The latitude and longitude are only known to 1 degree accurasy, the pressure varies from 1000->10 and the time information is the fifth value in the array.
