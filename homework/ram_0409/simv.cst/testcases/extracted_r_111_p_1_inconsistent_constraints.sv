class c_111_1;
    int i = 110;
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

program p_111_1;
    c_111_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1010zxx0x0xxz11z11z00x1x0xxz0x1zxxzxzzxxzxzzxzxxxxxzzzzzzzzzzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
