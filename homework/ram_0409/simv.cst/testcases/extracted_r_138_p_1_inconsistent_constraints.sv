class c_138_1;
    int i = 137;
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

program p_138_1;
    c_138_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x1zzxzxx01x1z11x1z11x10xz10xz1xzxxzzzxzzxxxzxxzxxxxxzxxzxxzxzzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
