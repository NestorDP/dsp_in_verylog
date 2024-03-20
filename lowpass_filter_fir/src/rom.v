module rom (
  input wire [6:0] address,
  input wire clock,
  output reg [15:0] q
);


  // Define your ROM contents here
  reg [15:0] rom_contents [0:2**6-1];

    // Fill in your q values here
    // 16-bit ROM with 64 address locations
  initial begin
    rom_contents[0]  = 16'b0000000000011010;
    rom_contents[1]  = 16'b0000000000010100;
    rom_contents[2]  = 16'b0000000000000110;
    rom_contents[3]  = 16'b1111111111110001;
    rom_contents[4]  = 16'b1111111111010110;
    rom_contents[5]  = 16'b1111111110111011;
    rom_contents[6]  = 16'b1111111110100111;
    rom_contents[7]  = 16'b1111111110100111;
    rom_contents[8]  = 16'b1111111111000011;
    rom_contents[9]  = 16'b0000000000000000;
    rom_contents[10] = 16'b0000000001011000;
    rom_contents[11] = 16'b0000000010111010;
    rom_contents[12] = 16'b0000000100001101;
    rom_contents[13] = 16'b0000000100110001;
    rom_contents[14] = 16'b0000000100001001;
    rom_contents[15] = 16'b0000000010000111;
    rom_contents[16] = 16'b1111111110110000;
    rom_contents[17] = 16'b1111111010100100;
    rom_contents[18] = 16'b1111110110011010;
    rom_contents[19] = 16'b1111110011011110;
    rom_contents[20] = 16'b1111110010111100;
    rom_contents[21] = 16'b1111110101110111;
    rom_contents[22] = 16'b1111111100110011;
    rom_contents[23] = 16'b0000000111101010;
    rom_contents[24] = 16'b0000010101100111;
    rom_contents[25] = 16'b0000100101001011;
    rom_contents[26] = 16'b0000110100011010;
    rom_contents[27] = 16'b0001000001001101;
    rom_contents[28] = 16'b0001001001110000;
    rom_contents[29] = 16'b0001001100101111;
    rom_contents[30] = 16'b0001001001110000;
    rom_contents[31] = 16'b0001000001001101;
    rom_contents[32] = 16'b0000110100011010;
    rom_contents[33] = 16'b0000100101001011;
    rom_contents[34] = 16'b0000010101100111;
    rom_contents[35] = 16'b0000000111101010;
    rom_contents[36] = 16'b1111111100110011;
    rom_contents[37] = 16'b1111110101110111;
    rom_contents[38] = 16'b1111110010111100;
    rom_contents[39] = 16'b1111110011011110;
    rom_contents[40] = 16'b1111110110011010;
    rom_contents[41] = 16'b1111111010100100;
    rom_contents[42] = 16'b1111111110110000;
    rom_contents[43] = 16'b0000000010000111;
    rom_contents[44] = 16'b0000000100001001;
    rom_contents[45] = 16'b0000000100110001;
    rom_contents[46] = 16'b0000000100001101;
    rom_contents[47] = 16'b0000000010111010;
    rom_contents[48] = 16'b0000000001011000;
    rom_contents[49] = 16'b0000000000000000;
    rom_contents[50] = 16'b1111111111000011;
    rom_contents[51] = 16'b1111111110100111;
    rom_contents[52] = 16'b1111111110100111;
    rom_contents[53] = 16'b1111111110111011;
    rom_contents[54] = 16'b1111111111010110;
    rom_contents[55] = 16'b1111111111110001;
    rom_contents[56] = 16'b0000000000000110;
    rom_contents[57] = 16'b0000000000010100;
    rom_contents[58] = 16'b0000000000011010;
    rom_contents[59] = 16'b0000000000011100;
    rom_contents[60] = 16'b0000000000000000;
    rom_contents[61] = 16'b0000000000000000;
    rom_contents[62] = 16'b0000000000000000;
    rom_contents[63] = 16'b0000000000000000;  
  end

  always @(posedge clock) begin
    q <= rom_contents[address];
  end

endmodule
