class c_237_1;
    int i = 236;
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

program p_237_1;
    c_237_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "11x111x01x1zxxxzz101xzx1zzx0x0xzzxxxxxzzzxxzzzxzzxxzzxzxxxxzxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
