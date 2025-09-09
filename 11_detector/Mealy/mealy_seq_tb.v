`timescale 1ns/1ps
module mealy_seq_tb();

reg clk,x,rst_b;
wire y;

mealy_seq DUT(
    .x(x),
    .y(y),
    .clk(clk),
    .rst_b(rst_b)  
);

initial begin
    clk = 1'b0;
    forever begin
        #5 clk = ~clk;
    end    
end

initial begin 
    rst_b = 1'b0;
    x = 1'b0;

    #3 x=1'b0; rst_b = 1'b1;
    #10 x=1'b1;
    #10 x=1'b0;
    #10 x=1'b1;
    #10 x = 1'b1;
    #10 x = 1'b1;
    #5 $finish;
end

initial begin
    $dumpfile("mealy_detector_11.vcd");
    $dumpvars(0, mealy_seq_tb);
end

endmodule