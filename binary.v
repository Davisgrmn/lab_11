module binary(
    input w,
    input clk,
    input reset,
    output z,
    output [2:0] state
);

    wire [2:0] State;
    wire [2:0] Next;

    dff zero(
        .Default(1'b0),
        .D(Next[0]),
        .clk(clk),
        .Q(State[0]),
        .reset(reset)
    );

    dff one(
        .Default(1'b0),
        .D(Next[1]),
        .clk(clk),
        .Q(State[1]),
        .reset(reset)
    );
    
    dff two(
        .Default(1'b0),
        .D(Next[2]),
        .clk(clk),
        .Q(State[2]),
        .reset(reset)
    );

    assign z = State[2] | (State[1] & ~State[0]);
    assign Next[0] = (~State[1] & ~State[0] & ~w) | (State[1] & State[0] & ~w) | (~State[1] & w & ~State[2]) | (State[1] & ~State[0] & w);
    assign Next[1] = (State[1] ^ State[0]) | (w & ~State[2] & ~State[1]);
    assign Next[2] = (w & State[2]) | (State[1] & State[0] & w);
    assign state = State;

endmodule