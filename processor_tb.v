module processor_tb();
	reg [15:0]DIN;
	reg Resetn;
	reg Clock;
	reg Run;
	wire Done;
	wire [15:0]BusWires;
		
		cute_processor dut (
		.DIN(DIN),
		.Resetn(Resetn),
		.Clock(Clock),
		.Run(Run),
		.Done(Done),
		.BusWires(BusWires));
		
		initial
		begin
			Resetn = 0;
			#20 Resetn = 1;
		end

		initial
		begin
			Clock = 0;
			#10 Clock = 1;
			forever #(10) Clock = ~Clock;
		end
		initial
		begin
			#0 Run = 0; DIN = 16'h0000;
			#20 Run = 1; DIN = 16'h2000;
			#20 Run = 0; DIN = 16'h0005;
		end
		initial
		begin
			#60 Run = 1; DIN = 16'h0400;
			#20 Run = 0; DIN = 16'h0400;
		end
		initial
		begin
			#100 Run = 1; DIN=16'h4080;
			#20 Run =0 ; DIN=16'h4080;
		end
		initial	
		begin
			#180 Run = 1; DIN=16'h6000;
			#20 Run = 0; DIN=16'h0000;
		end
		initial
		begin
			$dumpfile("cute_proc.vcd"); $dumpvars(0, processor_tb);

		end
endmodule
