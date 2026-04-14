class c_122_1;
    int i = 121;
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

program p_122_1;
    c_122_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "001z1z0x00z1x1x00x10xx1x10z10000zzzzzxzxxzxzzxxxzzzzzzxzzzxxzzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
