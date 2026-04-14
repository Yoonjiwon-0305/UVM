class c_165_1;
    int i = 164;
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

program p_165_1;
    c_165_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "00x000x0z1000x00x1xxz0x0x001z0zzzxzzxxxzzzzzxzxzzxxxzzzzzzzxxzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
