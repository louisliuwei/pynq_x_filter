/*
	Filename: fir_test.h
		FIR lab wirtten for WES/CSE237C class at UCSD.
		Testbench file
		Calls fir() function from fir.cpp
		Compares the output from fir() with out.gold.dat
*/

#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include "fir.h"

int main () {
  const int    SAMPLES=600;
  FILE         *fp, *fin;

  data_t signal, output;
  int i;
  int N= 11;
  int control[2] = {1,10};
  signal.data = 0;
  coef_t c[11]={
	#include "fir_coef.dat"
	};

  void fir (
    data_t *y,
    data_t *x,
    int *coe,
    int *ctrl
    );

  fin=fopen("input.dat","r");
  fp=fopen("out.dat","w");

  for (i=0;i<SAMPLES;i++) {
	fscanf(fin,"%d",&signal.data);
	//Call the HLS block
    x_order_fir(&output,&signal,c,control);
    // Save the results.
    fprintf(fp,"%d\n",output.data);
    printf("%i %d %d\n",i,signal.data,output.data);
  }

  fclose(fp);
  fclose(fin);

  //Comparing results with the golden output.
  printf ("Comparing against output data \n");
    if (system("diff -w out.dat out.gold.dat")) {
  	fprintf(stdout, "*******************************************\n");
  	fprintf(stdout, "FAIL: Output DOES NOT match the golden output\n");
  	fprintf(stdout, "*******************************************\n");
       return 1;
    } else {
  	fprintf(stdout, "*******************************************\n");
  	fprintf(stdout, "PASS: The output matches the golden output!\n");
  	fprintf(stdout, "*******************************************\n");
       return 0;
    }

}

