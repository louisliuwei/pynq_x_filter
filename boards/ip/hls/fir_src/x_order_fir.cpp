/*
	Filename: fir.cpp
		FIR lab wirtten for WES/CSE237C class at UCSD.

	INPUT:
		x: signal (chirp)

	OUTPUT:
		y: filtered output

*/

#include "fir.h"
#include <stdio.h>
#include <math.h>
#include <string.h>


void x_order_fir (
  data_t *y,
  data_t *x,
  int *coe,
  int *ctrl
  )
{
#pragma HLS INTERFACE m_axi depth=256 port=ctrl offset=slave
#pragma HLS INTERFACE axis register both port=y
#pragma HLS INTERFACE s_axilite port=return
#pragma HLS INTERFACE m_axi depth=1024 port=coe offset=slave
#pragma HLS INTERFACE axis register both port=x

	int i;
	int fir_ctrl[2];
	static int coef[1024];
	static int shift_reg[1024];
	int acc;
	int N;
	int reload;

	acc = 0;


	memcpy(fir_ctrl,(const int*)ctrl,2*sizeof(int));
	reload = fir_ctrl[0];
	N= fir_ctrl[1] + 1;

	if(reload){
		memcpy(coef,(const int*)coe,N*sizeof(int));
	}

	calc_loop:
	for (i = N-1; i != 0; i--) {
		#pragma HLS PIPELINE
		#pragma HLS LOOP_TRIPCOUNT min=10 max=1023
		acc += (int)shift_reg[i-1] * (int)coef[i];
		shift_reg[i] = shift_reg[i-1];
	}

	acc += (x->data) * (int)coef[0];
	shift_reg[0] = x->data;

	y->data = acc;
	y->user = x->user;
	y->last = x->last;

}
