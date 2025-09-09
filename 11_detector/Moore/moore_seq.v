/*module moore_seq(
    input x,
    input clk,
    input rst_b,
    output y
);

    localparam S0= 2'b00;
    localparam S1= 2'b01;
    localparam S2= 2'b10;

    reg [1:0] NextState, PresentState;

    always @(posedge clk or negedge rst_b) begin 
        if(!rst_b) PresentState <= S0;
        else PresentState <= NextState;
    end

    always @(x,PresentState) begin 
        case(PresentState)
        S0: NextState = (x)? S1:S0;
        S1: NextState = (x)? S2:S0;
        S2: NextState = (x)? S2:S0;
        endcase
    end

    assign y=(PresentState==S2);

endmodule*/

module moore_seq(
    input x,
    input clk,
    input rst_b,
    output y
);

    localparam S0 = 2'b00;
    localparam S1 = 2'b01;
    localparam S2 = 2'b10;

    reg PresentState, NextState;

    always @(posedge clk or negedge rst_b) begin 
        if(!rst_b) PresentState <= S0;
        else PresentState <= NextState;
    end

    always @(PresentState,x) begin 
        case(PresentState)
        S0: NextState = (x)? S1:S0;
        S1: NextState = (x)? S2:S0;
        S2: NextState = (x)? S2:S0;
        default: 
        endcase
    end

    assign y = (PresentState == S2);


endmodule