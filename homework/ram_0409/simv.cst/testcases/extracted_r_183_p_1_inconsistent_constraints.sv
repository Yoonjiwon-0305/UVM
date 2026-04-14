class c_183_1;
    int i = 182;
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

program p_183_1;
    c_183_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1100z0zx1zx10000zz10z1z001xzzzzzzzzxxzzxxzxzxzxzxzzzzzxxxzxzxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
