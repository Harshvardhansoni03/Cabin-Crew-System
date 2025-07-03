`timescale 1ns/1ps
module tb_lighting_fsm;
    reg clk;
    reg reset;
    reg [1:0] mode_select;
    wire led;
    wire [1:0] current_state;
    wire [3:0] counter;
    wire [7:0] state_name;
    lighting_fsm uut (
        .clk(clk),
        .reset(reset),
        .mode_select(mode_select),
        .led(led),
        .current_state(current_state),
        .counter(counter),
        .state_name(state_name)
    );
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  
    end
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_lighting_fsm);
        reset = 1;
        mode_select = 2'b00;
        #10 reset = 0;
        #10 mode_select = 2'b01;
        $display("[%0t ns] Entered NORMAL mode", $time/1000);
        #40 mode_select = 2'b10;
        $display("[%0t ns] Entered DIMMING mode", $time/1000);
        #40 mode_select = 2'b11;
        $display("[%0t ns] Entered EMERGENCY mode", $time/1000);
        #40 mode_select = 2'b00;
        $display("[%0t ns] Returned to IDLE mode", $time/1000);

        #20 $finish;
    end

endmodule
