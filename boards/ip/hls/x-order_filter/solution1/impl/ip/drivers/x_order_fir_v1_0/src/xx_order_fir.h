// ==============================================================
// File generated on Mon Oct 07 01:59:23 +0800 2019
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XX_ORDER_FIR_H
#define XX_ORDER_FIR_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xx_order_fir_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 Axilites_BaseAddress;
} XX_order_fir_Config;
#endif

typedef struct {
    u32 Axilites_BaseAddress;
    u32 IsReady;
} XX_order_fir;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XX_order_fir_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XX_order_fir_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XX_order_fir_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XX_order_fir_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XX_order_fir_Initialize(XX_order_fir *InstancePtr, u16 DeviceId);
XX_order_fir_Config* XX_order_fir_LookupConfig(u16 DeviceId);
int XX_order_fir_CfgInitialize(XX_order_fir *InstancePtr, XX_order_fir_Config *ConfigPtr);
#else
int XX_order_fir_Initialize(XX_order_fir *InstancePtr, const char* InstanceName);
int XX_order_fir_Release(XX_order_fir *InstancePtr);
#endif

void XX_order_fir_Start(XX_order_fir *InstancePtr);
u32 XX_order_fir_IsDone(XX_order_fir *InstancePtr);
u32 XX_order_fir_IsIdle(XX_order_fir *InstancePtr);
u32 XX_order_fir_IsReady(XX_order_fir *InstancePtr);
void XX_order_fir_EnableAutoRestart(XX_order_fir *InstancePtr);
void XX_order_fir_DisableAutoRestart(XX_order_fir *InstancePtr);

void XX_order_fir_Set_coe(XX_order_fir *InstancePtr, u32 Data);
u32 XX_order_fir_Get_coe(XX_order_fir *InstancePtr);
void XX_order_fir_Set_ctrl(XX_order_fir *InstancePtr, u32 Data);
u32 XX_order_fir_Get_ctrl(XX_order_fir *InstancePtr);

void XX_order_fir_InterruptGlobalEnable(XX_order_fir *InstancePtr);
void XX_order_fir_InterruptGlobalDisable(XX_order_fir *InstancePtr);
void XX_order_fir_InterruptEnable(XX_order_fir *InstancePtr, u32 Mask);
void XX_order_fir_InterruptDisable(XX_order_fir *InstancePtr, u32 Mask);
void XX_order_fir_InterruptClear(XX_order_fir *InstancePtr, u32 Mask);
u32 XX_order_fir_InterruptGetEnabled(XX_order_fir *InstancePtr);
u32 XX_order_fir_InterruptGetStatus(XX_order_fir *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
