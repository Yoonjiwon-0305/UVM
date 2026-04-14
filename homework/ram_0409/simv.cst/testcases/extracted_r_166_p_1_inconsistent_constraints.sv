class c_166_1;
    int i = 165;
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

program p_166_1;
    c_166_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0zx00100z0x1000z0zx100z1z11xxx01zxxzxxzxzzzxxzxzxxxzxxzzzxzxzzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
