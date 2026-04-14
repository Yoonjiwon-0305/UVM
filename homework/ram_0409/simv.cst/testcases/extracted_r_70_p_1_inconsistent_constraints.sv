class c_70_1;
    int i = 69;
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

program p_70_1;
    c_70_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "000zxx0xzz0zzxxz1x00x0z1000z0z0zzzzzzzxxzzzxzxzxxzzxzxxxzxxxxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
