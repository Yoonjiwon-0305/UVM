class c_141_1;
    int i = 140;
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

program p_141_1;
    c_141_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x10zz01xx11011zz11xxzxz1zz011x1xzxzzxxzzxxxxzxzxzxxzzxzzxzzzxxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
