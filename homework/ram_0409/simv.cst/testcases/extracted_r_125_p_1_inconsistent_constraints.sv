class c_125_1;
    int i = 124;
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

program p_125_1;
    c_125_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xz00z0z0z0x001110x0z1011zzxzx101xzxzxzxxzzzzxzxzxxzzzxxzxxzxxxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
