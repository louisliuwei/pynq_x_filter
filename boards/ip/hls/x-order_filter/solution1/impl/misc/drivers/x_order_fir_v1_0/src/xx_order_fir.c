// ==============================================================
// File generated on Mon Oct 07 01:59:23 +0800 2019
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xx_order_fir.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XX_order_fir_CfgInitialize(XX_order_fir *InstancePtr, XX_order_fir_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Axilites_BaseAddress = ConfigPtr->Axilites_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XX_order_fir_Start(XX_order_fir *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XX_order_fir_ReadReg(InstancePtr->Axilites_BaseAddress, XX_ORDER_FIR_AXILITES_ADDR_AP_CTRL) & 0x80;
    XX_order_fir_WriteReg(InstancePtr->Axilites_BaseAddress, XX_ORDER_FIR_AXILITES_ADDR_AP_CTRL, Data | 0x01);
}

u32 XX_order_fir_IsDone(XX_order_fir *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XX_order_fir_ReadReg(InstancePtr->Axilites_BaseAddress, XX_ORDER_FIR_AXILITES_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XX_order_fir_IsIdle(XX_order_fir *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XX_order_fir_ReadReg(InstancePtr->Axilites_BaseAddress, XX_ORDER_FIR_AXILITES_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XX_order_fir_IsReady(XX_order_fir *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XX_order_fir_ReadReg(InstancePtr->Axilites_BaseAddress, XX_ORDER_FIR_AXILITES_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XX_order_fir_EnableAutoRestart(XX_order_fir *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XX_order_fir_WriteReg(InstancePtr->Axilites_BaseAddress, XX_ORDER_FIR_AXILITES_ADDR_AP_CTRL, 0x80);
}

void XX_order_fir_DisableAutoRestart(XX_order_fir *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XX_order_fir_WriteReg(InstancePtr->Axilites_BaseAddress, XX_ORDER_FIR_AXILITES_ADDR_AP_CTRL, 0);
}

void XX_order_fir_Set_coe(XX_order_fir *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XX_order_fir_WriteReg(InstancePtr->Axilites_BaseAddress, XX_ORDER_FIR_AXILITES_ADDR_COE_DATA, Data);
}

u32 XX_order_fir_Get_coe(XX_order_fir *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XX_order_fir_ReadReg(InstancePtr->Axilites_BaseAddress, XX_ORDER_FIR_AXILITES_ADDR_COE_DATA);
    return Data;
}

void XX_order_fir_Set_ctrl(XX_order_fir *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XX_order_fir_WriteReg(InstancePtr->Axilites_BaseAddress, XX_ORDER_FIR_AXILITES_ADDR_CTRL_DATA, Data);
}

u32 XX_order_fir_Get_ctrl(XX_order_fir *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XX_order_fir_ReadReg(InstancePtr->Axilites_BaseAddress, XX_ORDER_FIR_AXILITES_ADDR_CTRL_DATA);
    return Data;
}

void XX_order_fir_InterruptGlobalEnable(XX_order_fir *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XX_order_fir_WriteReg(InstancePtr->Axilites_BaseAddress, XX_ORDER_FIR_AXILITES_ADDR_GIE, 1);
}

void XX_order_fir_InterruptGlobalDisable(XX_order_fir *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XX_order_fir_WriteReg(InstancePtr->Axilites_BaseAddress, XX_ORDER_FIR_AXILITES_ADDR_GIE, 0);
}

void XX_order_fir_InterruptEnable(XX_order_fir *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XX_order_fir_ReadReg(InstancePtr->Axilites_BaseAddress, XX_ORDER_FIR_AXILITES_ADDR_IER);
    XX_order_fir_WriteReg(InstancePtr->Axilites_BaseAddress, XX_ORDER_FIR_AXILITES_ADDR_IER, Register | Mask);
}

void XX_order_fir_InterruptDisable(XX_order_fir *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XX_order_fir_ReadReg(InstancePtr->Axilites_BaseAddress, XX_ORDER_FIR_AXILITES_ADDR_IER);
    XX_order_fir_WriteReg(InstancePtr->Axilites_BaseAddress, XX_ORDER_FIR_AXILITES_ADDR_IER, Register & (~Mask));
}

void XX_order_fir_InterruptClear(XX_order_fir *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XX_order_fir_WriteReg(InstancePtr->Axilites_BaseAddress, XX_ORDER_FIR_AXILITES_ADDR_ISR, Mask);
}

u32 XX_order_fir_InterruptGetEnabled(XX_order_fir *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XX_order_fir_ReadReg(InstancePtr->Axilites_BaseAddress, XX_ORDER_FIR_AXILITES_ADDR_IER);
}

u32 XX_order_fir_InterruptGetStatus(XX_order_fir *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XX_order_fir_ReadReg(InstancePtr->Axilites_BaseAddress, XX_ORDER_FIR_AXILITES_ADDR_ISR);
}

