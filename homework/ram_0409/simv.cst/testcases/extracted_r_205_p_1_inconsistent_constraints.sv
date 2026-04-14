class c_205_1;
    int i = 204;
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

program p_205_1;
    c_205_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1zz0z1zzxz1zz11x0x1x0xx101z100xzxxzzxzxzzxzxxxxzxxzxxzxzzxzzxxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
