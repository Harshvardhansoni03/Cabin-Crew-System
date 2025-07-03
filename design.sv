module pwm_generator(
    input clk,
    input [3:0] duty_cycle,
    output reg pwm_out
);
    reg [3:0] counter = 0;

    always @(posedge clk) begin
        counter <= counter + 1;
        pwm_out <= (counter < duty_cycle) ? 1 : 0;
    end
endmodule

module led_mux(
    input [1:0] sel,
    input pwm1, pwm2, pwm3, pwm4,
    output reg led_out
);
    always @(*) begin
        case(sel)
            2'b00: led_out = pwm1;
            2'b01: led_out = pwm2;
            2'b10: led_out = pwm3;
            2'b11: led_out = pwm4;
        endcase
    end
endmodule
