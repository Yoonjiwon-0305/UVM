class c_156_1;
    int i = 155;
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

program p_156_1;
    c_156_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xxzx1x1x0111zzzxx0100z101x00zx01xxzzzxzxzzzxxxxzxxxzxzxxzxzxzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
