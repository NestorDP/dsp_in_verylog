// The 'top' module
module top(
  input wire	clk,     // Clock signal
  input wire	reset,     // Reset signal
  input wire	[15:0] filter_in, // Filter input
  output wire	[15:0] filter_out; // Filter output
);


wire	WIRE_0;
wire	[6:0] WIRE_1;
wire	WIRE_2;
wire	WIRE_3;
wire	[6:0] WIRE_4;
wire	[15:0] WIRE_5;



rom	module_rom(
	.clock(WIRE_0),
	.address(WIRE_1),
	.q(WIRE_5));


// firlowpass	module3(
// 	.clock_ram(WIRE_2),     
// 	.clk(clk),
// 	.clk_enable(WIRE_3),
// 	.reset(reset),
// 	.address(WIRE_4),
// 	.dados(WIRE_5),
// 	.filter_in(filter_in),
// 	.filter_out(filter_out));


fsm	module_state_machine(
	.clk(clk),
	.reset(reset),
	.clock_rom(WIRE_0),
	.clock_ram(WIRE_2),
	.wren(WIRE_3),
	.a_ram(WIRE_4),
	.a_rom(WIRE_1));
	defparam	module_state_machine.Config_enderecos = 3'b001;
	defparam	module_state_machine.Decrementar_i = 3'b100;
	defparam	module_state_machine.Encerrar = 3'b101;
	defparam	module_state_machine.Escrever_RAM = 3'b011;
	defparam	module_state_machine.Inicio = 3'b000;
	defparam	module_state_machine.Ler_ROM = 3'b010;
	defparam	module_state_machine.maxcof = 6'b111101;


endmodule
