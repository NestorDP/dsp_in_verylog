module fsm(
  input clk,
  input reset,
  output reg [6:0] a_rom,
  output reg [6:0] a_ram,
  output reg clock_rom,
  output reg clock_ram,
  output reg wren
);
						
// Parameters for state machine
parameter maxcof = 6'd61,  // Change the value for each filter

// Define FSM states as an enumerated type
typedef enum reg [2:0] {
  Init        = 3'b000, // Initial state
  ConfigAddrs = 3'b001, // Configuration address state
  ReadRom     = 3'b010, // Read from ROM state
  WriteRam    = 3'b011, // Write to RAM state
  Decrese     = 3'b100, // Decrease state
  Finish      = 3'b101  // Finish state
} fsm_state_t;

// Declare current and next state variables of the enumerated type
fsm_state_t current_state, next_state;

reg [5:0] i;

//reg estado
always @ (posedge clk)
begin
		if(reset)
		begin
				current_state <= Init;
				i <= maxcof;
		end
		else
		begin
				current_state <= next_state;
				if(next_state == Decrese)
					i <= i - 1;
		end			
end	


//dec proximo estado
always @ (*)
begin
		case(current_state)
				Init:					next_state = ConfigAddrs;
				ConfigAddrs:	next_state = ReadRom;
				ReadRom:			next_state = WriteRam;
				WriteRam:			next_state = Decrese;
				Decrese: 	begin
							if(i == maxcof + 1)
											next_state = Finish;
							else
											next_state = ConfigAddrs;
							end
				Finish:  			next_state = Finish;
				default:  		next_state = Init;
		endcase
end


//	dec saida
always @ (*)
begin
		//default atribuations
		clock_rom = 0;
		clock_ram = 0;
		wren = 0;
		a_ram = 0;
		a_rom = 0;
		case(current_state)
				Init:		begin
							a_rom = maxcof;
							a_ram = maxcof;
							wren = 0;
						end
				ConfigAddrs: begin
							a_rom = maxcof - i;
							a_ram = maxcof - i;
						end
				ReadRom:	begin
							a_rom = maxcof - i;
							a_ram = maxcof - i;
							clock_rom = 1;
						end
				WriteRam:	begin
							a_ram = maxcof - i;
							clock_ram = 1;
						end
				Finish: 	begin
							wren = 1;
						end
		endcase
end
endmodule
