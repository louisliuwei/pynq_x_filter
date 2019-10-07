/*
	Filename: fir.h
		Header file
		FIR lab wirtten for WES/CSE237C class at UCSD.

*/
#ifndef FIR_H_
#define FIR_H_

//const int N=11;
#include "ap_int.h"

typedef int	coef_t;
typedef int	acc_t;

struct data_t {
	int data;
	ap_uint<1> user;
	ap_uint<1> last;
};

void x_order_fir (
  data_t *y,
  data_t *x,
  int *coe,
  int *ctrl
  );

#endif
