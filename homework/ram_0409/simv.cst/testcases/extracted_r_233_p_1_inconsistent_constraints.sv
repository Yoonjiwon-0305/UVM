class c_233_1;
    int i = 232;
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

program p_233_1;
    c_233_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zxzxz10xz1z0z0xz11x1x1xx1z1xz01xzzzzzzxzzzxxzzxzxzzzzxxzzzzxzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
