module testbench;
    reg clk;
    reg [3:0] duty1 = 4'd4, duty2 = 4'd8, duty3 = 4'd12, duty4 = 4'd15;
    reg [1:0] sel;
    wire pwm1, pwm2, pwm3, pwm4, led_out;

    // Clock generator
    always #5 clk = ~clk;

    // Instantiate PWM Generators
    pwm_generator PWM1(clk, duty1, pwm1);
    pwm_generator PWM2(clk, duty2, pwm2);
    pwm_generator PWM3(clk, duty3, pwm3);
    pwm_generator PWM4(clk, duty4, pwm4);

    // Instantiate MUX
    led_mux MUX(sel, pwm1, pwm2, pwm3, pwm4, led_out);

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, testbench);
        clk = 0;
        sel = 2'b00;

        #50 sel = 2'b01;
        #50 sel = 2'b10;
        #50 sel = 2'b11;
        #100 $finish;
    end
endmodule
