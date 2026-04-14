class c_150_1;
    int i = 149;
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

program p_150_1;
    c_150_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x010xxz1101zxx1z0zx10z0zzzx01x1xxxzzzzxxzxxzzzxzzxzxxxzxzxxzxxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
