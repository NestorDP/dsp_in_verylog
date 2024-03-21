module top_tb;

  // Inputs
  reg [6:0] address;
  reg clock;

  // Outputs
  wire [15:0] q;

  // Instantiate the module under test
  rom dut (
    .address(address),
    .clock(clock),
    .q(q)
  );

  // Clock generation
  always #5 clock = ~clock;

	integer i;

  // Test stimulus
  initial begin
    // Initialize inputs
    address = 0;
    clock = 0;
		
    for (i = 1; i <= 64; i = i + 1) begin
			#10 address = i;
			$display("q = %d", q);
    end

    // Finish simulation
    $finish;
	end
endmodule 
