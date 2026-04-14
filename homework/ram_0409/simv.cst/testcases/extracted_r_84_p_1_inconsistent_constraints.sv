class c_84_1;
    int i = 83;
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

program p_84_1;
    c_84_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zzxxz1xx1100101x00zx1z010zz1zz01xxxzzzxzzzxzxzxxzzxxzzxzxxzxxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
