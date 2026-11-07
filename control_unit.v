module control_unit (
    output reg RegWrite,
    output reg [3:0] ALUControl,

    input wire [6:0] opcode
    input wire [2:0] funct3
    input wire [6:0] funct7
);

    always @(*) begin
        if (opcode == 7'b0100110) begin
            module.alu
        end
    end
        
endmodule