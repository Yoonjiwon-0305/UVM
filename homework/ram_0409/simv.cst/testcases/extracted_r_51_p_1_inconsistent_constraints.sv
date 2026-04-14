class c_51_1;
    int i = 50;
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

program p_51_1;
    c_51_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zz1zxzx110zx1z10xzxx0z0x0xzzx011zxxzzzzxzxxzzxxzzxxxzxxzzxxzxxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
