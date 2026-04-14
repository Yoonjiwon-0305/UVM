class c_65_1;
    int i = 64;
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

program p_65_1;
    c_65_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1001x1xx0z0xx0x1x11zz00z0zx11110zzxzzxxxxzzzxxxzxzzxxzxzxxzxxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
