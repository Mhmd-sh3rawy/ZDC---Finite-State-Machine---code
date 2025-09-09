`timescale 1ns/1ps
module moore_seq_tb();

wire y; 
reg x,clk,rst_b;

moore_seq DUT(
    .x(x),
    .clk(clk),
    .rst_b(rst_b),
    .y(y)
);

initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
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
    $dumpfile("moore_detector_11.vcd");
    $dumpvars(0, moore_seq_tb);
end


endmodule