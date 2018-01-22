```
x 8-default.pps
+ 12.pps
* 24.pps
+--------------------------------------------------------------------------+
|                                                   +                    * |
| x                                                 +                    **|
|xxx x                                              + +                  **|
||A_|                                                                      |
|                                                  |A|                     |
|                                                                        MA|
+--------------------------------------------------------------------------+
    N           Min           Max        Median           Avg        Stddev
x   5       8558601       8739272       8614791     8628869.2     68264.836
+   5      10968801      11071962      10975289      10992277     44652.115
Difference at 95.0% confidence
	2.36341e+06 +/- 84122.5
	27.3895% +/- 1.16833%
	(Student's t, pooled s = 57679.7)
*   5      11993473      12027891      12000608      12007535     14109.544
Difference at 95.0% confidence
	3.37867e+06 +/- 71887.8
	39.1554% +/- 1.14777%
	(Student's t, pooled s = 49290.8)
```

Between 12 queues (all cores of one socket) and 25 queuse (both socket), only 9% improvement:

```
x 12.pps
+ 24.pps
+--------------------------------------------------------------------------+
|                                                                       +  |
| xx                                                                    +  |
| xx     x                                                              +++|
||_MA__|                                                                   |
|                                                                       MA||
+--------------------------------------------------------------------------+
    N           Min           Max        Median           Avg        Stddev
x   5      10968801      11071962      10975289      10992277     44652.115
+   5      11993473      12027891      12000608      12007535     14109.544
Difference at 95.0% confidence
	1.01526e+06 +/- 48292.8
	9.2361% +/- 0.476371%
	(Student's t, pooled s = 33112.6)
```