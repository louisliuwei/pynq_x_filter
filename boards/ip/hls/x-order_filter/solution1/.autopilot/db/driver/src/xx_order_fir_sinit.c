// ==============================================================
// File generated on Mon Oct 07 01:59:23 +0800 2019
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xx_order_fir.h"

extern XX_order_fir_Config XX_order_fir_ConfigTable[];

XX_order_fir_Config *XX_order_fir_LookupConfig(u16 DeviceId) {
	XX_order_fir_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XX_ORDER_FIR_NUM_INSTANCES; Index++) {
		if (XX_order_fir_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XX_order_fir_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XX_order_fir_Initialize(XX_order_fir *InstancePtr, u16 DeviceId) {
	XX_order_fir_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XX_order_fir_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XX_order_fir_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

