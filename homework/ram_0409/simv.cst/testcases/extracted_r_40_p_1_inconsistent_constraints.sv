class c_40_1;
    int i = 39;
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

program p_40_1;
    c_40_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "10x1xzz1z00zz0000z1x1001xxz0z0xxxzzxxzzzzzxzzxzzzzzxxzzzzxzzxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
