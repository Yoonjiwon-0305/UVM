class c_252_1;
    int i = 251;
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

program p_252_1;
    c_252_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0001x1111xzz0xxz01000101x0000001zzxzzzxzxxzxzzxxzxzzzxzzzxzzxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
