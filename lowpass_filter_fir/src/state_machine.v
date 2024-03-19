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
  INITIAL           = 3'b000, // Initial state
  ADDRESS           = 3'b001, // Configuration address state
  READ_ROM          = 3'b010, // Read from ROM state
  WRITE_SIGNAL      = 3'b011, // Write to RAM state
  DECREASE_ADDRESS  = 3'b100, // Decrease state
  FINISH            = 3'b101  // FINISH state
} fsm_state_t;

// Declare current and next state variables of the enumerated type
fsm_state_t current_state, next_state;

reg [5:0] i;

//reg estado
always @ (posedge clk) begin
  if(reset) begin
    current_state <= INITIAL;
    i <= maxcof;
  end
  else begin
    current_state <= next_state;
    if(next_state == Decrese)
      i <= i - 1;
  end			
end	


// Determine the next state
always @ (*) begin
  case(current_state)
    INITIAL:     
      next_state = ADDRESS;       // Transition to ADDRESS state
    ADDRESS:    
      next_state = READ_ROM;      // Transition to READ_ROM state
    READ_ROM:    
      next_state = WRITE_SIGNAL;  // Transition to WRITE_SIGNAL state
    WRITE_SIGNAL:
      next_state = DECREASE;      // Transition to DECREASE state
    DECREASE: begin
      if(i == maxcof + 1) 
        next_state = FINISH;      // Transition to FINISH state if i equals maxcof + 1
      else
        next_state = ADDRESS;     // Otherwise, transition back to ADDRESS state
    end
    FINISH:  
      next_state = FINISH;        // Remain in FINISH state
    default:  
      next_state = INITIAL;       // Default to INITIAL state
  endcase
end


//	dec saida
always @ (*) begin
  //default atribuations
  clock_rom = 0;
  clock_ram = 0;
  wren = 0;
  a_ram = 0;
  a_rom = 0;
  case(current_state)
  INITIAL:		begin
    a_rom = maxcof;
    a_ram = maxcof;
    wren = 0;
  end
  ADDRESS: begin
    a_rom = maxcof - i;
    a_ram = maxcof - i;
  end
  READ_ROM:	begin
    a_rom = maxcof - i;
    a_ram = maxcof - i;
    clock_rom = 1;
  end
  WRITE_SIGNAL:	begin
    a_ram = maxcof - i;
    clock_ram = 1;
  end
  FINISH: 	begin
    wren = 1;
  end
  endcase
end
endmodule
