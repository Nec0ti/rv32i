module reg (
    input wire clk,
    input wire RegWrite, // yetki
    input wire [4:0] ReadReg1,
    input wire [4:0] ReadReg2,
    input wire [4:0] WriteReg, // adres
    input wire [31:0] WriteData, // 32 bit data
    output wire [31:0] ReadData1,
    output wire [31:0] ReadData2
 );

    reg [31:0] registers [0:31];

    assign ReadData1 = (ReadReg1 == 5'd0) ? 32'd0 : registers[ReadReg1];
    assign ReadData2 = (ReadReg2 == 5'd0) ? 32'd0 : registers[ReadReg2];

    always @(posedge clk) begin
        if (RegWrite && (WriteReg != 5'd0)) begin
            registers[WriteReg] <= WriteData;
        end
    end

endmodule