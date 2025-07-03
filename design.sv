`timescale 1ns/1ps

module lighting_fsm (
    input clk,
    input reset,
    input [1:0] mode_select,  // 00: IDLE, 01: NORMAL, 10: DIMMING, 11: EMERGENCY
    output reg led,
    output reg [1:0] current_state,
    output reg [3:0] counter,
    output reg [7:0] state_name  // For EPWave display
);

    // Define states
    parameter IDLE = 2'b00;
    parameter NORMAL = 2'b01;
    parameter DIMMING = 2'b10;
    parameter EMERGENCY = 2'b11;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= IDLE;
            counter <= 0;
            led <= 0;
        end else begin
            current_state <= mode_select;

            case (mode_select)
                IDLE: begin
                    led <= 0;
                    counter <= 0;
                end
                NORMAL: begin
                    led <= 1;
                    counter <= counter + 1;
                end
                DIMMING: begin
                    counter <= counter + 1;
                    led <= counter[3];  // slow blink
                end
                EMERGENCY: begin
                    counter <= counter + 1;
                    led <= counter[1];  // fast blink
                end
                default: led <= 0;
            endcase
        end
    end

    // Display-friendly state name for waveform
    always @(*) begin
        case (current_state)
            IDLE:      state_name = "ID";
            NORMAL:    state_name = "NO";
            DIMMING:   state_name = "DM";
            EMERGENCY: state_name = "EM";
            default:   state_name = "XX";
        endcase
    end

endmodule
