module moore_seq(
    input x,
    input clk,
    input rst_b,
    output y
);

    localparam S0 = 3'b000;
    localparam S1 = 3'b001;
    localparam S2 = 3'b010;
    localparam S3 = 3'b011;
    localparam S4 = 3'b100;

    reg [2:0] PresentState, NextState;

    always @(posedge clk or negedge rst_b) begin 
        if(!rst_b) PresentState <= S0;
        else PresentState <= NextState;
    end

    always @(PresentState,x) begin 
        case(PresentState)
        S0: NextState = (x)? S1:S0;
        S1: NextState = (x)? S2:S0;
        S2: NextState = (x)? S3:S4;
        S3: NextState = (x)? S3:S4;
        S4: NextState = (x)? S1:S0;
        endcase
    end

    assign y = (PresentState == S4)|(PresentState == S3);

endmodule