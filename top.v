module top(
    input sw, // w
    output [9:0] led, // see IO table
    input btnC, // clk
    input btnU // reset
);

    wire ohZ, binaryZ;
    wire [4:0] onehotState;
    wire [2:0] binaryState;

    one_hot one_hot_inst(
        .w(sw),
        .clk(btnC),
        .reset(btnU),
        .z(ohZ),
        .state(onehotState)
    );
 
    binary binary_inst(
        .w(sw),
        .clk(btnC),
        .reset(btnU),
        .z(binaryZ),
        .state(binaryState)
    );
    
    assign led[0] = ohZ;
    assign led[1] = binaryZ;
    assign led[6:2] = onehotState;
    assign led[9:7] = binaryState;

endmodule