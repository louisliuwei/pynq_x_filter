// ==============================================================
// File generated on Mon Oct 07 01:59:54 +0800 2019
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================

#define AP_INT_MAX_W 32678

#include <systemc>
#include <iostream>
#include <cstdlib>
#include <cstddef>
#include <stdint.h>
#include "SysCFileHandler.h"
#include "ap_int.h"
#include "ap_fixed.h"
#include <complex>
#include <stdbool.h>
#include "autopilot_cbe.h"
#include "hls_stream.h"
#include "hls_half.h"
#include "hls_signal_handler.h"

using namespace std;
using namespace sc_core;
using namespace sc_dt;


// [dump_struct_tree [build_nameSpaceTree] dumpedStructList] ---------->
    typedef struct data_t {
        int data;
        ap_uint<1> user;
        ap_uint<1> last;
       } data_t;



// [dump_enumeration [get_enumeration_list]] ---------->


// wrapc file define: "gmem"
#define AUTOTB_TVIN_gmem  "../tv/cdatafile/c.x_order_fir.autotvin_gmem.dat"
// wrapc file define: "y_data"
#define AUTOTB_TVOUT_y_data  "../tv/cdatafile/c.x_order_fir.autotvout_y_data.dat"
#define AUTOTB_TVIN_y_data  "../tv/cdatafile/c.x_order_fir.autotvin_y_data.dat"
// wrapc file define: "y_user_V"
#define AUTOTB_TVOUT_y_user_V  "../tv/cdatafile/c.x_order_fir.autotvout_y_user_V.dat"
#define AUTOTB_TVIN_y_user_V  "../tv/cdatafile/c.x_order_fir.autotvin_y_user_V.dat"
// wrapc file define: "y_last_V"
#define AUTOTB_TVOUT_y_last_V  "../tv/cdatafile/c.x_order_fir.autotvout_y_last_V.dat"
#define AUTOTB_TVIN_y_last_V  "../tv/cdatafile/c.x_order_fir.autotvin_y_last_V.dat"
// wrapc file define: "x_data"
#define AUTOTB_TVIN_x_data  "../tv/cdatafile/c.x_order_fir.autotvin_x_data.dat"
// wrapc file define: "x_user_V"
#define AUTOTB_TVIN_x_user_V  "../tv/cdatafile/c.x_order_fir.autotvin_x_user_V.dat"
// wrapc file define: "x_last_V"
#define AUTOTB_TVIN_x_last_V  "../tv/cdatafile/c.x_order_fir.autotvin_x_last_V.dat"
// wrapc file define: "coe"
#define AUTOTB_TVIN_coe  "../tv/cdatafile/c.x_order_fir.autotvin_coe.dat"
// wrapc file define: "ctrl"
#define AUTOTB_TVIN_ctrl  "../tv/cdatafile/c.x_order_fir.autotvin_ctrl.dat"

#define INTER_TCL  "../tv/cdatafile/ref.tcl"

// tvout file define: "y_data"
#define AUTOTB_TVOUT_PC_y_data  "../tv/rtldatafile/rtl.x_order_fir.autotvout_y_data.dat"
// tvout file define: "y_user_V"
#define AUTOTB_TVOUT_PC_y_user_V  "../tv/rtldatafile/rtl.x_order_fir.autotvout_y_user_V.dat"
// tvout file define: "y_last_V"
#define AUTOTB_TVOUT_PC_y_last_V  "../tv/rtldatafile/rtl.x_order_fir.autotvout_y_last_V.dat"

class INTER_TCL_FILE {
	public:
		INTER_TCL_FILE(const char* name) {
			mName = name;
			gmem_depth = 0;
			y_data_depth = 0;
			y_user_V_depth = 0;
			y_last_V_depth = 0;
			x_data_depth = 0;
			x_user_V_depth = 0;
			x_last_V_depth = 0;
			coe_depth = 0;
			ctrl_depth = 0;
			trans_num =0;
		}

