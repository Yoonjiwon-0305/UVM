class c_108_1;
    int i = 107;
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

program p_108_1;
    c_108_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zz0xxx1z0x01zz1z10zx1xzz011x11x0xxzxxzzxzxzzxzxxxxxzzzzzxxzzxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
