class c_147_1;
    int i = 146;
    rand bit[7:0] addr; // rand_mode = ON 

    constraint r_addr_this    // (constraint_mode = ON) (./tb/ram_seq_item.sv:14)
    {
       (addr inside {[8'h0:8'hf]});
    }
    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (./tb/ram_sequence.sv:102)
    {
       (addr == i);
    }
endclass

program p_147_1;
    c_147_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z1xxx0zzx00100xxz11zx1xxz0xx000xxzxxzzzzxzzzzxzzzxzzzzxxxxxxzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