		~INTER_TCL_FILE() {
			mFile.open(mName);
			if (!mFile.good()) {
				cout << "Failed to open file ref.tcl" << endl;
				exit (1);
			}
			string total_list = get_depth_list();
			mFile << "set depth_list {\n";
			mFile << total_list;
			mFile << "}\n";
			mFile << "set trans_num "<<trans_num<<endl;
			mFile.close();
		}

		string get_depth_list () {
			stringstream total_list;
			total_list << "{gmem " << gmem_depth << "}\n";
			total_list << "{y_data " << y_data_depth << "}\n";
			total_list << "{y_user_V " << y_user_V_depth << "}\n";
			total_list << "{y_last_V " << y_last_V_depth << "}\n";
			total_list << "{x_data " << x_data_depth << "}\n";
			total_list << "{x_user_V " << x_user_V_depth << "}\n";
			total_list << "{x_last_V " << x_last_V_depth << "}\n";
			total_list << "{coe " << coe_depth << "}\n";
			total_list << "{ctrl " << ctrl_depth << "}\n";
			return total_list.str();
		}

		void set_num (int num , int* class_num) {
			(*class_num) = (*class_num) > num ? (*class_num) : num;
		}
	public:
		int gmem_depth;
		int y_data_depth;
		int y_user_V_depth;
		int y_last_V_depth;
		int x_data_depth;
		int x_user_V_depth;
		int x_last_V_depth;
		int coe_depth;
		int ctrl_depth;
		int trans_num;

	private:
		ofstream mFile;
		const char* mName;
};

extern void x_order_fir (
data_t* y,
data_t* x,
int* coe,
int* ctrl);

