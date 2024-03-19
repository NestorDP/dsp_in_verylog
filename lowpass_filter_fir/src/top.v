module top(
	clk,
	reset,
	filter_in,
	filter_out
);


input wire	clk;
input wire	reset;
input wire	[15:0] filter_in;
output wire	[15:0] filter_out;

wire	SYNTHESIZED_WIRE_0;
wire	[6:0] SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	[6:0] SYNTHESIZED_WIRE_4;
wire	[15:0] SYNTHESIZED_WIRE_5;



rom	b2v_inst(
	.clock(SYNTHESIZED_WIRE_0),
	.address(SYNTHESIZED_WIRE_1),
	.q(SYNTHESIZED_WIRE_5));


// firlowpass	b2v_inst3(
// 	.clock_ram(SYNTHESIZED_WIRE_2),     
// 	.clk(clk),
// 	.clk_enable(SYNTHESIZED_WIRE_3),
// 	.reset(reset),
// 	.address(SYNTHESIZED_WIRE_4),
// 	.dados(SYNTHESIZED_WIRE_5),
// 	.filter_in(filter_in),
// 	.filter_out(filter_out));


fsm	b2v_inst4(
	.clk(clk),
	.reset(reset),
	.clock_rom(SYNTHESIZED_WIRE_0),
	.clock_ram(SYNTHESIZED_WIRE_2),
	.wren(SYNTHESIZED_WIRE_3),
	.a_ram(SYNTHESIZED_WIRE_4),
	.a_rom(SYNTHESIZED_WIRE_1));
	defparam	b2v_inst4.Config_enderecos = 3'b001;
	defparam	b2v_inst4.Decrementar_i = 3'b100;
	defparam	b2v_inst4.Encerrar = 3'b101;
	defparam	b2v_inst4.Escrever_RAM = 3'b011;
	defparam	b2v_inst4.Inicio = 3'b000;
	defparam	b2v_inst4.Ler_ROM = 3'b010;
	defparam	b2v_inst4.maxcof = 6'b111101;


endmodule
