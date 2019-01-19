# Linear Congruential Generator


This is a generator of pseudo-random numbers using a linear congruential algorithm.


The program prn_congr receives one number (seed) and generates "m" pseudorandom numbers calculated with a linear congruential algorithm. These numbers will be put into raw_prn.dat .


The program prandom_points receives one number (seed) and generates "m" pseudorandom numbers calculated with a linear congruential algorithm. These numbers will be divided by "m", so that they are in the `[0, 1)` interval. After that, a file called points.data contains points (x, y) made by these pseudo-random numbers in that interval.


You can change the seed when the program executes.
You can change the linear parameters of the algorithm in prn_mod.f90 .
You can change the amount of prn that will be generated, "m", in prn_mod.f90 .


Recomended parameters are a=4, c=1 and m=9.
Larger recomended parameters are m=6075, a=106 and c=1283, and m=12906, a=1741 and c=2731.
An example of a bad choice would be a=1, c=2, m=7 and seed=0; because the actual period would be 4 instead of 7.


You'll need to install:


```$ sudo apt-get update```


```$ sudo apt-get install gfortran```


To compile:


```$ gfortran -o <program name>.x prn_mod.f90 <program name>.f90```


To execute:


```$ ./<program name>.x```


If you'd like to view the points, you can use gnuplot.


To install it:


```$ sudo apt-get update```


```$ sudo apt-get install gnuplot-x11```


Once in:


```gnuplot> plot "points.dat" using 1:2```


This will plot the data points using the first column as the x variable and the second, as the y variable.
