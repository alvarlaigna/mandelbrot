// by Erik Wrenholt
#include <stdio.h>
#include <sys/time.h>

#define BAILOUT 16
#define MAX_ITERATIONS 1000

int mandelbrot(double x, double y)
{
	double cr = y - 0.5;
	double ci = x;
	double zi = 0.0;
	double zr = 0.0;
	int i = 0;

	while(1) {
		i ++;
		double temp = zr * zi;
		double zr2 = zr * zr;
		double zi2 = zi * zi;
		zr = zr2 - zi2 + cr;
		zi = temp + temp + ci;
		if (zi2 + zr2 > BAILOUT)
			return i;
		if (i > MAX_ITERATIONS)
			return 0;
	}
	
}

int main (int argc, const char * argv[]) {
	struct timeval aTv;
	gettimeofday(&aTv, NULL);
	long init_time = aTv.tv_sec;
	long init_usec = aTv.tv_usec;

	int p,q=0;	
	for (p = 0; p < 10; p++) {
	int x,y;
	for (y = -39; y < 39; y++) {
		for (x = -39; x < 39; x++) {
			int i = mandelbrot(x/40.0, y/40.0);
			if (i) 
				q++;
			else
				q--;
		}	
	}
	}
	
	gettimeofday(&aTv,NULL);
	long double query_time = (long double)(aTv.tv_usec - init_usec);	
	printf ("C Elapsed %Lf\n", query_time);
	printf ("%c", q);

    return 0;
}
