class c_178_1;
    int i = 177;
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

program p_178_1;
    c_178_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z0x0z11z0111zxz0zx0zxz0000zzz0xzzzxxzxxzxzzxxxxzxxxzxxzzxzxxzzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