void AESL_WRAP_x_order_fir (
data_t* y,
data_t* x,
int* coe,
int* ctrl)
{
	refine_signal_handler();
	fstream wrapc_switch_file_token;
	wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
	int AESL_i;
	if (wrapc_switch_file_token.good())
	{
		CodeState = ENTER_WRAPC_PC;
		static unsigned AESL_transaction_pc = 0;
		string AESL_token;
		string AESL_num;
		static AESL_FILE_HANDLER aesl_fh;


		// output port post check: "y_data"
		aesl_fh.read(AUTOTB_TVOUT_PC_y_data, AESL_token); // [[transaction]]
		if (AESL_token != "[[transaction]]")
		{
			exit(1);
		}
		aesl_fh.read(AUTOTB_TVOUT_PC_y_data, AESL_num); // transaction number

		if (atoi(AESL_num.c_str()) == AESL_transaction_pc)
		{
			aesl_fh.read(AUTOTB_TVOUT_PC_y_data, AESL_token); // data

			sc_bv<32> *y_data_pc_buffer = new sc_bv<32>[1];
			int i = 0;

			while (AESL_token != "[[/transaction]]")
			{
				bool no_x = false;
				bool err = false;

				// search and replace 'X' with "0" from the 1st char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('X');
					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'y_data', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				no_x = false;

				// search and replace 'x' with "0" from the 3rd char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('x', 2);

					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'y_data', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				// push token into output port buffer
				if (AESL_token != "")
				{
					y_data_pc_buffer[i] = AESL_token.c_str();
					i++;
				}

				aesl_fh.read(AUTOTB_TVOUT_PC_y_data, AESL_token); // data or [[/transaction]]

				if (AESL_token == "[[[/runtime]]]" || aesl_fh.eof(AUTOTB_TVOUT_PC_y_data))
				{
					exit(1);
				}
			}

			// ***********************************
			if (i > 0)
			{
				// RTL Name: y_data
				{
					// bitslice(31, 0)
					// {
						// celement: y.data(31, 0)
						// {
							sc_lv<32>* y_data_lv0_0_0_1 = new sc_lv<32>[1];
						// }
					// }

					// bitslice(31, 0)
					{
						int hls_map_index = 0;
						// celement: y.data(31, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								if (&(y[0].data) != NULL) // check the null address if the c port is array or others
								{
									y_data_lv0_0_0_1[hls_map_index].range(31, 0) = sc_bv<32>(y_data_pc_buffer[hls_map_index].range(31, 0));
									hls_map_index++;
								}
							}
						}
					}

					// bitslice(31, 0)
					{
						int hls_map_index = 0;
						// celement: y.data(31, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								// sub                    : i_0
								// ori_name               : y[i_0].data
								// sub_1st_elem           : 0
								// ori_name_1st_elem      : y[0].data
								// output_left_conversion : y[i_0].data
								// output_type_conversion : (y_data_lv0_0_0_1[hls_map_index]).to_uint64()
								if (&(y[0].data) != NULL) // check the null address if the c port is array or others
								{
									y[i_0].data = (y_data_lv0_0_0_1[hls_map_index]).to_uint64();
									hls_map_index++;
								}
							}
						}
					}
				}
			}

			// release memory allocation
			delete [] y_data_pc_buffer;
		}

		// output port post check: "y_user_V"
		aesl_fh.read(AUTOTB_TVOUT_PC_y_user_V, AESL_token); // [[transaction]]
		if (AESL_token != "[[transaction]]")
		{
			exit(1);
		}
		aesl_fh.read(AUTOTB_TVOUT_PC_y_user_V, AESL_num); // transaction number

		if (atoi(AESL_num.c_str()) == AESL_transaction_pc)
		{
			aesl_fh.read(AUTOTB_TVOUT_PC_y_user_V, AESL_token); // data

			sc_bv<1> *y_user_V_pc_buffer = new sc_bv<1>[1];
			int i = 0;

			while (AESL_token != "[[/transaction]]")
			{
				bool no_x = false;
				bool err = false;

				// search and replace 'X' with "0" from the 1st char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('X');
					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'y_user_V', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				no_x = false;

				// search and replace 'x' with "0" from the 3rd char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('x', 2);

					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'y_user_V', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				// push token into output port buffer
				if (AESL_token != "")
				{
					y_user_V_pc_buffer[i] = AESL_token.c_str();
					i++;
				}

				aesl_fh.read(AUTOTB_TVOUT_PC_y_user_V, AESL_token); // data or [[/transaction]]

				if (AESL_token == "[[[/runtime]]]" || aesl_fh.eof(AUTOTB_TVOUT_PC_y_user_V))
				{
					exit(1);
				}
			}

			// ***********************************
			if (i > 0)
			{
				// RTL Name: y_user_V
				{
					// bitslice(0, 0)
					// {
						// celement: y.user.V(0, 0)
						// {
							sc_lv<1>* y_user_V_lv0_0_0_1 = new sc_lv<1>[1];
						// }
					// }

					// bitslice(0, 0)
					{
						int hls_map_index = 0;
						// celement: y.user.V(0, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								if (&(y[0].user) != NULL) // check the null address if the c port is array or others
								{
									y_user_V_lv0_0_0_1[hls_map_index].range(0, 0) = sc_bv<1>(y_user_V_pc_buffer[hls_map_index].range(0, 0));
									hls_map_index++;
								}
							}
						}
					}

					// bitslice(0, 0)
					{
						int hls_map_index = 0;
						// celement: y.user.V(0, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								// sub                    : i_0
								// ori_name               : y[i_0].user
								// sub_1st_elem           : 0
								// ori_name_1st_elem      : y[0].user
								// output_left_conversion : y[i_0].user
								// output_type_conversion : (y_user_V_lv0_0_0_1[hls_map_index]).to_string(SC_BIN).c_str()
								if (&(y[0].user) != NULL) // check the null address if the c port is array or others
								{
									y[i_0].user = (y_user_V_lv0_0_0_1[hls_map_index]).to_string(SC_BIN).c_str();
									hls_map_index++;
								}
							}
						}
					}
				}
			}

			// release memory allocation
			delete [] y_user_V_pc_buffer;
		}

		// output port post check: "y_last_V"
		aesl_fh.read(AUTOTB_TVOUT_PC_y_last_V, AESL_token); // [[transaction]]
		if (AESL_token != "[[transaction]]")
		{
			exit(1);
		}
		aesl_fh.read(AUTOTB_TVOUT_PC_y_last_V, AESL_num); // transaction number

		if (atoi(AESL_num.c_str()) == AESL_transaction_pc)
		{
			aesl_fh.read(AUTOTB_TVOUT_PC_y_last_V, AESL_token); // data

			sc_bv<1> *y_last_V_pc_buffer = new sc_bv<1>[1];
			int i = 0;

			while (AESL_token != "[[/transaction]]")
			{
				bool no_x = false;
				bool err = false;

				// search and replace 'X' with "0" from the 1st char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('X');
					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'y_last_V', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				no_x = false;

				// search and replace 'x' with "0" from the 3rd char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('x', 2);

					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'y_last_V', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				// push token into output port buffer
				if (AESL_token != "")
				{
					y_last_V_pc_buffer[i] = AESL_token.c_str();
					i++;
				}

				aesl_fh.read(AUTOTB_TVOUT_PC_y_last_V, AESL_token); // data or [[/transaction]]

				if (AESL_token == "[[[/runtime]]]" || aesl_fh.eof(AUTOTB_TVOUT_PC_y_last_V))
				{
					exit(1);
				}
			}

			// ***********************************
			if (i > 0)
			{
				// RTL Name: y_last_V
				{
					// bitslice(0, 0)
					// {
						// celement: y.last.V(0, 0)
						// {
							sc_lv<1>* y_last_V_lv0_0_0_1 = new sc_lv<1>[1];
						// }
					// }

					// bitslice(0, 0)
					{
						int hls_map_index = 0;
						// celement: y.last.V(0, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								if (&(y[0].last) != NULL) // check the null address if the c port is array or others
								{
									y_last_V_lv0_0_0_1[hls_map_index].range(0, 0) = sc_bv<1>(y_last_V_pc_buffer[hls_map_index].range(0, 0));
									hls_map_index++;
								}
							}
						}
					}

					// bitslice(0, 0)
					{
						int hls_map_index = 0;
						// celement: y.last.V(0, 0)
						{
							// carray: (0) => (0) @ (1)
							for (int i_0 = 0; i_0 <= 0; i_0 += 1)
							{
								// sub                    : i_0
								// ori_name               : y[i_0].last
								// sub_1st_elem           : 0
								// ori_name_1st_elem      : y[0].last
								// output_left_conversion : y[i_0].last
								// output_type_conversion : (y_last_V_lv0_0_0_1[hls_map_index]).to_string(SC_BIN).c_str()
								if (&(y[0].last) != NULL) // check the null address if the c port is array or others
								{
									y[i_0].last = (y_last_V_lv0_0_0_1[hls_map_index]).to_string(SC_BIN).c_str();
									hls_map_index++;
								}
							}
						}
					}
				}
			}

			// release memory allocation
			delete [] y_last_V_pc_buffer;
		}

		AESL_transaction_pc++;
	}
	else
	{
		CodeState = ENTER_WRAPC;
		static unsigned AESL_transaction;

		static AESL_FILE_HANDLER aesl_fh;

		// "gmem"
		char* tvin_gmem = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_gmem);

		// "y_data"
		char* tvin_y_data = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_y_data);
		char* tvout_y_data = new char[50];
		aesl_fh.touch(AUTOTB_TVOUT_y_data);

		// "y_user_V"
		char* tvin_y_user_V = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_y_user_V);
		char* tvout_y_user_V = new char[50];
		aesl_fh.touch(AUTOTB_TVOUT_y_user_V);

		// "y_last_V"
		char* tvin_y_last_V = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_y_last_V);
		char* tvout_y_last_V = new char[50];
		aesl_fh.touch(AUTOTB_TVOUT_y_last_V);

		// "x_data"
		char* tvin_x_data = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_x_data);

		// "x_user_V"
		char* tvin_x_user_V = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_x_user_V);

		// "x_last_V"
		char* tvin_x_last_V = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_x_last_V);

		// "coe"
		char* tvin_coe = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_coe);

		// "ctrl"
		char* tvin_ctrl = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_ctrl);

		CodeState = DUMP_INPUTS;
		static INTER_TCL_FILE tcl_file(INTER_TCL);
		int leading_zero;

		// [[transaction]]
		sprintf(tvin_gmem, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_gmem, tvin_gmem);

		sc_bv<32>* gmem_tvin_wrapc_buffer = new sc_bv<32>[1280];

		// RTL Name: gmem
		{
			// bitslice(31, 0)
			{
				int hls_map_index = 0;
				// celement: coe(31, 0)
				{
					// carray: (0) => (1023) @ (1)
					for (int i_0 = 0; i_0 <= 1023; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : coe[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : coe[0]
						// regulate_c_name       : coe
						// input_type_conversion : coe[i_0]
						if (&(coe[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<32> coe_tmp_mem;
							coe_tmp_mem = coe[i_0];
							gmem_tvin_wrapc_buffer[hls_map_index].range(31, 0) = coe_tmp_mem.range(31, 0);
                                 	       hls_map_index++;
						}
					}
				}
				// celement: ctrl(31, 0)
				{
					// carray: (0) => (255) @ (1)
					for (int i_0 = 0; i_0 <= 255; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : ctrl[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : ctrl[0]
						// regulate_c_name       : ctrl
						// input_type_conversion : ctrl[i_0]
						if (&(ctrl[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<32> ctrl_tmp_mem;
							ctrl_tmp_mem = ctrl[i_0];
							gmem_tvin_wrapc_buffer[hls_map_index].range(31, 0) = ctrl_tmp_mem.range(31, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1280; i++)
		{
			sprintf(tvin_gmem, "%s\n", (gmem_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_gmem, tvin_gmem);
		}

		tcl_file.set_num(1280, &tcl_file.gmem_depth);
		sprintf(tvin_gmem, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_gmem, tvin_gmem);

		// release memory allocation
		delete [] gmem_tvin_wrapc_buffer;

		// [[transaction]]
		sprintf(tvin_y_data, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_y_data, tvin_y_data);

		sc_bv<32>* y_data_tvin_wrapc_buffer = new sc_bv<32>[1];

		// RTL Name: y_data
		{
			// bitslice(31, 0)
			{
				int hls_map_index = 0;
				// celement: y.data(31, 0)
				{
					// carray: (0) => (0) @ (1)
					for (int i_0 = 0; i_0 <= 0; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : y[i_0].data
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : y[0].data
						// regulate_c_name       : y_data
						// input_type_conversion : y[i_0].data
						if (&(y[0].data) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<32> y_data_tmp_mem;
							y_data_tmp_mem = y[i_0].data;
							y_data_tvin_wrapc_buffer[hls_map_index].range(31, 0) = y_data_tmp_mem.range(31, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvin_y_data, "%s\n", (y_data_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_y_data, tvin_y_data);
		}

		tcl_file.set_num(1, &tcl_file.y_data_depth);
		sprintf(tvin_y_data, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_y_data, tvin_y_data);

		// release memory allocation
		delete [] y_data_tvin_wrapc_buffer;

		// [[transaction]]
		sprintf(tvin_y_user_V, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_y_user_V, tvin_y_user_V);

		sc_bv<1>* y_user_V_tvin_wrapc_buffer = new sc_bv<1>[1];

		// RTL Name: y_user_V
		{
			// bitslice(0, 0)
			{
				int hls_map_index = 0;
				// celement: y.user.V(0, 0)
				{
					// carray: (0) => (0) @ (1)
					for (int i_0 = 0; i_0 <= 0; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : y[i_0].user
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : y[0].user
						// regulate_c_name       : y_user_V
						// input_type_conversion : (y[i_0].user).to_string(2).c_str()
						if (&(y[0].user) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<1> y_user_V_tmp_mem;
							y_user_V_tmp_mem = (y[i_0].user).to_string(2).c_str();
							y_user_V_tvin_wrapc_buffer[hls_map_index].range(0, 0) = y_user_V_tmp_mem.range(0, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvin_y_user_V, "%s\n", (y_user_V_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_y_user_V, tvin_y_user_V);
		}

		tcl_file.set_num(1, &tcl_file.y_user_V_depth);
		sprintf(tvin_y_user_V, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_y_user_V, tvin_y_user_V);

		// release memory allocation
		delete [] y_user_V_tvin_wrapc_buffer;

		// [[transaction]]
		sprintf(tvin_y_last_V, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_y_last_V, tvin_y_last_V);

		sc_bv<1>* y_last_V_tvin_wrapc_buffer = new sc_bv<1>[1];

		// RTL Name: y_last_V
		{
			// bitslice(0, 0)
			{
				int hls_map_index = 0;
				// celement: y.last.V(0, 0)
				{
					// carray: (0) => (0) @ (1)
					for (int i_0 = 0; i_0 <= 0; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : y[i_0].last
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : y[0].last
						// regulate_c_name       : y_last_V
						// input_type_conversion : (y[i_0].last).to_string(2).c_str()
						if (&(y[0].last) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<1> y_last_V_tmp_mem;
							y_last_V_tmp_mem = (y[i_0].last).to_string(2).c_str();
							y_last_V_tvin_wrapc_buffer[hls_map_index].range(0, 0) = y_last_V_tmp_mem.range(0, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvin_y_last_V, "%s\n", (y_last_V_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_y_last_V, tvin_y_last_V);
		}

		tcl_file.set_num(1, &tcl_file.y_last_V_depth);
		sprintf(tvin_y_last_V, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_y_last_V, tvin_y_last_V);

		// release memory allocation
		delete [] y_last_V_tvin_wrapc_buffer;

		// [[transaction]]
		sprintf(tvin_x_data, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_x_data, tvin_x_data);

		sc_bv<32>* x_data_tvin_wrapc_buffer = new sc_bv<32>[1];

		// RTL Name: x_data
		{
			// bitslice(31, 0)
			{
				int hls_map_index = 0;
				// celement: x.data(31, 0)
				{
					// carray: (0) => (0) @ (1)
					for (int i_0 = 0; i_0 <= 0; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : x[i_0].data
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : x[0].data
						// regulate_c_name       : x_data
						// input_type_conversion : x[i_0].data
						if (&(x[0].data) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<32> x_data_tmp_mem;
							x_data_tmp_mem = x[i_0].data;
							x_data_tvin_wrapc_buffer[hls_map_index].range(31, 0) = x_data_tmp_mem.range(31, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvin_x_data, "%s\n", (x_data_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_x_data, tvin_x_data);
		}

		tcl_file.set_num(1, &tcl_file.x_data_depth);
		sprintf(tvin_x_data, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_x_data, tvin_x_data);

		// release memory allocation
		delete [] x_data_tvin_wrapc_buffer;

		// [[transaction]]
		sprintf(tvin_x_user_V, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_x_user_V, tvin_x_user_V);

		sc_bv<1>* x_user_V_tvin_wrapc_buffer = new sc_bv<1>[1];

		// RTL Name: x_user_V
		{
			// bitslice(0, 0)
			{
				int hls_map_index = 0;
				// celement: x.user.V(0, 0)
				{
					// carray: (0) => (0) @ (1)
					for (int i_0 = 0; i_0 <= 0; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : x[i_0].user
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : x[0].user
						// regulate_c_name       : x_user_V
						// input_type_conversion : (x[i_0].user).to_string(2).c_str()
						if (&(x[0].user) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<1> x_user_V_tmp_mem;
							x_user_V_tmp_mem = (x[i_0].user).to_string(2).c_str();
							x_user_V_tvin_wrapc_buffer[hls_map_index].range(0, 0) = x_user_V_tmp_mem.range(0, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvin_x_user_V, "%s\n", (x_user_V_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_x_user_V, tvin_x_user_V);
		}

		tcl_file.set_num(1, &tcl_file.x_user_V_depth);
		sprintf(tvin_x_user_V, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_x_user_V, tvin_x_user_V);

		// release memory allocation
		delete [] x_user_V_tvin_wrapc_buffer;

		// [[transaction]]
		sprintf(tvin_x_last_V, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_x_last_V, tvin_x_last_V);

		sc_bv<1>* x_last_V_tvin_wrapc_buffer = new sc_bv<1>[1];

		// RTL Name: x_last_V
		{
			// bitslice(0, 0)
			{
				int hls_map_index = 0;
				// celement: x.last.V(0, 0)
				{
					// carray: (0) => (0) @ (1)
					for (int i_0 = 0; i_0 <= 0; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : x[i_0].last
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : x[0].last
						// regulate_c_name       : x_last_V
						// input_type_conversion : (x[i_0].last).to_string(2).c_str()
						if (&(x[0].last) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<1> x_last_V_tmp_mem;
							x_last_V_tmp_mem = (x[i_0].last).to_string(2).c_str();
							x_last_V_tvin_wrapc_buffer[hls_map_index].range(0, 0) = x_last_V_tmp_mem.range(0, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvin_x_last_V, "%s\n", (x_last_V_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_x_last_V, tvin_x_last_V);
		}

		tcl_file.set_num(1, &tcl_file.x_last_V_depth);
		sprintf(tvin_x_last_V, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_x_last_V, tvin_x_last_V);

		// release memory allocation
		delete [] x_last_V_tvin_wrapc_buffer;

		// [[transaction]]
		sprintf(tvin_coe, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_coe, tvin_coe);

		sc_bv<32> coe_tvin_wrapc_buffer;

		// RTL Name: coe
		{
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvin_coe, "%s\n", (coe_tvin_wrapc_buffer).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_coe, tvin_coe);
		}

		tcl_file.set_num(1, &tcl_file.coe_depth);
		sprintf(tvin_coe, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_coe, tvin_coe);

		// [[transaction]]
		sprintf(tvin_ctrl, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_ctrl, tvin_ctrl);

		sc_bv<32> ctrl_tvin_wrapc_buffer;

		// RTL Name: ctrl
		{
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvin_ctrl, "%s\n", (ctrl_tvin_wrapc_buffer).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_ctrl, tvin_ctrl);
		}

		tcl_file.set_num(1, &tcl_file.ctrl_depth);
		sprintf(tvin_ctrl, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_ctrl, tvin_ctrl);

// [call_c_dut] ---------->

		CodeState = CALL_C_DUT;
		x_order_fir(y, x, coe, ctrl);

		CodeState = DUMP_OUTPUTS;

		// [[transaction]]
		sprintf(tvout_y_data, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVOUT_y_data, tvout_y_data);

		sc_bv<32>* y_data_tvout_wrapc_buffer = new sc_bv<32>[1];

		// RTL Name: y_data
		{
			// bitslice(31, 0)
			{
				int hls_map_index = 0;
				// celement: y.data(31, 0)
				{
					// carray: (0) => (0) @ (1)
					for (int i_0 = 0; i_0 <= 0; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : y[i_0].data
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : y[0].data
						// regulate_c_name       : y_data
						// input_type_conversion : y[i_0].data
						if (&(y[0].data) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<32> y_data_tmp_mem;
							y_data_tmp_mem = y[i_0].data;
							y_data_tvout_wrapc_buffer[hls_map_index].range(31, 0) = y_data_tmp_mem.range(31, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvout_y_data, "%s\n", (y_data_tvout_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVOUT_y_data, tvout_y_data);
		}

		tcl_file.set_num(1, &tcl_file.y_data_depth);
		sprintf(tvout_y_data, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVOUT_y_data, tvout_y_data);

		// release memory allocation
		delete [] y_data_tvout_wrapc_buffer;

		// [[transaction]]
		sprintf(tvout_y_user_V, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVOUT_y_user_V, tvout_y_user_V);

		sc_bv<1>* y_user_V_tvout_wrapc_buffer = new sc_bv<1>[1];

		// RTL Name: y_user_V
		{
			// bitslice(0, 0)
			{
				int hls_map_index = 0;
				// celement: y.user.V(0, 0)
				{
					// carray: (0) => (0) @ (1)
					for (int i_0 = 0; i_0 <= 0; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : y[i_0].user
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : y[0].user
						// regulate_c_name       : y_user_V
						// input_type_conversion : (y[i_0].user).to_string(2).c_str()
						if (&(y[0].user) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<1> y_user_V_tmp_mem;
							y_user_V_tmp_mem = (y[i_0].user).to_string(2).c_str();
							y_user_V_tvout_wrapc_buffer[hls_map_index].range(0, 0) = y_user_V_tmp_mem.range(0, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvout_y_user_V, "%s\n", (y_user_V_tvout_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVOUT_y_user_V, tvout_y_user_V);
		}

		tcl_file.set_num(1, &tcl_file.y_user_V_depth);
		sprintf(tvout_y_user_V, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVOUT_y_user_V, tvout_y_user_V);

		// release memory allocation
		delete [] y_user_V_tvout_wrapc_buffer;

		// [[transaction]]
		sprintf(tvout_y_last_V, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVOUT_y_last_V, tvout_y_last_V);

		sc_bv<1>* y_last_V_tvout_wrapc_buffer = new sc_bv<1>[1];

		// RTL Name: y_last_V
		{
			// bitslice(0, 0)
			{
				int hls_map_index = 0;
				// celement: y.last.V(0, 0)
				{
					// carray: (0) => (0) @ (1)
					for (int i_0 = 0; i_0 <= 0; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : y[i_0].last
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : y[0].last
						// regulate_c_name       : y_last_V
						// input_type_conversion : (y[i_0].last).to_string(2).c_str()
						if (&(y[0].last) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<1> y_last_V_tmp_mem;
							y_last_V_tmp_mem = (y[i_0].last).to_string(2).c_str();
							y_last_V_tvout_wrapc_buffer[hls_map_index].range(0, 0) = y_last_V_tmp_mem.range(0, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvout_y_last_V, "%s\n", (y_last_V_tvout_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVOUT_y_last_V, tvout_y_last_V);
		}

		tcl_file.set_num(1, &tcl_file.y_last_V_depth);
		sprintf(tvout_y_last_V, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVOUT_y_last_V, tvout_y_last_V);

		// release memory allocation
		delete [] y_last_V_tvout_wrapc_buffer;

		CodeState = DELETE_CHAR_BUFFERS;
		// release memory allocation: "gmem"
		delete [] tvin_gmem;
		// release memory allocation: "y_data"
		delete [] tvout_y_data;
		delete [] tvin_y_data;
		// release memory allocation: "y_user_V"
		delete [] tvout_y_user_V;
		delete [] tvin_y_user_V;
		// release memory allocation: "y_last_V"
		delete [] tvout_y_last_V;
		delete [] tvin_y_last_V;
		// release memory allocation: "x_data"
		delete [] tvin_x_data;
		// release memory allocation: "x_user_V"
		delete [] tvin_x_user_V;
		// release memory allocation: "x_last_V"
		delete [] tvin_x_last_V;
		// release memory allocation: "coe"
		delete [] tvin_coe;
		// release memory allocation: "ctrl"
		delete [] tvin_ctrl;

		AESL_transaction++;

		tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
	}
}

