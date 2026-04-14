class c_96_1;
    int i = 95;
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

program p_96_1;
    c_96_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xxzxx0000x0z100x1x00zzz101z0zx01zxxzxzxxzxzzxxzxxzxxzzzzxzxxzzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
