/*module mealy_seq(
    input x,
    input clk,
    input rst_b,
    output y
);

    localparam S0= 1'b0;
    localparam S1= 1'b1;

    reg NextState, PresentState;

    always @(posedge clk or negedge rst_b) begin
        if(!rst_b) PresentState <= S0;
        else PresentState <= NextState;
    end

    always @(x,PresentState) begin 
        case(PresentState) 
        S0: NextState = (x)? S1:S0;
        S1: NextState = (x)? S1:S0;
        endcase
    end

    assign y = (PresentState == S1) & (x==1);

endmodule*/


module mealy_seq(
    input x,
    input clk,
    input rst_b,
    output y
);

    localparam S0 = 1'b0;
    localparam S1 = 1'b1;

    reg PresentState, NextState;

    always @(posedge clk or negedge rst_b) begin
        if(!rst_b) PresentState <= S0;
        else PresentState <= NextState;
    end

    always @(PresentState, x) begin 
        case(PresentState)
        S0: NextState = (x)? S1:S0;
        S1: NextState = (x)? S1:S0;
        endcase
    end

    assign y = (PresentState == S1) & x;


endmodule