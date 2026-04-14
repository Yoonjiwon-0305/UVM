class c_226_1;
    int i = 225;
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

program p_226_1;
    c_226_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xx1z00z11x1xxzxzzz00000z0xx10zzzxxzxzzzxxzxzxzxzxzxzxzxxxxxxxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
