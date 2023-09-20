module suma (
		input logic a,
		input logic b,
		input logic cin,
		output logic cout,
		output logic result
);
	assign {cout, result} = a + b + cin;
             
endmodule