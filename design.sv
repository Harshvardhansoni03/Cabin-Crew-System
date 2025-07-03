`timescale 1ns/1ps

module led_control (
    input clk,
    input reset,
    output reg [3:0] leds
);

always @(posedge clk or posedge reset) begin
    if (reset)
        leds <= 4'b0000;
    else
        leds <= leds + 1;
end

endmodule
