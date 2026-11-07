module alu (
    input wire [31:0] A,
    input wire [31:0] B,
    input wire [3:0] Sel,
    output reg [31:0] Out,
    output wire [0:0] Zero
);

always @(*) begin
    case (Sel)
        4'b0000: Out = A + B; // toplama
        4'b0001: Out = A - B; // cikarma
        4'b0010: Out = A & B; // mantiksal ve
        4'b0011: Out = A | B; // mantiksal veya
        4'b0100: Out = A ^ B; // mantiksal xor

        4'b0101: begin
                if ($signed(A) < $signed(B))
                    Out = 1;
                else
                    Out = 0;
        end // SLT 
        
        4'b0110: Out = A << B [4:0]; // SLL
        4'b0111: Out = A >> B [4:0]; // SRL
        4'b1000: Out = $signed(A) >>> B[4:0]; //SRA

        4'b1001: begin
            if (A < B)
                Out = 1;
            else
                Out = 0;
        end //SLTU

        default: Out = 32'd0;
    endcase
end

assign Zero = (Out == 32'd0);

endmodule