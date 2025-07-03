`timescale 1ns/1ps

module tb_led_control;

reg clk;
reg reset;
wire [3:0] leds;

led_control uut (
    .clk(clk),
    .reset(reset),
    .leds(leds)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Simulation and waveform
initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_led_control);

    reset = 1;
    #20;
    reset = 0;
    #100;
    $finish;
end

endmodule
