/*
 *  yosys -- Yosys Open SYnthesis Suite
 *
 *  Copyright (C) 2012  Clifford Wolf <clifford@clifford.at>
 *  
 *  Permission to use, copy, modify, and/or distribute this software for any
 *  purpose with or without fee is hereby granted, provided that the above
 *  copyright notice and this permission notice appear in all copies.
 *  
 *  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 *  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 *  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 *  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 *  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 *  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 *  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 *  ---
 *
 *  The Simulation Library.
 *
 *  This verilog library contains simple simulation models for the internal
 *  cells ($not, ...) generated by the frontends and used in most passes.
 *
 *  This library can be used to verify the internal netlists as generated
 *  by the different frontends and passes.
 *
 *  Note that memory can only be simulated when all $memrd and $memwr cells
 *  have been merged to stand-alone $mem cells (this is what the "memory_collect"
 *  pass is doing).
 *
 */

`define INPUT_A \
input [A_WIDTH-1:0] A; \
generate if (A_SIGNED) begin:A_BUF wire signed [A_WIDTH-1:0] val = A; end else begin:A_BUF wire [A_WIDTH-1:0] val = A; end endgenerate

`define INPUT_B \
input [B_WIDTH-1:0] B; \
generate if (B_SIGNED) begin:B_BUF wire signed [B_WIDTH-1:0] val = B; end else begin:B_BUF wire [B_WIDTH-1:0] val = B; end endgenerate

// --------------------------------------------------------

module \$not (A, Y);

parameter A_SIGNED = 0;
parameter A_WIDTH = 0;
parameter Y_WIDTH = 0;

`INPUT_A
output [Y_WIDTH-1:0] Y;

assign Y = ~A_BUF.val;

endmodule


// --------------------------------------------------------

module \$pos (A, Y);

parameter A_SIGNED = 0;
parameter A_WIDTH = 0;
parameter Y_WIDTH = 0;

`INPUT_A
output [Y_WIDTH-1:0] Y;

assign Y = +A_BUF.val;

endmodule

// --------------------------------------------------------

module \$neg (A, Y);

parameter A_SIGNED = 0;
parameter A_WIDTH = 0;
parameter Y_WIDTH = 0;

`INPUT_A
output [Y_WIDTH-1:0] Y;

assign Y = -A_BUF.val;

endmodule

// --------------------------------------------------------

module \$and (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

`INPUT_A
`INPUT_B
output [Y_WIDTH-1:0] Y;

assign Y = A_BUF.val & B_BUF.val;

endmodule

// --------------------------------------------------------

module \$or (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

`INPUT_A
`INPUT_B
output [Y_WIDTH-1:0] Y;

assign Y = A_BUF.val | B_BUF.val;

endmodule

// --------------------------------------------------------

module \$xor (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

`INPUT_A
`INPUT_B
output [Y_WIDTH-1:0] Y;

assign Y = A_BUF.val ^ B_BUF.val;

endmodule

// --------------------------------------------------------

module \$xnor (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

`INPUT_A
`INPUT_B
output [Y_WIDTH-1:0] Y;

assign Y = A_BUF.val ~^ B_BUF.val;

endmodule

// --------------------------------------------------------

module \$reduce_and (A, Y);

parameter A_SIGNED = 0;
parameter A_WIDTH = 0;
parameter Y_WIDTH = 0;

`INPUT_A
output Y;

assign Y = &A_BUF.val;

endmodule

// --------------------------------------------------------

module \$reduce_or (A, Y);

parameter A_SIGNED = 0;
parameter A_WIDTH = 0;
parameter Y_WIDTH = 0;

`INPUT_A
output Y;

assign Y = |A_BUF.val;

endmodule

// --------------------------------------------------------

module \$reduce_xor (A, Y);

parameter A_SIGNED = 0;
parameter A_WIDTH = 0;
parameter Y_WIDTH = 0;

`INPUT_A
output Y;

assign Y = ^A_BUF.val;

endmodule

// --------------------------------------------------------

module \$reduce_xnor (A, Y);

parameter A_SIGNED = 0;
parameter A_WIDTH = 0;
parameter Y_WIDTH = 0;

`INPUT_A
output Y;

assign Y = ~^A_BUF.val;

endmodule

// --------------------------------------------------------

module \$reduce_bool (A, Y);

parameter A_SIGNED = 0;
parameter A_WIDTH = 0;
parameter Y_WIDTH = 0;

`INPUT_A
output Y;

assign Y = A_BUF.val != 0;

endmodule

// --------------------------------------------------------

module \$shl (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

`INPUT_A
`INPUT_B
output [Y_WIDTH-1:0] Y;

assign Y = A_BUF.val << B_BUF.val;

endmodule

// --------------------------------------------------------

module \$shr (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

`INPUT_A
`INPUT_B
output [Y_WIDTH-1:0] Y;

assign Y = A_BUF.val >> B_BUF.val;

endmodule

// --------------------------------------------------------

module \$sshl (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

`INPUT_A
`INPUT_B
output [Y_WIDTH-1:0] Y;

assign Y = A_BUF.val <<< B_BUF.val;

endmodule

// --------------------------------------------------------

module \$sshr (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

`INPUT_A
`INPUT_B
output [Y_WIDTH-1:0] Y;

assign Y = A_BUF.val >>> B_BUF.val;

endmodule

// --------------------------------------------------------

module \$lt (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

`INPUT_A
`INPUT_B
output [Y_WIDTH-1:0] Y;

assign Y = A_BUF.val < B_BUF.val;

endmodule

// --------------------------------------------------------

module \$le (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

`INPUT_A
`INPUT_B
output [Y_WIDTH-1:0] Y;

assign Y = A_BUF.val <= B_BUF.val;

endmodule

// --------------------------------------------------------

module \$eq (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

`INPUT_A
`INPUT_B
output [Y_WIDTH-1:0] Y;

assign Y = A_BUF.val == B_BUF.val;

endmodule

// --------------------------------------------------------

module \$ne (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

`INPUT_A
`INPUT_B
output [Y_WIDTH-1:0] Y;

assign Y = A_BUF.val != B_BUF.val;

endmodule

// --------------------------------------------------------

module \$ge (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

`INPUT_A
`INPUT_B
output [Y_WIDTH-1:0] Y;

assign Y = A_BUF.val >= B_BUF.val;

endmodule

// --------------------------------------------------------

module \$gt (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

`INPUT_A
`INPUT_B
output [Y_WIDTH-1:0] Y;

assign Y = A_BUF.val > B_BUF.val;

endmodule

// --------------------------------------------------------

module \$add (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

`INPUT_A
`INPUT_B
output [Y_WIDTH-1:0] Y;

assign Y = A_BUF.val + B_BUF.val;

endmodule

// --------------------------------------------------------

module \$sub (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

`INPUT_A
`INPUT_B
output [Y_WIDTH-1:0] Y;

assign Y = A_BUF.val - B_BUF.val;

endmodule

// --------------------------------------------------------

module \$mul (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

`INPUT_A
`INPUT_B
output [Y_WIDTH-1:0] Y;

assign Y = A_BUF.val * B_BUF.val;

endmodule

// --------------------------------------------------------

module \$div (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

`INPUT_A
`INPUT_B
output [Y_WIDTH-1:0] Y;

assign Y = A_BUF.val / B_BUF.val;

endmodule

// --------------------------------------------------------

module \$mod (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

`INPUT_A
`INPUT_B
output [Y_WIDTH-1:0] Y;

assign Y = A_BUF.val % B_BUF.val;

endmodule

// --------------------------------------------------------

module \$pow (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

`INPUT_A
`INPUT_B
output [Y_WIDTH-1:0] Y;

assign Y = A_BUF.val ** B_BUF.val;

endmodule

// --------------------------------------------------------

module \$logic_not (A, Y);

parameter A_SIGNED = 0;
parameter A_WIDTH = 0;
parameter Y_WIDTH = 0;

`INPUT_A
output [Y_WIDTH-1:0] Y;

assign Y = !A_BUF.val;

endmodule

// --------------------------------------------------------

module \$logic_and (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

`INPUT_A
`INPUT_B
output [Y_WIDTH-1:0] Y;

assign Y = A_BUF.val && B_BUF.val;

endmodule

// --------------------------------------------------------

module \$logic_or (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

`INPUT_A
`INPUT_B
output [Y_WIDTH-1:0] Y;

assign Y = A_BUF.val || B_BUF.val;

endmodule

// --------------------------------------------------------

module \$mux (A, B, S, Y);

parameter WIDTH = 0;

input [WIDTH-1:0] A, B;
input S;
output reg [WIDTH-1:0] Y;

always @* begin
	if (S)
		Y = B;
	else
		Y = A;
end

endmodule

// --------------------------------------------------------

module \$pmux (A, B, S, Y);

parameter WIDTH = 0;
parameter S_WIDTH = 0;

input [WIDTH-1:0] A;
input [WIDTH*S_WIDTH-1:0] B;
input [S_WIDTH-1:0] S;
output reg [WIDTH-1:0] Y;

integer i;

always @* begin
	Y = A;
	for (i = 0; i < S_WIDTH; i = i+1)
		if (S[i])
			Y = B >> (WIDTH*i);
end

endmodule

// --------------------------------------------------------

module \$safe_pmux (A, B, S, Y);

parameter WIDTH = 0;
parameter S_WIDTH = 0;

input [WIDTH-1:0] A;
input [WIDTH*S_WIDTH-1:0] B;
input [S_WIDTH-1:0] S;
output reg [WIDTH-1:0] Y;

integer i, j;

always @* begin
	j = 0;
	for (i = 0; i < S_WIDTH; i = i+1)
		if (S[i]) begin
			Y = B >> (WIDTH*i);
			j = j + 1;
		end
	if (j != 1)
		Y = A;
end

endmodule

// --------------------------------------------------------

module \$lut (I, O);

parameter WIDTH = 0;
parameter LUT = 0;

input [WIDTH-1:0] I;
output reg O;

wire lut0_out, lut1_out;

generate
	if (WIDTH <= 1) begin:simple
		assign {lut1_out, lut0_out} = LUT;
	end else begin:complex
		\$lut #( .WIDTH(WIDTH-1), .LUT(LUT                  ) ) lut0 ( .I(I[WIDTH-2:0]), .O(lut0_out) );
		\$lut #( .WIDTH(WIDTH-1), .LUT(LUT >> (2**(WIDTH-1))) ) lut1 ( .I(I[WIDTH-2:0]), .O(lut1_out) );
	end
endgenerate

always @*
	casez ({I[WIDTH-1], lut0_out, lut1_out})
		3'b?11: O = 1'b1;
		3'b?00: O = 1'b0;
		3'b0??: O = lut0_out;
		3'b1??: O = lut1_out;
		default: O = 1'bx;
	endcase

endmodule

// --------------------------------------------------------

module \$sr (SET, CLR, Q);

parameter WIDTH = 0;
parameter SET_POLARITY = 1'b1;
parameter CLR_POLARITY = 1'b1;

input [WIDTH-1:0] SET, CLR;
output reg [WIDTH-1:0] Q;

wire [WIDTH-1:0] pos_set = SET_POLARITY ? SET : ~SET;
wire [WIDTH-1:0] pos_clr = CLR_POLARITY ? CLR : ~CLR;

genvar i;
generate
	for (i = 0; i < WIDTH; i = i+1) begin:bit
		always @(posedge pos_set[i], posedge pos_clr[i])
			if (pos_clr[i])
				Q[i] <= 0;
			else if (pos_set[i])
				Q[i] <= 1;
	end
endgenerate

endmodule

// --------------------------------------------------------

module \$dff (CLK, D, Q);

parameter WIDTH = 0;
parameter CLK_POLARITY = 1'b1;

input CLK;
input [WIDTH-1:0] D;
output reg [WIDTH-1:0] Q;
wire pos_clk = CLK == CLK_POLARITY;

always @(posedge pos_clk) begin
	Q <= D;
end

endmodule

// --------------------------------------------------------

module \$dffsr (CLK, SET, CLR, D, Q);

parameter WIDTH = 0;
parameter CLK_POLARITY = 1'b1;
parameter SET_POLARITY = 1'b1;
parameter CLR_POLARITY = 1'b1;

input CLK;
input [WIDTH-1:0] SET, CLR, D;
output reg [WIDTH-1:0] Q;

wire pos_clk = CLK == CLK_POLARITY;
wire [WIDTH-1:0] pos_set = SET_POLARITY ? SET : ~SET;
wire [WIDTH-1:0] pos_clr = CLR_POLARITY ? CLR : ~CLR;

genvar i;
generate
	for (i = 0; i < WIDTH; i = i+1) begin:bit
		always @(posedge pos_set[i], posedge pos_clr[i], posedge pos_clk)
			if (pos_clr[i])
				Q[i] <= 0;
			else if (pos_set[i])
				Q[i] <= 1;
			else
				Q[i] <= D[i];
	end
endgenerate

endmodule

// --------------------------------------------------------

module \$adff (CLK, ARST, D, Q);

parameter WIDTH = 0;
parameter CLK_POLARITY = 1'b1;
parameter ARST_POLARITY = 1'b1;
parameter ARST_VALUE = 0;

input CLK, ARST;
input [WIDTH-1:0] D;
output reg [WIDTH-1:0] Q;
wire pos_clk = CLK == CLK_POLARITY;
wire pos_arst = ARST == ARST_POLARITY;

always @(posedge pos_clk, posedge pos_arst) begin
	if (pos_arst)
		Q <= ARST_VALUE;
	else
		Q <= D;
end

endmodule

// --------------------------------------------------------

module \$dlatch (EN, D, Q);

parameter WIDTH = 0;
parameter EN_POLARITY = 1'b1;

input EN;
input [WIDTH-1:0] D;
output reg [WIDTH-1:0] Q;

always @*
	if (EN == EN_POLARITY)
		Q <= D;

endmodule

// --------------------------------------------------------

module \$fsm (CLK, ARST, CTRL_IN, CTRL_OUT);

parameter NAME = "";

parameter CLK_POLARITY = 1'b1;
parameter ARST_POLARITY = 1'b1;

parameter CTRL_IN_WIDTH = 1;
parameter CTRL_OUT_WIDTH = 1;

parameter STATE_BITS = 1;
parameter STATE_NUM = 1;
parameter STATE_NUM_LOG2 = 1;
parameter STATE_RST = 0;
parameter STATE_TABLE = 1'b0;

parameter TRANS_NUM = 1;
parameter TRANS_TABLE = 4'b0x0x;

input CLK, ARST;
input [CTRL_IN_WIDTH-1:0] CTRL_IN;
output reg [CTRL_OUT_WIDTH-1:0] CTRL_OUT;

wire pos_clk = CLK == CLK_POLARITY;
wire pos_arst = ARST == ARST_POLARITY;

reg [STATE_BITS-1:0] state;
reg [STATE_BITS-1:0] state_tmp;
reg [STATE_BITS-1:0] next_state;

reg [STATE_BITS-1:0] tr_state_in;
reg [STATE_BITS-1:0] tr_state_out;
reg [CTRL_IN_WIDTH-1:0] tr_ctrl_in;
reg [CTRL_OUT_WIDTH-1:0] tr_ctrl_out;

integer i;

task tr_fetch;
	input [31:0] tr_num;
	reg [31:0] tr_pos;
	reg [STATE_NUM_LOG2-1:0] state_num;
	begin
		tr_pos = (2*STATE_NUM_LOG2+CTRL_IN_WIDTH+CTRL_OUT_WIDTH)*tr_num;
		tr_ctrl_out = TRANS_TABLE >> tr_pos;
		tr_pos = tr_pos + CTRL_OUT_WIDTH;
		state_num = TRANS_TABLE >> tr_pos;
		tr_state_out = STATE_TABLE >> (STATE_BITS*state_num);
		tr_pos = tr_pos + STATE_NUM_LOG2;
		tr_ctrl_in = TRANS_TABLE >> tr_pos;
		tr_pos = tr_pos + CTRL_IN_WIDTH;
		state_num = TRANS_TABLE >> tr_pos;
		tr_state_in = STATE_TABLE >> (STATE_BITS*state_num);
		tr_pos = tr_pos + STATE_NUM_LOG2;
	end
endtask

always @(posedge pos_clk, posedge pos_arst) begin
	if (pos_arst)
		state_tmp = STATE_TABLE[STATE_BITS*(STATE_RST+1)-1:STATE_BITS*STATE_RST];
	else
		state_tmp = next_state;
	for (i = 0; i < STATE_BITS; i = i+1)
		if (state_tmp[i] === 1'bz)
			state_tmp[i] = 0;
	state <= state_tmp;
end

always @(state, CTRL_IN) begin
	next_state <= STATE_TABLE[STATE_BITS*(STATE_RST+1)-1:STATE_BITS*STATE_RST];
	CTRL_OUT <= 'bx;
	// $display("---");
	// $display("Q: %b %b", state, CTRL_IN);
	for (i = 0; i < TRANS_NUM; i = i+1) begin
		tr_fetch(i);
		// $display("T: %b %b -> %b %b [%d]", tr_state_in, tr_ctrl_in, tr_state_out, tr_ctrl_out, i);
		casez ({state, CTRL_IN})
			{tr_state_in, tr_ctrl_in}: begin
				// $display("-> %b %b <-   MATCH", state, CTRL_IN);
				{next_state, CTRL_OUT} <= {tr_state_out, tr_ctrl_out};
			end
		endcase
	end
end

endmodule

// --------------------------------------------------------
`ifndef SIMLIB_NOMEM

module \$memrd (CLK, ADDR, DATA);

parameter MEMID = "";
parameter ABITS = 8;
parameter WIDTH = 8;

parameter CLK_ENABLE = 0;
parameter CLK_POLARITY = 0;

input CLK;
input [ABITS-1:0] ADDR;
output [WIDTH-1:0] DATA;

initial begin
	$display("ERROR: Found non-simulatable instance of $memrd!");
	$finish;
end

endmodule

// --------------------------------------------------------

module \$memwr (CLK, EN, ADDR, DATA);

parameter MEMID = "";
parameter ABITS = 8;
parameter WIDTH = 8;

parameter CLK_ENABLE = 0;
parameter CLK_POLARITY = 0;

input CLK, EN;
input [ABITS-1:0] ADDR;
input [WIDTH-1:0] DATA;

initial begin
	$display("ERROR: Found non-simulatable instance of $memwr!");
	$finish;
end

endmodule

// --------------------------------------------------------

module \$mem (RD_CLK, RD_ADDR, RD_DATA, WR_CLK, WR_EN, WR_ADDR, WR_DATA);

parameter MEMID = "";
parameter SIZE = 256;
parameter ABITS = 8;
parameter WIDTH = 8;

parameter RD_PORTS = 1;
parameter RD_CLK_ENABLE = 1'b1;
parameter RD_CLK_POLARITY = 1'b1;

parameter WR_PORTS = 1;
parameter WR_CLK_ENABLE = 1'b1;
parameter WR_CLK_POLARITY = 1'b1;

input [RD_PORTS-1:0] RD_CLK;
input [RD_PORTS*ABITS-1:0] RD_ADDR;
output reg [RD_PORTS*WIDTH-1:0] RD_DATA;

input [WR_PORTS-1:0] WR_CLK, WR_EN;
input [WR_PORTS*ABITS-1:0] WR_ADDR;
input [WR_PORTS*WIDTH-1:0] WR_DATA;

reg [WIDTH-1:0] data [SIZE-1:0];
event update_async_rd;

genvar i;
generate

	for (i = 0; i < RD_PORTS; i = i+1) begin:rd
		if (RD_CLK_ENABLE[i] == 0) begin:rd_noclk
			always @(RD_ADDR or update_async_rd)
				RD_DATA[ (i+1)*WIDTH-1 : i*WIDTH ] <= data[ RD_ADDR[ (i+1)*ABITS-1 : i*ABITS ] ];
		end else
		if (RD_CLK_POLARITY[i] == 1) begin:rd_posclk
			always @(posedge RD_CLK[i])
				RD_DATA[ (i+1)*WIDTH-1 : i*WIDTH ] <= data[ RD_ADDR[ (i+1)*ABITS-1 : i*ABITS ] ];
		end else begin:rd_negclk
			always @(negedge RD_CLK[i])
				RD_DATA[ (i+1)*WIDTH-1 : i*WIDTH ] <= data[ RD_ADDR[ (i+1)*ABITS-1 : i*ABITS ] ];
		end
	end

	for (i = 0; i < WR_PORTS; i = i+1) begin:wr
		if (WR_CLK_ENABLE[i] == 0) begin:wr_noclk
			always @(WR_ADDR or WR_DATA or WR_EN) begin
				if (WR_EN[i]) begin
					data[ WR_ADDR[ (i+1)*ABITS-1 : i*ABITS ] ] <= WR_DATA[ (i+1)*WIDTH-1 : i*WIDTH ];
					#1 -> update_async_rd;
				end
			end
		end else
		if (RD_CLK_POLARITY[i] == 1) begin:rd_posclk
			always @(posedge WR_CLK[i])
				if (WR_EN[i]) begin
					data[ WR_ADDR[ (i+1)*ABITS-1 : i*ABITS ] ] <= WR_DATA[ (i+1)*WIDTH-1 : i*WIDTH ];
					#1 -> update_async_rd;
				end
		end else begin:rd_negclk
			always @(negedge WR_CLK[i])
				if (WR_EN[i]) begin
					data[ WR_ADDR[ (i+1)*ABITS-1 : i*ABITS ] ] <= WR_DATA[ (i+1)*WIDTH-1 : i*WIDTH ];
					#1 -> update_async_rd;
				end
		end
	end

endgenerate

endmodule

`endif
// --------------------------------------------------------
